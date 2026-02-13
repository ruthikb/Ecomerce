package com.xworkz.ecomerceApp.controller;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import com.itextpdf.text.pdf.draw.LineSeparator;
import com.xworkz.ecomerceApp.dto.AddCustomerDto;
import com.xworkz.ecomerceApp.dto.ProductNameDto;
import com.xworkz.ecomerceApp.dto.PurchaseDto;
import com.xworkz.ecomerceApp.service.AddCoustomerService;
import com.xworkz.ecomerceApp.service.ProductService;
import com.xworkz.ecomerceApp.dto.enums.CustomerType;
import com.xworkz.ecomerceApp.entity.AddCustomerEntity;
import com.xworkz.ecomerceApp.entity.ProductNameEntity;
import com.xworkz.ecomerceApp.entity.PurchaseEntity;
import com.xworkz.ecomerceApp.service.PurchaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.w3c.dom.stylesheets.LinkStyle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/")
public class PurchaseController{

    @Autowired
    AddCoustomerService service;

    @Autowired
    PurchaseService  purchaseService;

    @Autowired
    ProductService productService;
    @GetMapping("/addPurchase")
    public String showPurchasePage(@RequestParam(defaultValue = "Purchase") String voucherType,
                                   @RequestParam(required = false) String customerName,
                                   Model model) {

       // Fetch full product entities (id + name) so we can render option value as id and display name
       List<ProductNameEntity> productGroups = productService.getAllProductNames();
        System.err.println(productGroups);
        List<AddCustomerDto> customers = service.fetchAllCustomers();
        System.err.println(customers);

        model.addAttribute("productGroups", productGroups);
        model.addAttribute("voucherType", voucherType);
        model.addAttribute("customers", customers);
        model.addAttribute("customerName", customerName);
        return "purchasePage";
    }

    @PostMapping("/savePurchase")
    public String savePurchase(@ModelAttribute PurchaseDto dto,Model model) {
        boolean saved = purchaseService.savePurchase(dto);
        if (saved) {
            model.addAttribute("message", "Purchase Order Saved Successfully as PENDING!");
        } else {
           model.addAttribute("message", "Failed to save purchase.");
        }
        return "User";
    }
    @GetMapping("/viewPurchase")
    public String viewPurchases(Model model) {
        model.addAttribute("purchases", purchaseService.getAllPurchases());
        return "viewPurchase";
    }
    @GetMapping("/pendingOrders")
    public @ResponseBody List<PurchaseEntity> getPendingOrders(String status) {
        System.err.println("pending order api called with status: " + status);
        return purchaseService.getPendingPurchases();
    }

    @GetMapping("/notification")
    public  String showNotification(Model model,@RequestParam (required = false)String  status) {
        if (status==null || status.isEmpty()) {
            status = "PENDING"; // Default to PENDING if no status is provided
        }
        model.addAttribute("pendingOrders", purchaseService.getPendingPurchases());
        return "notification";
    }
    @PostMapping("/approved")
    public String approvePurchase(@RequestParam long id) {
       PurchaseEntity purchaseEntity= purchaseService.markAsApproved(id);
        return "Admin";
    }
    @PostMapping("/rejected")
    public String rejectPurchase(@RequestParam("id") long id) {
       PurchaseEntity purchaseEntity= purchaseService.markAsRejected(id);
        return "Admin";
    }
    @GetMapping("/downloadPurchase")
    public void downloadPurchase(@RequestParam("id") int id,
                                 HttpServletResponse response,
                                 HttpServletRequest request) throws Exception {

        PurchaseEntity purchase = purchaseService.findById(id);

        if (purchase == null || !"APPROVED".equals(purchase.getStatus())) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN,
                    "Invoice available only for approved purchases");
            return;
        }

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition",
                "attachment; filename=Invoice_" + id + ".pdf");

        Document document = new Document(PageSize.A4, 36, 36, 80, 50);
        PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());

        // Watermark
        writer.setPageEvent(new PdfPageEventHelper() {
            @Override
            public void onEndPage(PdfWriter writer, Document document) {
                PdfContentByte canvas = writer.getDirectContentUnder();
                Font watermarkFont = new Font(Font.FontFamily.HELVETICA, 60, Font.BOLD, new BaseColor(230, 230, 230));
                Phrase watermark = new Phrase("APPROVED", watermarkFont);

                ColumnText.showTextAligned(canvas,
                        Element.ALIGN_CENTER,
                        watermark,
                        297, 421, 45);

                ColumnText.showTextAligned(writer.getDirectContent(),
                        Element.ALIGN_CENTER,
                        new Phrase("Page " + writer.getPageNumber()),
                        297, 20, 0);
            }
        });

        document.open();

        // ===== FONTS =====
        Font titleFont = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD);
        Font headerFont = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.WHITE);
        Font normalFont = new Font(Font.FontFamily.HELVETICA, 11);
        Font boldFont = new Font(Font.FontFamily.HELVETICA, 11, Font.BOLD);

        // ===== LOGO =====
        try {
            String logoPath = request.getServletContext().getRealPath("/resources/logo.png");
            Image logo = Image.getInstance(logoPath);
            logo.scaleToFit(100, 60);
            logo.setAlignment(Image.ALIGN_LEFT);
            document.add(logo);
        } catch (Exception e) {
            // If logo missing, continue
        }

        // ===== COMPANY HEADER =====
        Paragraph company = new Paragraph("E-Commerce Portal Pvt Ltd", titleFont);
        company.setAlignment(Element.ALIGN_RIGHT);
        document.add(company);

        document.add(new Paragraph("Bangalore, India | support@eportal.com", normalFont));
        document.add(new Paragraph(" "));
        document.add(new LineSeparator());
        document.add(new Paragraph(" "));

        // ===== CUSTOMER DETAILS =====
        document.add(new Paragraph("Invoice ID: " + purchase.getId(), boldFont));
        document.add(new Paragraph("Date: " + new java.util.Date(), normalFont));
        document.add(new Paragraph("Customer: " + purchase.getCustomer().getCustomerName(), normalFont));
        document.add(new Paragraph("Due Date: " + purchase.getOrderDueDate(), normalFont));
        document.add(new Paragraph(" "));

        // ===== TABLE =====
        PdfPTable table = new PdfPTable(6);
        table.setWidthPercentage(100);
        table.setSpacingBefore(10f);

        String[] headers = {"Item", "Product Group","Make", "Model", "Price", "Qty", "Total",};

        for (String h : headers) {
            PdfPCell cell = new PdfPCell(new Phrase(h, headerFont));
            cell.setBackgroundColor(new BaseColor(0, 102, 204));
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(8);
            table.addCell(cell);
        }

        double price = purchase.getPurchasePrice();
        int qty = purchase.getOpeningBalance();
        double subtotal = price * qty;
        double gst = subtotal * 0.18;
        double grandTotal = subtotal + gst;

        table.addCell(new Phrase(purchase.getItemName(), normalFont));
        table.addCell(new Phrase(purchase.getMake(), normalFont));
        table.addCell(new Phrase(purchase.getModel(), normalFont));
        table.addCell(new Phrase("₹ " + price, normalFont));
        table.addCell(new Phrase(String.valueOf(qty), normalFont));
        table.addCell(new Phrase("₹ " + subtotal, normalFont));

        document.add(table);
        document.add(new Paragraph(" "));

        // ===== TOTAL SECTION =====
        PdfPTable totalTable = new PdfPTable(2);
        totalTable.setWidthPercentage(40);
        totalTable.setHorizontalAlignment(Element.ALIGN_RIGHT);

        totalTable.addCell(new PdfPCell(new Phrase("Subtotal", boldFont)));
        totalTable.addCell(new PdfPCell(new Phrase("₹ " + subtotal)));

        totalTable.addCell(new PdfPCell(new Phrase("GST (18%)", boldFont)));
        totalTable.addCell(new PdfPCell(new Phrase("₹ " + gst)));

        totalTable.addCell(new PdfPCell(new Phrase("Grand Total", boldFont)));
        totalTable.addCell(new PdfPCell(new Phrase("₹ " + grandTotal, boldFont)));

        document.add(totalTable);
        document.add(new Paragraph(" "));

        // ===== SIGNATURE =====
        document.add(new Paragraph(" "));
        document.add(new Paragraph("Authorized Signature", boldFont));
        document.add(new Paragraph("_________________________", normalFont));

        document.add(new Paragraph(" "));
        document.add(new Paragraph("Thank you for your business!", boldFont));

        document.close();
    }


//    @GetMapping("/notifications")
//    public String showNotifications(Model model) {
//        model.addAttribute("pendingOrders", purchaseService.getPendingPurchases());
//        return "Admin";
//    }


//    @GetMapping("/addPurchase")
//    public String ShowPurchasePage(@RequestParam(defaultValue = "Purchase") String CustomerType,
//            @RequestParam(required = false)String CustomerName,
//            Model model){
//       List<AddCustomerEntity> customers= service.findAllDebitCustomers();
//
//       List<ProductNameEntity> productNameDtos=productService.findAllProductNames();
//        System.err.println(customers);
//        System.err.println(productNameDtos);
//
//    model.addAttribute("customers",customers);
//    model.addAttribute("products",productNameDtos);
//
//    model.addAttribute("purchaseDto",new PurchaseDto());
//
//        return "purchasePage";
//    }
//    @PostMapping("savePurchase")
//    public String savePurchase(@ModelAttribute PurchaseDto dto, Model model) {
//        boolean saved = purchaseService.savePurchase(dto);
//        if (saved) {
//            model.addAttribute("message", "Order Saved Successfully as PENDING!");
//        }
//        else {
//            model.addAttribute("message", "Failed to save purchase.");
//        }
//        return "PurchasePage";
//    }
}

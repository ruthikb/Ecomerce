package com.xworkz.ecomerceApp.service.impl;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.xworkz.ecomerceApp.dto.SalesDto;
import com.xworkz.ecomerceApp.entity.PurchaseEntity;
import com.xworkz.ecomerceApp.service.InvoiceService;
import lombok.extern.slf4j.Slf4j;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.springframework.stereotype.Service;

import java.io.ByteArrayOutputStream;
import java.io.File;

@Slf4j
@Service
public class InvoiceServiceImpl implements InvoiceService {

    // ================= PURCHASE INVOICE =================
    @Override
    public byte[] generateInvoiceForPurchase(PurchaseEntity p) {

        ByteArrayOutputStream out = new ByteArrayOutputStream();

        try {

            Document document = new Document();
            PdfWriter.getInstance(document, out);

            document.open();

            Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18);
            Font headerFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12);
            Font normalFont = FontFactory.getFont(FontFactory.HELVETICA, 11);

            // ===== COMPANY HEADER =====
            Paragraph company = new Paragraph("TECHBRIDGE SUPPLY SYSTEM", titleFont);
            company.setAlignment(Element.ALIGN_CENTER);
            document.add(company);

            Paragraph tagLine = new Paragraph("Enterprise Solutions\n\n", normalFont);
            tagLine.setAlignment(Element.ALIGN_CENTER);
            document.add(tagLine);

            // ===== INVOICE INFO =====
            document.add(new Paragraph("Invoice No : INV-" + p.getId(), headerFont));
            document.add(new Paragraph("Invoice Date : " + java.time.LocalDate.now()));
            document.add(new Paragraph("\n"));

            // ===== CUSTOMER =====
            document.add(new Paragraph("Bill To:", headerFont));
            document.add(new Paragraph("Customer Name : " + p.getCustomer()));
            document.add(new Paragraph("\n"));

            // ===== TABLE =====
            PdfPTable table = new PdfPTable(5);
            table.setWidthPercentage(50);

            table.addCell("Item Name");
            table.addCell("Product Code");
            table.addCell("Quantity");
            table.addCell("Unit Price");
            table.addCell("Total");

            table.addCell(p.getItemName());
            table.addCell(p.getProductCode());
            table.addCell(String.valueOf(p.getOpeningBalance()));
            table.addCell("₹ " + p.getOpeningBalance());
            table.addCell("₹ " + p.getPurchasePrice());

            document.add(table);

            // ===== TOTAL =====
            document.add(new Paragraph("\nTotal Amount : ₹ " + p.getPurchasePrice(), headerFont));
            document.add(new Paragraph("Status : " + p.getStatus(), headerFont));

            // ===== FOOTER =====
            document.add(new Paragraph("\nThank you for your business!", normalFont));
            document.add(new Paragraph("This is a system generated invoice.", normalFont));

            document.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return out.toByteArray();
    }

    // ================= SALES INVOICE =================
    @Override
    public File generateInvoicePdfForSales(SalesDto salesDto) {

        File file = new File("Invoice_" + System.currentTimeMillis() + ".pdf");

        try (PDDocument document = new PDDocument()) {

            PDPage page = new PDPage();
            document.addPage(page);

            PDPageContentStream content = new PDPageContentStream(document, page);

            int startX = 50;
            int startY = 750;

            // ===== HEADER =====
            content.setFont(PDType1Font.HELVETICA_BOLD, 20);
            content.beginText();
            content.newLineAtOffset(startX, startY);
            content.showText("TechBridge Solutions");
            content.endText();

            content.setFont(PDType1Font.HELVETICA, 12);
            content.beginText();
            content.newLineAtOffset(startX, startY - 20);
            content.showText("Xworkz ODC, Bengaluru, India");
            content.newLineAtOffset(0, -15);
            content.showText("Email: kruthik693@gmail.com");
            content.newLineAtOffset(0, -15);
            content.showText("Phone: +91 9113840336");
            content.endText();

            // ===== INVOICE TITLE =====
            content.setFont(PDType1Font.HELVETICA_BOLD, 18);
            content.beginText();
            content.newLineAtOffset(420, startY);
            content.showText("INVOICE");
            content.endText();

            content.beginText();
            content.setFont(PDType1Font.HELVETICA, 12);
            content.newLineAtOffset(420, startY - 20);
            content.showText("Invoice NO: " + System.currentTimeMillis());
            content.newLineAtOffset(0, -15);
            content.showText("Date: " + salesDto.getSalesDate());
            content.endText();

            // ===== BILL TO =====
            content.setFont(PDType1Font.HELVETICA_BOLD, 14);
            content.beginText();
            content.newLineAtOffset(startX, 660);
            content.showText("Bill To");
            content.endText();

            content.setFont(PDType1Font.HELVETICA, 12);
            content.beginText();
            content.newLineAtOffset(startX, 640);
            content.showText("Customer: " + salesDto.getCustomerId());
            content.newLineAtOffset(0, -15);
            content.showText("Email: " + salesDto.getEmail());
            content.endText();

            // ===== TABLE =====
            int tableY = 550;
            int rowHeight = 25;

            int col1 = 50;
            int col2 = 100;
            int col3 = 300;
            int col4 = 380;
            int col5 = 460;
            int tableEnd = 540;

            // Header border
            content.addRect(col1, tableY, tableEnd - col1, rowHeight);
            content.stroke();

            // Vertical lines
            content.moveTo(col2, tableY);
            content.lineTo(col2, tableY + rowHeight);
            content.stroke();

            content.moveTo(col3, tableY);
            content.lineTo(col3, tableY + rowHeight);
            content.stroke();

            content.moveTo(col4, tableY);
            content.lineTo(col4, tableY + rowHeight);
            content.stroke();

            content.moveTo(col5, tableY);
            content.lineTo(col5, tableY + rowHeight);
            content.stroke();

            // Header text
            content.setFont(PDType1Font.HELVETICA_BOLD, 12);

            content.beginText();
            content.newLineAtOffset(col1 + 10, tableY + 8);
            content.showText("SL");
            content.endText();

            content.beginText();
            content.newLineAtOffset(col2 + 10, tableY + 8);
            content.showText("Product");
            content.endText();

            content.beginText();
            content.newLineAtOffset(col3 + 10, tableY + 8);
            content.showText("Qty");
            content.endText();

            content.beginText();
            content.newLineAtOffset(col4 + 10, tableY + 8);
            content.showText("Price");
            content.endText();

            content.beginText();
            content.newLineAtOffset(col5 + 10, tableY + 8);
            content.showText("Total");
            content.endText();

            // ===== DATA ROW =====
            int rowY = tableY - rowHeight;

            content.addRect(col1, rowY, tableEnd - col1, rowHeight);
            content.stroke();

            content.moveTo(col2, rowY);
            content.lineTo(col2, rowY + rowHeight);
            content.stroke();

            content.moveTo(col3, rowY);
            content.lineTo(col3, rowY + rowHeight);
            content.stroke();

            content.moveTo(col4, rowY);
            content.lineTo(col4, rowY + rowHeight);
            content.stroke();

            content.moveTo(col5, rowY);
            content.lineTo(col5, rowY + rowHeight);
            content.stroke();

            content.setFont(PDType1Font.HELVETICA, 12);

            content.beginText();
            content.newLineAtOffset(col1 + 10, rowY + 8);
            content.showText("1");
            content.endText();

            content.beginText();
            content.newLineAtOffset(col2 + 10, rowY + 8);
            content.showText(salesDto.getProductGroupId());
            content.endText();

            content.beginText();
            content.newLineAtOffset(col3 + 10, rowY + 8);
            content.showText(String.valueOf(salesDto.getQuantity()));
            content.endText();

            content.beginText();
            content.newLineAtOffset(col4 + 10, rowY + 8);
            content.showText(String.valueOf(salesDto.getSellingPrice()));
            content.endText();

            content.beginText();
            content.newLineAtOffset(col5 + 10, rowY + 8);
            content.showText(String.valueOf(salesDto.getTotalAmount()));
            content.endText();

            // ===== TOTAL BOX =====
            int totalBoxY = rowY - 70;

            content.addRect(360, totalBoxY, 170, 50);
            content.stroke();

            content.beginText();
            content.setFont(PDType1Font.HELVETICA, 13);
            content.newLineAtOffset(370, totalBoxY + 30);
            content.showText("Grand Total: Rs. " + salesDto.getTotalAmount());
            content.endText();

//            content.beginText();
//            content.setFont(PDType1Font.HELVETICA_BOLD, 13);
//            content.newLineAtOffset(370, totalBoxY + 12);
//            content.showText("Grand Total: Rs. " + salesDto.getTotalAmount());
//            content.endText();

            // ===== FOOTER =====
            content.beginText();
            content.setFont(PDType1Font.HELVETICA_OBLIQUE, 11);
            content.newLineAtOffset(startX, 80);
            content.showText("Thank you for your business!");
            content.newLineAtOffset(0, -15);
            content.showText("This is a computer generated invoice.");
            content.endText();

            content.close();

            document.save(file);

        } catch (Exception e) {
            log.error("Invoice generation failed", e);
        }

        return file;
    }
}
package com.xworkz.ecomerceApp.controller;

import com.xworkz.ecomerceApp.dto.AddCustomerDto;
import com.xworkz.ecomerceApp.dto.ProductNameDto;
import com.xworkz.ecomerceApp.dto.SalesDto;
import com.xworkz.ecomerceApp.entity.AddCustomerEntity;
import com.xworkz.ecomerceApp.entity.ProductNameEntity;
import com.xworkz.ecomerceApp.entity.PurchaseEntity;
import com.xworkz.ecomerceApp.service.AddCoustomerService;
import com.xworkz.ecomerceApp.service.ProductService;
import com.xworkz.ecomerceApp.service.PurchaseService;
import com.xworkz.ecomerceApp.service.SalesService;
import com.xworkz.ecomerceApp.service.InvoiceService;

import com.xworkz.ecomerceApp.utils.GenerateOtp;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.util.List;

@Slf4j
@RequestMapping("/")
@Controller
public class SalesController {
    @Autowired
    AddCoustomerService service;
    @Autowired
    ProductService productService;
    @Autowired
    SalesService salesService;
    @Autowired
    InvoiceService invoiceService;
    @Autowired
    GenerateOtp mailNotify;

    @GetMapping("/addSales")
    public String sales(Model model) {
        // Fetch all customers and products to display in the form
        List<AddCustomerDto> customers = service.fetchAllCustomers();
        List<ProductNameEntity> productGroups = productService.getAllProductNames();

        System.err.println("Customers: " + customers);
        System.err.println("Product Groups: " + productGroups);

        model.addAttribute("customers", customers);
        model.addAttribute("productGroups", productGroups);

        return "sales";
    }
    @PostMapping("/saveSalesOrder")
    public String salesOrder(@ModelAttribute SalesDto salesDto){
        // Save sales
        salesService.save(salesDto);

        // Generate invoice PDF
        File invoicePdf = null;
        try {
            invoicePdf = invoiceService.generateInvoicePdfForSales(salesDto);
        } catch (Exception e) {
            log.error("Invoice generation failed", e);
        }

        // Resolve customer name from customerId (SalesDto stores id as String)
        String customerName = null;
        String custIdStr = salesDto.getCustomerId();
        if (custIdStr != null && !custIdStr.trim().isEmpty()) {
            try {
                int custId = Integer.parseInt(custIdStr.trim());
                try {
                    AddCustomerEntity customerEntity = service.getById(custId);
                    if (customerEntity != null) {
                        customerName = customerEntity.getCustomerName();
                    }
                } catch (Exception e) {
                    log.warn("Error fetching customerEntity for id {}", custId, e);
                }
            } catch (NumberFormatException nfe) {
                log.warn("Invalid customerId format: {}", custIdStr);
            }
        }

        // Send mail only if email provided
        if (salesDto.getEmail() != null && !salesDto.getEmail().isEmpty()) {
            String mailResult = mailNotify.sendSalesConfirmationMail(salesDto.getEmail(), customerName, invoicePdf);
            log.info("Mail result: {}", mailResult);
        } else {
            log.warn("No email provided in SalesDto; skipping confirmation mail");
        }

        return "User";
    }

}

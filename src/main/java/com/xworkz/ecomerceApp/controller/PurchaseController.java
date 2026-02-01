package com.xworkz.ecomerceApp.controller;


import com.xworkz.ecomerceApp.dto.AddCustomerDto;
import com.xworkz.ecomerceApp.dto.ProductNameDto;
import com.xworkz.ecomerceApp.dto.PurchaseDto;
import com.xworkz.ecomerceApp.dto.enums.CustomerType;
import com.xworkz.ecomerceApp.entity.AddCustomerEntity;
import com.xworkz.ecomerceApp.entity.ProductNameEntity;
import com.xworkz.ecomerceApp.entity.PurchaseEntity;
import com.xworkz.ecomerceApp.service.AddCoustomerService;
import com.xworkz.ecomerceApp.service.ProductService;
import com.xworkz.ecomerceApp.service.PurchaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.w3c.dom.stylesheets.LinkStyle;

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

       List<String> productGroups = productService.getAllProductNamesOnly();
        List<AddCustomerDto> customers = service.fetchAllCustomers();

        model.addAttribute("productGroups", productGroups);
        model.addAttribute("voucherType", voucherType);
        model.addAttribute("customers", customers);
        model.addAttribute("customerName", customerName);
        model.addAttribute("productDto", new ProductNameDto());
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
        return "PurchasePage";
    }

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

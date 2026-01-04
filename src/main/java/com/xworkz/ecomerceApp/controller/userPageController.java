package com.xworkz.ecomerceApp.controller;

import com.xworkz.ecomerceApp.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/")
@Controller
public class userPageController {

//    @Autowired
//    PurchaseService purchaseService;

    @Autowired
    ProductService productService;

    @GetMapping("purchase")
    public String purchasePage() {
        return "purchasePage";
    }
//    @PostMapping("purchaseDetails")
//    public  String purchaseDetails(@Valid purchaseDto dto) {
//        System.out.println("invoked purchase details");
//        System.out.println(dto);
//        return "purchasePage";
//
//    }
//    @GetMapping("productName")
//    public  String  getProductName(Model model,List<ProductNameDto>productNameDtos){
//        System.out.println("invoked get product name");
//        productNameDtos=productService.getAllProductNames();
//        model.addAttribute("productNames",productNameDtos);
//        return "productNamePage";
//    }
}

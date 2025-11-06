package com.xworkz.ecomerceApp.restController;

import com.xworkz.ecomerceApp.dto.ProductNameDto;
import com.xworkz.ecomerceApp.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@RestController
@RequestMapping("/")
public class ProductNameController {
    @Autowired
    ProductService productService;

    @PostMapping("productName")
    public ResponseEntity<String> getProductName(@Valid ProductNameDto productNameDto, BindingResult result) {
        if (result.hasErrors()) {
            return ResponseEntity.badRequest().body("Validation failed: " + result.getAllErrors());
        }
        System.err.println(productNameDto);
      String   string=  productService.getProductNameService(productNameDto);

        if(string.equals("Product Name received successfully")) {
            return ResponseEntity.ok(string);
        }
        else if (string.equals("productAlready exists")) {
            return ResponseEntity.status(409).body(string);
        } else {
            return ResponseEntity.status(500).body("Failed to receive Product Name");
        }

    }
}

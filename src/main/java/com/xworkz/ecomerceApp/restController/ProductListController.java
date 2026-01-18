package com.xworkz.ecomerceApp.restController;

import com.xworkz.ecomerceApp.dto.ProductNameDto;
import com.xworkz.ecomerceApp.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/")

public class ProductListController {

    @Autowired
    private ProductService productListService;

    @PostMapping("createProduct")

    public ResponseEntity<String> addProductGroup(String productGroupName){
        boolean result = productListService.validateAndAddGroupName(productGroupName);
        if(result){
            return ResponseEntity.status(HttpStatus.CREATED).body("product group added");
        }
        return  ResponseEntity.status(HttpStatus.CREATED).body("couldn't add ");
    }

    @GetMapping("getAllProductNames")
    public List<String> fetchProduct(){
        return productListService.fetchProducts();
    }

}

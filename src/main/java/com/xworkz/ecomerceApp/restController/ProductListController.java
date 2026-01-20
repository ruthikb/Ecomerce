package com.xworkz.ecomerceApp.restController;

import com.xworkz.ecomerceApp.dto.ProductNameDto;
import com.xworkz.ecomerceApp.entity.ProductNameEntity;
import com.xworkz.ecomerceApp.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

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
    public ResponseEntity<?> createProduct(@Valid ProductNameDto dto, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            Map<String, String> errors = new LinkedHashMap<>();
            for (FieldError fe : bindingResult.getFieldErrors()) {
                String field = fe.getField();
                String message;
                switch (field) {
                    case "productName":
                        message = "Please provide a valid product name";
                        break;
                    case "id":
                        message = "Invalid id value";
                        break;
                    default:
                        message = "Invalid value for field: " + field;
                }
                errors.put(field, message);
            }
            return ResponseEntity.badRequest().body(errors);
        }

        productListService.saveProduct(dto);
        return ResponseEntity.ok().build();
    }
    @GetMapping("getProductsById/{id}")
    public ResponseEntity<?> getProductsById(@PathVariable int id) {
        List<ProductNameEntity> products = productListService.getAllProductNamesById(id);
        if (products.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("No products found for the given ID");
        }
        return ResponseEntity.ok(products);
    }
    @GetMapping("getAllProducts")
    public ResponseEntity<?> getAllProducts() {
        List<ProductNameEntity> products = productListService.getAllProductNames();
        if (products.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("No products found");
        }
        return ResponseEntity.ok(products);
    }
    @GetMapping("getAllProductNamesOnly")
    public ResponseEntity<?> getAllProductNamesOnly() {
        List<String> productNames = productListService.getAllProductNamesOnly();
        if (productNames.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("No product names found");
        }
        return ResponseEntity.ok(productNames);
    }
}

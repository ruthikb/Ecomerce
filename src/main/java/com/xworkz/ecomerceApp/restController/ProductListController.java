package com.xworkz.ecomerceApp.restController;

import com.xworkz.ecomerceApp.dto.ProductNameDto;
import com.xworkz.ecomerceApp.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.LinkedHashMap;
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
}

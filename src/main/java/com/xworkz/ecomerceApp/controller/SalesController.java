package com.xworkz.ecomerceApp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/")
@Controller
public class SalesController {

    @GetMapping("/addSales")
    public String sales() {
        return "sales";
    }
}

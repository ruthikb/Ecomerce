package com.xworkz.ecomerceApp.controller;

import com.xworkz.ecomerceApp.dto.AddCustomerDto;

import com.xworkz.ecomerceApp.dto.enums.CustomerType;
import com.xworkz.ecomerceApp.service.AddCoustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

@Controller
public class AddCustomerController {

    @Autowired
    private AddCoustomerService service;

    @GetMapping("/addCustomerPage")
    public String showAddCustomerPage() {
        return "addCustomerPage";
    }


    // ✅ View All Customer Profiles with Pagination
    @GetMapping("getAllCustomers")
    public String getAllProfiles(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int size,
            Model model) {

        List<AddCustomerDto> allCustomers = service.fetchAllCustomers();
        int totalCustomers = allCustomers.size();
        int totalPages = (int) Math.ceil((double) totalCustomers / size);

        int startIndex = (page - 1) * size;
        int endIndex = Math.min(startIndex + size, totalCustomers);

        List<AddCustomerDto> pageList = allCustomers.subList(startIndex, endIndex);

        model.addAttribute("listOfCustomers", pageList);
        model.addAttribute("totalCustomers", totalCustomers);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("startIndex", startIndex + 1);
        model.addAttribute("endIndex", endIndex);

        return "viewCustomer";
    }

    // ✅ Show Edit Form
    @GetMapping("getCustomer")
    public String editCustomer(@RequestParam("id") int id, Model model) {
        AddCustomerDto customer = service.fetchById(id);
        model.addAttribute("customer", customer);
        return "updateCustomer"; // ✅ editCustomer.jsp
    }

    @PostMapping("addCustomer")
    public String addCustomer(@Valid AddCustomerDto addCustomerDto, BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("errors", bindingResult.getAllErrors());
            return "addCustomerPage";
        }
        boolean isSaved = service.saveCustomer(addCustomerDto);
        if (isSaved) {
            redirectAttributes.addFlashAttribute("message", "Customer added successfully!");
            return "redirect:/getAllCustomers";
        } else {
            model.addAttribute("errorMessage", "Failed to add customer. Please try again.");
            return "addCustomerPage";
        }
    }


    @PostMapping("updateCustomerById")
    public String updateCustomerById(@RequestParam int id,
                                     AddCustomerDto addCustomerDto,
                                     Model model) {

        boolean isUpdated = service.updateCustomerById(id, addCustomerDto);

        if (isUpdated) {
            return "redirect:/getAllCustomers";
        } else {
            model.addAttribute("errorMessage", "Failed to update customer. Please try again.");
            return "updateCustomer";
        }
    }


    @GetMapping("deleteCustomer")
    public String deleteCustomerById(@RequestParam("id") int id, HttpServletRequest request, Model model) {


        service.deleteById(id);
        List<AddCustomerDto>dtoList=service.fetchAllCustomers();
        dtoList.stream().forEach(System.out::println);
        model.addAttribute("listOfCustomers",dtoList);
        return "viewCustomer";
    }
//    @GetMapping("getDebtorCustomerTypes")
//    public ResponseEntity<?> getDebtorCustomerTypes() {
//        List<AddCustomerDto> debtorTypes = service.getDebtorCustomerTypes();
//        if (debtorTypes.isEmpty()) {
//            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("No debtor customer types found");
//        }
//        return ResponseEntity.ok(debtorTypes);
//    }

}

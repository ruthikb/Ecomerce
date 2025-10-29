package com.xworkz.ecomerceApp.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import com.xworkz.ecomerceApp.dto.AddCustomerDto;
import com.xworkz.ecomerceApp.dto.UserDto;
import com.xworkz.ecomerceApp.service.AddCoustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

@Controller
public class AddCustomerController {

    @Autowired
    AddCoustomerService service;

    @GetMapping("addCustomerPage")
    public String addCustomerPage() {
        return "addCustomerPage";
    }
//    @GetMapping("viewCustomer")
//    public  String viewCustomer(){
//        return "viewCustomer";
//    }

    @PostMapping("addCustomer")
    public String addCustomer(@Valid AddCustomerDto addCustomerDto, BindingResult result) {
        if (result.hasErrors()) {
            return "addCustomerPage";
        }
        System.err.println(addCustomerDto +"=============");
        service.addCustomer(addCustomerDto);
        return "Admin";
    }

    @GetMapping("/getAllCustomers")
    public String getCustomer(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int size,
            Model model) {

        List<AddCustomerDto> dtoList = service.getAllCustomers();

        int totalCustomers = dtoList.size();
        int totalPages = (int) Math.ceil((double) totalCustomers / size);

        int start = (page - 1) * size;
        int end = Math.min(start + size, totalCustomers);

        List<AddCustomerDto> pagedCustomers = dtoList.subList(start, end);

        model.addAttribute("listOfCustomer", pagedCustomers);
        model.addAttribute("totalCustomers", totalCustomers);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("pageSize", size);

        return "viewCustomer";
    }


    @GetMapping("getCustomer")
    public String getCustomer(@RequestParam("email") String email, Model model) {
        AddCustomerDto addCustomerDto = service.getCustomersByEmail(email);
        model.addAttribute("getSingleUser", addCustomerDto);
        return "updateCustomer";
    }

    @PostMapping("updateCustomerByEmail")
    public String updateCustomerByEmail(@RequestParam("email") String email, Model model) {
        service.updateCustomerByEmail(email);
        List<AddCustomerDto> dtoList = service.getAllCustomers();
        dtoList.stream().forEach(System.err::println);
        model.addAttribute("listOfCustomer", dtoList);
        return "viewCustomer";
    }

//    @GetMapping("deleteCustomer")
//    public RedirectView deleteCustomerByEmail(@RequestParam("email") String email, HttpServletRequest request,Model model){
//
//        System.err.println(email);
//        service.deleteCustomerByEmail(email);
//        RedirectView redirectView = new RedirectView();
//        redirectView.setUrl(request.getContextPath() + "/viewCustomer");
//        return redirectView;
//    }

    @GetMapping("deleteCustomer")
    public String deleteCustomerByEmail(@RequestParam("email") String email, HttpServletRequest request,Model model){

        System.err.println(email);
        service.deleteCustomerByEmail(email);
        List<AddCustomerDto> dtoList = service.getAllCustomers();
        dtoList.stream().forEach(System.err::println);
        model.addAttribute("listOfCustomer", dtoList);
        return "viewCustomer";
    }
    @GetMapping("getAdminName")
    public  String getAdminName(@RequestParam("email")String  email,Model model){
        UserDto userDto=service.getAdminByName(email);
        model.addAttribute("getName",userDto);
        return "admin";
    }

//

}

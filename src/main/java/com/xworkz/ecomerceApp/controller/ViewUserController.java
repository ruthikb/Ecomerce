package com.xworkz.ecomerceApp.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import com.xworkz.ecomerceApp.dto.UserDto;
import com.xworkz.ecomerceApp.dto.enums.Role;
import com.xworkz.ecomerceApp.service.ViewUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class ViewUserController {

    @Autowired
    ViewUserService viewUserService;

    @GetMapping("viewUser")
    public String viewUser(   Model model) {
        List<UserDto>dtoList= viewUserService.getAllUsers();
        model.addAttribute("getAllUser",dtoList);

        return "viewUserPage";
    }
    @GetMapping("editUser")
    public  String  editUser(@RequestParam("id")int id, Model model){
        UserDto userDto=viewUserService.getUserById(id);
        model.addAttribute("getSingleUser",userDto);
        return "updateUser";
    }

    @GetMapping("deleteUser")
    public  String  deleteUser(@RequestParam("id")int id, HttpServletRequest request,Model model){
       viewUserService.deleteUserById(id);
        List<UserDto>dtoList=viewUserService.getAllUsers();
        dtoList.stream().forEach(System.err::println);
        model.addAttribute("listOfCustomer", dtoList);
        return "viewUserPage";
    }

}

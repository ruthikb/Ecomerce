package com.xworkz.ecomerceApp.controller;

import com.xworkz.ecomerceApp.dto.LoginDto;
import com.xworkz.ecomerceApp.service.LoginService;
import com.xworkz.ecomerceApp.utils.GenerateOtp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class UserController {

    @Autowired
    LoginService loginService;
    @Autowired
    GenerateOtp generateOtp;

    @GetMapping("loginUser")
    public String user() {
        return "login";
    }
    @GetMapping("getOtp")
    public  String getOp(){
     return "otp";
    }
    @PostMapping("/loginUser")
    public String loginUser(@Valid @ModelAttribute LoginDto loginDto, Model model, HttpSession session) {
        System.err.println("controller invoked");
        System.out.println(loginDto.getEmailOrPhone());
        System.out.println(loginDto.getPassword());
        String result = loginService.loginUser(loginDto, model);
        System.err.println("end of controlled");

        switch (result) {
            case "ADMIN":
                session.setAttribute("adminName", loginDto.getEmailOrPhone());
                return "Admin";
            case "USER":
                session.setAttribute("userName", loginDto.getEmailOrPhone());
                return "User";
            default:
                System.err.println("login error");
            model.addAttribute("error", result);
                return "login";

        }

    }
    @PostMapping("sendOtp")
    public  String  sendOtp(@RequestParam String email, Model model ){
        System.out.println(email);
        String string = loginService.sendOtp(email);
        if (string.equals("noError")){
            model.addAttribute("noError","email doesnot exist");
        }
        if (string.equals("error")){
            model.addAttribute("error","dbError");
        }
        model.addAttribute("email",email);
        return  "otp";
    }
    @PostMapping("verifyOtp")
        public String  verifyOtp(String  otp,String  email,Model model){
        String result = loginService.verifyOtp(email, otp);
//        if (result.equals("noError")) {
//            model.addAttribute("noError", "no mail");
//            return "otp";
//        }
        if (result.equals("otpError")) {
            model.addAttribute("otpError", "otp is invalid");
            return "otp";
        }
        model.addAttribute("email", email);
        return "resetPassword";
    }
    @PostMapping("resetPassword")
    public  String  resetPassword(String  newPassword,String confirmPassword,String email,Model model){
        String  string=loginService.resetPassword(email,newPassword,confirmPassword);
        if (string.equals("noError")){
            model.addAttribute("noError","noEmail");
            return "resetPassword";
        }
        if (string.equals("password doesnot match")){
            model.addAttribute("passwordError","password doesnot match ");
            return "resetPassword";
        }
        return "login";
    }
    @GetMapping("logOut")
    public  String  logOut(){
        return "login";
    }
}

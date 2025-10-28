package com.xworkz.ecomerceApp.service;

import com.xworkz.ecomerceApp.dto.LoginDto;
import org.springframework.ui.Model;

public interface LoginService  {
    String loginUser(LoginDto loginDto, Model model);


    String sendOtp(String email);

    String verifyOtp(String email, String otp);

    String resetPassword(String email, String newPassword, String confirmPassword);
}

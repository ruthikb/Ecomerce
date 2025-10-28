package com.xworkz.ecomerceApp.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import java.util.Random;
@Component
public class GenerateOtp {

    @Autowired
    JavaMailSender javaMailSender;

    public String generateOtp() {
        Random random = new Random();
        return String.valueOf(random.nextInt(99999));
    }

    public String sendSimpleMessage(String email) {

        SimpleMailMessage message = new SimpleMailMessage();
        String otp = generateOtp();
        message.setFrom("kruthik693@gmail.com.com");
        message.setTo(email);
        message.setSubject("it is your one time code please reset it");
        message.setText("the one time password is " + otp);
        javaMailSender.send(message);
        return otp;
    }
}

package com.xworkz.ecomerceApp.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import javax.mail.internet.MimeMessage;
import java.io.File;
import java.util.Random;

@Component
public class GenerateOtp {

    @Autowired
    private JavaMailSender mailSender;


    public String generateOtp() {
        Random random = new Random();
        int otp = 10000 + random.nextInt(90000);
        return String.valueOf(otp);
    }


    public String sendSimpleMessage(String email) {

        String otp = generateOtp();

        try {

            MimeMessage mimeMessage = mailSender.createMimeMessage();

            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);

            helper.setFrom("kruthik693@gmail.com");

            helper.setTo(email);

            helper.setSubject("Your OTP Code");

            helper.setText("Your One Time Password (OTP) is: " + otp);

            mailSender.send(mimeMessage);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return otp;
    }

    public void sendRegistrationMail(String toEmail, String name, String password) {

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(toEmail);
        message.setSubject("Registration Successful");

        message.setText("Hello " + name + ",\n\n"
                + "Your registration is successful.\n"
                + "Username: " + toEmail + "\n"
                + " this is your one time Password please  reset your password : " + password + "\n\n"
                + "Thank you!");

        mailSender.send(message);
    }

    // Send Sales Confirmation Mail with Invoice
    public String sendSalesConfirmationMail(String email, String customerName, File invoicePdf) {

        if (mailSender == null) {
            System.err.println("JavaMailSender is not configured");
            return "Mail sender not available";
        }

        try {

            MimeMessage mimeMessage = mailSender.createMimeMessage();

            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);

            helper.setFrom("kruthik693@gmail.com");

            helper.setTo(email);


            helper.setCc("kruthikb60@gmail.com");

            helper.setSubject("Sales Order Confirmation – TechBridge");

            String mailBody =
                    "Dear " + (customerName != null ? customerName : "Customer") + ",\n\n" +
                            "Thank you for your purchase from TechBridge.\n\n" +
                            "Your sales order has been successfully processed.\n\n" +
                            "Please find your invoice attached as a PDF.\n\n" +
                            "Warm regards,\n" +
                            "TechBridge Sales Team\n" +
                            "www.techbridge.com";

            helper.setText(mailBody);

            // Attach Invoice
            if (invoicePdf != null && invoicePdf.exists()) {
                helper.addAttachment(invoicePdf.getName(), invoicePdf);
            } else {
                System.out.println("Invoice file not found, attachment skipped.");
            }

            mailSender.send(mimeMessage);

            return "Sales confirmation email sent successfully.";

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "Failed to send sales confirmation email.";
    }
}
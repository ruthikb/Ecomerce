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
        return String.valueOf(random.nextInt(99999));
    }

    public String sendSimpleMessage(String email) {

        SimpleMailMessage message = new SimpleMailMessage();
        String otp = generateOtp();
        message.setFrom("kruthik693@gmail.com");
        message.setTo(email);
        message.setSubject("it is your one time code please reset it");
        message.setText("the one time password is " + otp);
        if (mailSender != null) {
            mailSender.send(message);
        }
        return otp;
    }

    public String sendSalesConfirmationMail(String email, String customerName, File invoicePdf) {
        if (mailSender == null) {
            System.err.println("JavaMailSender is not configured (mailSender is null)");
            return "Mail sender not available";
        }

        try {
            MimeMessage mimeMessage = mailSender.createMimeMessage();

            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true); // true = multipart

            helper.setFrom("kruthik693@gmail.com");
            helper.setTo(email);
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

            // Attach invoice only when provided and exists
            if (invoicePdf != null && invoicePdf.exists()) {
                helper.addAttachment(invoicePdf.getName(), invoicePdf);
            } else {
                System.err.println("Invoice PDF is null or does not exist; skipping attachment.");
            }

            mailSender.send(mimeMessage);

            return "Sales confirmation email sent successfully.";

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "Failed to send sales confirmation email.";
    }
}

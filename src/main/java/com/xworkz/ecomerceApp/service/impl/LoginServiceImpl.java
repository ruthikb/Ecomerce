package com.xworkz.ecomerceApp.service.impl;

import com.xworkz.ecomerceApp.dto.LoginDto;
import com.xworkz.ecomerceApp.dto.enums.Role;
import com.xworkz.ecomerceApp.entity.AdminEntity;
import com.xworkz.ecomerceApp.entity.LoginEntity;
import com.xworkz.ecomerceApp.entity.UserEntity;
import com.xworkz.ecomerceApp.repositry.LoginRepositry;
import com.xworkz.ecomerceApp.service.LoginService;
import com.xworkz.ecomerceApp.utils.GenerateOtp;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

@Service
public class LoginServiceImpl implements LoginService {

    private static final int MAX_FAILED_ATTEMPTS = 3;

    @Autowired
    LoginRepositry loginRepositry;

@Autowired
    GenerateOtp generateOtp;

    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public String loginUser(LoginDto loginDto, Model model) {
//        System.err.println("service got invoked");
//        System.out.println(loginDto.getEmailOrPhone());
//        System.out.println(loginDto.getPassword());

        String emailAndPhone = loginDto.getEmailOrPhone();
        String password = loginDto.getPassword();


        UserEntity user = loginRepositry.findByEmailOrPhone(emailAndPhone);
        System.err.println( user);
        System.out.println("service ended");
        if (user == null) {
            return "User not found. Please register first.";
        }
        if (user.getLockTime() != null && LocalDateTime.now().isBefore(user.getLockTime())) {
            Duration remaining = Duration.between(LocalDateTime.now(), user.getLockTime());
            long hours = remaining.toHours();
            long minutes = remaining.toMinutes() % 60;
            return "Your account is locked. Try again after " + hours + "h " + minutes + "m.";
        }
        if (!bCryptPasswordEncoder.matches(password,user.getPassword())){
            return "password doesnot match";
        }

        if (bCryptPasswordEncoder.matches(user.getPassword(), password)) {

            int attempts = user.getFailedAttempts() + 1;
            user.setFailedAttempts(attempts);

            if (attempts >= MAX_FAILED_ATTEMPTS) {
                user.setLockTime(LocalDateTime.now().plusHours(24));
                user.setFailedAttempts(0);
                loginRepositry.updateUser(user);
                return "Too many failed attempts. Account locked for 24 hours.";
            } else {
                loginRepositry.updateUser(user);
                return "Invalid password. Attempt " + attempts + " of 3.";
            }
        }

        user.setFailedAttempts(0);
        user.setLockTime(null);
        user.setLockTime(LocalDateTime.now());
        loginRepositry.updateUser(user);

        if (user.getRole() == Role.admin) {
            AdminEntity adminEntity = new AdminEntity();
            adminEntity.setEmailOrPhoneNumber(user.getEmail() != null ? user.getEmail() : String.valueOf(user.getPhone()));
            adminEntity.setPassword(user.getPassword());
            adminEntity.setLoginDate(LocalDate.now());
            adminEntity.setLoginTime(LocalTime.now());
            loginRepositry.saveAdmin(adminEntity);
        } else if (user.getRole() == Role.user) {
            LoginEntity loginEntity = new LoginEntity();
            loginEntity.setEmailOrPhoneNumber(user.getEmail() != null ? user.getEmail() : String.valueOf(user.getPhone()));
            loginEntity.setPassword(user.getPassword());
            loginEntity.setLoginDate(LocalDate.now());
            loginEntity.setLoginTime(LocalTime.now());
            loginRepositry.saveUser(loginEntity);
        }

        Role role = user.getRole();
        if (role == Role.admin) return "ADMIN";
        else if (role == Role.user) return "USER";

        return "invalid role";
    }

    @Override
    public String sendOtp(String email) {
        if (email==null){
            return  "nullError";
        }
        if (email.contains("@gmail.com")){
            UserEntity dto =loginRepositry.findByEmailOrPhone(email);
            if (dto!=null) {
                if (dto.getEmail().equals(email)) {
                    String otp = generateOtp.sendSimpleMessage(email);
                    dto.setOtp(otp);
                    UserEntity petShop =new UserEntity();
                    BeanUtils.copyProperties(dto,petShop);
                        boolean isRegister= loginRepositry.saveOtp(petShop);
                    System.out.println(isRegister);
                }
            }
        }
        return "allGood";

    }

    @Override
    public String   verifyOtp(String email, String otp) {
        System.err.println(email);
        System.err.println(otp);
        if (email == null || otp == null) {
            return "noError";
        }
        UserEntity user = loginRepositry.findByEmailOrPhone(email);
        if (!otp.equals(user.getOtp())) {
            System.err.println(otp);
            System.err.println(user.getOtp());
            return "otpError";
        }
        return "noError";
    }

    @Override
    public String resetPassword(String email, String newPassword, String confirmPassword) {

        System.err.println(newPassword);
        UserEntity entity = loginRepositry.findByEmailOrPhone(email);
        if (entity==null){
            return "noError";
        }
        if (!newPassword.equals(confirmPassword)){
            return "password doesnot match";
        }
        System.err.println("db passqword"+entity.getPassword());
        System.err.println("new password form reset page"+newPassword);
        entity.setPassword(bCryptPasswordEncoder.encode(newPassword));
        loginRepositry.updateUser(entity);
        return "allGood";
    }


}



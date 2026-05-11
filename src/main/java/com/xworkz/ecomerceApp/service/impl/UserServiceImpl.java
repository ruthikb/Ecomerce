package com.xworkz.ecomerceApp.service.impl;

import com.xworkz.ecomerceApp.dto.LoginDto;
import com.xworkz.ecomerceApp.dto.UserDto;
import com.xworkz.ecomerceApp.entity.UserEntity;
import com.xworkz.ecomerceApp.repositry.UserRepositry;
import com.xworkz.ecomerceApp.service.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserRepositry userRepositry;

    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;


    @Override
    public String registerUser(UserDto userDto) {

        try {

            boolean exists = userRepositry.existsEmailOrPhone(userDto.getEmail(), Long.valueOf(userDto.getPhone()));
            if (exists) {
                System.out.println("User already exists with same email or phone number");
                return "User already exists";
            }
            UserEntity userEntity = new UserEntity();

            BeanUtils.copyProperties(userDto, userEntity);

            userEntity.setPassword( bCryptPasswordEncoder.encode(userDto.getPassword()));

            boolean saved = userRepositry.registerUser(userEntity);

            if (saved) {
                return "User registered successfully";
            } else {
                return "Failed to register user";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "Error occurred while saving user";
        }
    }

//    @Override
//    public String checkMailAndPAssword(LoginDto loginDto, Model model) {
//        String emailAndPhone = loginDto.getEmailAndPhone();
//        String password = loginDto.getPassword();
//        userRepositry.existsEmailOrPhone(emailAndPhone);
//        return "";
//    }


}

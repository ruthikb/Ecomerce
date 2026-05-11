package com.xworkz.ecomerceApp.service;

import com.xworkz.ecomerceApp.dto.LoginDto;
import com.xworkz.ecomerceApp.dto.UserDto;
import org.springframework.ui.Model;

public interface UserService {
    

    String registerUser(UserDto userDto);



//    String checkMailAndPAssword(LoginDto loginDto, Model model);
}

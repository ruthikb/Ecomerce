package com.xworkz.ecomerceApp.restController;

import com.xworkz.ecomerceApp.dto.UserDto;
import com.xworkz.ecomerceApp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping("/")
public class Controller {
    @Autowired
    UserService userService;
    @PostMapping("/register")
    public  String  registerUser(@Valid @RequestBody UserDto userDto ){
        userService.regiserUser(userDto);
        return  "all good";
    }
}

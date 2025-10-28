package com.xworkz.ecomerceApp.restController;

import com.xworkz.ecomerceApp.dto.UserDto;
import com.xworkz.ecomerceApp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;


import javax.validation.Valid;

@RestController
@RequestMapping("/")
@org.springframework.stereotype.Controller
public class Controller {
    @Autowired
    UserService userService;
    @PostMapping("RegisterUser")
    public ResponseEntity<String> registerUser(@Valid UserDto userDto, BindingResult result) {
        if (result.hasErrors()) {
            return ResponseEntity.badRequest().body("Validation failed: " + result.getAllErrors());
        }

        System.out.println(userDto);
        String message = userService.registerUser(userDto);

        if (message.equals("User already exists")) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body(message);
        } else if (message.equals("User registered successfully")) {
            return ResponseEntity.ok(message);
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(message);
        }
    }
//    @GetMapping("getEmail")
//    public ResponseEntity<String> findByEmail(@RequestParam("email") String email) {
//
//        if (email != null) {
//            UserDto dto = new UserDto();
//            dto = userService.findEmailService(email);
//            if (dto != null) {
//                return ResponseEntity.ok("Email is used");
//            }
//        }
//        return ResponseEntity.ok("Email is not used");
//    }
//
//    @GetMapping("getPhone")
//    public ResponseEntity<String> getPhone(@RequestParam("phone") long phone) {
//        if (phone != 0) {
//            System.out.println(phone);
//            UserDto dto = new UserDto();
//            dto = userService.getPhoneService(phone);
//            System.out.println(dto);
//            if (dto != null) {
//                return ResponseEntity.ok("phone is used");
//            }
//        }
//        return ResponseEntity.ok("phone is not used");
//    }


}

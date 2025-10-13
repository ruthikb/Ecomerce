package com.xworkz.ecomerceApp.restController;
import com.xworkz.ecomerceApp.dto.Role;
import com.xworkz.ecomerceApp.dto.UserDto;
import com.xworkz.ecomerceApp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;

@RestController
@RequestMapping("/")
@org.springframework.stereotype.Controller
public class Controller {
    @Autowired
    UserService userService;

    @PostMapping("/register")
    public String registerUser(@Valid UserDto userDto) {
        userService.regiserUser(userDto);

        return "all good";
    }

    @GetMapping("getEmail")
    public ResponseEntity<String> findByEmail(@RequestParam("email") String email) {
        System.out.println(email);
        if (email != null) {
            UserDto dto = new UserDto();
            dto = userService.findEmailService(email);
            System.err.println(dto);

            if (dto.getEmail().equals(email)) {
                System.out.println(dto);

                return ResponseEntity.ok("Email is used");
            }
        }
        return ResponseEntity.ok("Email is not used");
    }

}

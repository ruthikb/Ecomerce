package com.xworkz.ecomerceApp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.management.relation.Role;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDto {
    private  int id;
    private  String  firstName;
    private  String  lastName;
    private  String email;
    private  long Phone;
    private  String  password;

    private Role role;

}

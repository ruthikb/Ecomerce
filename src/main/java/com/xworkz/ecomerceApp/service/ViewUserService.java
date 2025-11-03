package com.xworkz.ecomerceApp.service;

import com.xworkz.ecomerceApp.dto.UserDto;
import com.xworkz.ecomerceApp.dto.enums.Role;

import java.util.List;

public interface ViewUserService {
    List<UserDto> getAllUsers();

    UserDto getUserById(int id);

    boolean deleteUserById(int id);
}

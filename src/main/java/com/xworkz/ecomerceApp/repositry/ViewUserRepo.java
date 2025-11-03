package com.xworkz.ecomerceApp.repositry;

import com.xworkz.ecomerceApp.dto.enums.Role;
import com.xworkz.ecomerceApp.entity.UserEntity;

import java.util.List;

public interface ViewUserRepo {
    List<UserEntity> getUser();

    UserEntity getUserById(int id);

    boolean deleteUserById(int id);
}

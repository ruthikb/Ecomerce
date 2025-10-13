package com.xworkz.ecomerceApp.repositry;

import com.xworkz.ecomerceApp.entity.UserEntity;

public interface UserRepositry {
    boolean registerUser(UserEntity userEntity);

    UserEntity findEmailRepo(String email);
}

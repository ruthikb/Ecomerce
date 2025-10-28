package com.xworkz.ecomerceApp.repositry;

import com.xworkz.ecomerceApp.entity.UserEntity;

public interface UserRepositry {
    boolean registerUser(UserEntity userEntity);

    boolean existsEmailOrPhone(String email, Long phone);


    void clearOtp();
}

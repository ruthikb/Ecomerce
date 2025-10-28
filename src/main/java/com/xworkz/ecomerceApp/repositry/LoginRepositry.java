package com.xworkz.ecomerceApp.repositry;

import com.xworkz.ecomerceApp.entity.AdminEntity;
import com.xworkz.ecomerceApp.entity.LoginEntity;
import com.xworkz.ecomerceApp.entity.UserEntity;

public interface LoginRepositry {


    UserEntity findByEmailOrPhone(String emailOrPhone);

    boolean updateUser(UserEntity user);

    boolean saveAdmin(AdminEntity adminEntity);

    boolean saveUser(LoginEntity loginEntity);

    boolean saveOtp(UserEntity user);

    boolean updatePassword(UserEntity entity);
}

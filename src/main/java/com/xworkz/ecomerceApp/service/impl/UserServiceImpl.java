package com.xworkz.ecomerceApp.service.impl;

import com.xworkz.ecomerceApp.dto.UserDto;
import com.xworkz.ecomerceApp.entity.UserEntity;
import com.xworkz.ecomerceApp.repositry.UserRepositry;
import com.xworkz.ecomerceApp.service.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserRepositry userRepositry;

    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public boolean regiserUser(UserDto userDto) {
        if (!userDto.getPassword().equals(userDto.getPassword())) {
            System.out.println("invalid password");
            return false;
        } else {
            userDto.setPassword(bCryptPasswordEncoder.encode(userDto.getPassword()));
            System.out.println("valid password");
            UserEntity userEntity=new UserEntity();
            System.out.println(userDto);
            BeanUtils.copyProperties(userDto,userEntity);
//            userEntity.setRole(userDto.getRole());
            return userRepositry.registerUser(userEntity);
        }

    }

    @Override
    public UserDto findEmailService(String email) {
           UserEntity entity = new UserEntity();
            entity=userRepositry.findEmailRepo(email);
            if (entity!=null)
            {
                UserDto dto = new UserDto();
                BeanUtils.copyProperties(entity,dto);
                return dto;
            }
            return null;
        }

}

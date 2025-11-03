package com.xworkz.ecomerceApp.service.impl;

import com.xworkz.ecomerceApp.dto.UserDto;
import com.xworkz.ecomerceApp.dto.enums.Role;
import com.xworkz.ecomerceApp.entity.UserEntity;
import com.xworkz.ecomerceApp.repositry.ViewUserRepo;
import com.xworkz.ecomerceApp.service.ViewUserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
@Service
public class ViewUserServiceImpl implements ViewUserService {

    @Autowired
    ViewUserRepo viewUserRepo;
    @Override
    public List<UserDto> getAllUsers() {
        List<UserDto>dtoList=new ArrayList<>();
        List<UserEntity>entities=viewUserRepo.getUser();
        entities.stream().forEach(list->{
            UserDto userDto = new UserDto();
            BeanUtils.copyProperties(list,userDto);
            dtoList.add(userDto);
        });
        return dtoList;
    }

    @Override
    public UserDto getUserById(int id) {
        UserDto userDto =new UserDto();
        UserEntity userEntity=viewUserRepo.getUserById(id);
        BeanUtils.copyProperties(userEntity,userDto);
        return userDto;
    }

    @Override
    public boolean deleteUserById(int id) {
        return viewUserRepo.deleteUserById(id);
    }
}

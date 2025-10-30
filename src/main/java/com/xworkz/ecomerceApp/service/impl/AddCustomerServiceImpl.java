package com.xworkz.ecomerceApp.service.impl;

import com.xworkz.ecomerceApp.dto.AddCustomerDto;
import com.xworkz.ecomerceApp.dto.UserDto;
import com.xworkz.ecomerceApp.entity.AddCustomerEntity;
import com.xworkz.ecomerceApp.entity.UserEntity;
import com.xworkz.ecomerceApp.repositry.AddCustomerRepo;
import com.xworkz.ecomerceApp.service.AddCoustomerService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class AddCustomerServiceImpl implements AddCoustomerService {

    @Autowired
    AddCustomerRepo addCustomerRepo;
    @Override
    public boolean addCustomer(AddCustomerDto addCustomerDto){
        AddCustomerEntity addCustomerEntity=new AddCustomerEntity();
        BeanUtils.copyProperties(addCustomerDto,addCustomerEntity);
        return addCustomerRepo.saveCustomer(addCustomerEntity) ;

    }

    @Override
    public List<AddCustomerDto> getAllCustomers() {
        List<AddCustomerDto>dtoList=new ArrayList<>();
        List<AddCustomerEntity>entities=addCustomerRepo.getAllCoustomers();
        entities.stream().forEach(list->{
            AddCustomerDto addCustomerDto=new AddCustomerDto();
            BeanUtils.copyProperties(list,addCustomerDto);
            dtoList.add(addCustomerDto);
        });
        return dtoList;
    }

    @Override
    public AddCustomerDto getCustomersById(int id) {
        AddCustomerDto addCustomerDto=new AddCustomerDto();
        AddCustomerEntity entity=addCustomerRepo.getCoustomerById(id);
        BeanUtils.copyProperties(entity,addCustomerDto);
        return addCustomerDto;
    }

    @Override
    public boolean updateCustomerById(int id, AddCustomerDto addCustomerDto) {
        AddCustomerEntity addCustomerEntity=new AddCustomerEntity();
        BeanUtils.copyProperties(addCustomerDto,addCustomerEntity);
        return addCustomerRepo.updateCustomerById(id,addCustomerEntity);
    }

    @Override
    public boolean deleteCustomerById(int id) {
        System.err.println("service id"+id);
        return addCustomerRepo.deleteCustomerById(id);
    }

    @Override
    public UserDto getAdminByName(String email) {
        UserDto userDto=new UserDto();
        UserEntity userEntity=addCustomerRepo.getAdminName(email);
        BeanUtils.copyProperties(userEntity,userEntity);
        return userDto;
    }


}

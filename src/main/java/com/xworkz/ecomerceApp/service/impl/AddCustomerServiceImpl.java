package com.xworkz.ecomerceApp.service.impl;

import com.xworkz.ecomerceApp.dto.AddCustomerDto;
import com.xworkz.ecomerceApp.dto.UserDto;
import com.xworkz.ecomerceApp.dto.enums.CustomerType;
import com.xworkz.ecomerceApp.entity.AddCustomerEntity;
import com.xworkz.ecomerceApp.entity.UserEntity;
import com.xworkz.ecomerceApp.repositry.AddCustomerRepo;
import com.xworkz.ecomerceApp.service.AddCoustomerService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class AddCustomerServiceImpl implements AddCoustomerService {

    @Autowired
    private AddCustomerRepo repo;

    @Override
    public List<AddCustomerDto> fetchAllCustomers() {
        List<AddCustomerEntity> entities = repo.findAll();
        List<AddCustomerDto> dtos = new ArrayList<>();
        entities.forEach(entity -> {
            AddCustomerDto dto = new AddCustomerDto();
            BeanUtils.copyProperties(entity, dto);
            dtos.add(dto);
        });
        return dtos;
    }

    @Override
    public List<String> getDebtorCustomerTypes() {
        return repo.findDebtorCustomerTypes();
    }

    @Override
    public AddCustomerDto fetchById(int id) {
        AddCustomerEntity entity = repo.getById(id);
        AddCustomerDto dto = new AddCustomerDto();
        BeanUtils.copyProperties(entity, dto);
        return dto;
    }

    @Override
    public boolean saveCustomer(AddCustomerDto dto) {
        AddCustomerEntity entity = new AddCustomerEntity();
        BeanUtils.copyProperties(dto, entity);
        return repo.save(entity) != null;
    }

    @Override
    public void updateCustomer(AddCustomerDto dto) {
        AddCustomerEntity entity = repo.getById( dto.getId());
        if (entity != null) {
            BeanUtils.copyProperties(dto, entity);
            repo.save(entity);
        }
    }

    @Override
    public boolean deleteById(int id) {
        return repo.deleteById(id);
    }

//    @Override
//    public List<AddCustomerEntity> findAllDebitCustomers() {
//        return repo.getDebitCustomers();
//    }

    @Override
    public AddCustomerEntity getById(int customerId) {
        return repo.getById(customerId);
    }

}

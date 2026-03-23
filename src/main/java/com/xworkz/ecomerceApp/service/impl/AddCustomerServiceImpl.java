package com.xworkz.ecomerceApp.service.impl;

import com.xworkz.ecomerceApp.dto.AddCustomerDto;
import com.xworkz.ecomerceApp.entity.AddCustomerEntity;
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
    public boolean updateCustomer(AddCustomerDto dto) {
        AddCustomerEntity entity = new AddCustomerEntity();
        BeanUtils.copyProperties(dto, entity);
        return repo.update(entity);

    }

    @Override
    public boolean deleteById(int id) {
        AddCustomerEntity entity = repo.getById(id);

        if (entity != null) {
            return repo.deleteById(entity);
        }

        return false;
    }



    @Override
    public AddCustomerEntity getById(int customerId) {
        return repo.getById(customerId);

    }

    @Override
    public List<AddCustomerEntity> fetchDebitors() {
        return repo.findAllDebitors();
    }

    @Override
    public boolean updateCustomerById(int id, AddCustomerDto addCustomerDto) {

        AddCustomerEntity entity = repo.getById(id);

        if (entity != null) {

            BeanUtils.copyProperties(addCustomerDto, entity);

            // Ensure correct ID
            entity.setId(id);

            return repo.update(entity);
        }

        return false;
    }



}



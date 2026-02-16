package com.xworkz.ecomerceApp.repositry;

import com.xworkz.ecomerceApp.dto.enums.CustomerType;
import com.xworkz.ecomerceApp.entity.AddCustomerEntity;
import com.xworkz.ecomerceApp.entity.UserEntity;

import java.util.Arrays;
import java.util.List;

public interface AddCustomerRepo {
    AddCustomerEntity save(AddCustomerEntity entity);

    List<AddCustomerEntity> findAll();

    AddCustomerEntity getById(int id);

    boolean deleteById(int id);

    List<AddCustomerEntity> findByType(String type);

    List<String> findDebtorCustomerTypes();

    List<AddCustomerEntity> findAllDebitors();
}
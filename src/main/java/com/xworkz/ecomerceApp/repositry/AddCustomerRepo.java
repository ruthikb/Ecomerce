package com.xworkz.ecomerceApp.repositry;

import com.xworkz.ecomerceApp.dto.enums.CustomerType;
import com.xworkz.ecomerceApp.entity.AddCustomerEntity;
import com.xworkz.ecomerceApp.entity.UserEntity;

import java.util.List;

public interface AddCustomerRepo {
    boolean existsByEmail(String email);
    boolean existsByPhone(String phone);
    boolean existsByGst(String gst);
    boolean existsByName(String customerName);
    boolean existsByNameAndType(String customerName, String customerType);
    AddCustomerEntity save(AddCustomerEntity entity);
    List<AddCustomerEntity> findAll();
    AddCustomerEntity getById(int id);
    boolean deleteById(int id);
    List<AddCustomerEntity> findByType(String type);

//    List<AddCustomerEntity> getDebitCustomers();
}

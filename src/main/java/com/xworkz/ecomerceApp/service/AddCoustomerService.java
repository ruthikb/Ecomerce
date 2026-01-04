package com.xworkz.ecomerceApp.service;

import com.xworkz.ecomerceApp.dto.AddCustomerDto;
import com.xworkz.ecomerceApp.dto.UserDto;
import com.xworkz.ecomerceApp.dto.enums.CustomerType;
import com.xworkz.ecomerceApp.entity.AddCustomerEntity;

import java.util.List;

public interface AddCoustomerService {
    List<AddCustomerDto> fetchAllCustomers();
    AddCustomerDto fetchById(int id);
    boolean saveCustomer(AddCustomerDto dto);
    void updateCustomer(AddCustomerDto dto);
    boolean deleteById(int id);
    List<AddCustomerEntity> findAllDebitCustomers();
    boolean existsByNameAndType(String customerName, String customerType);
    AddCustomerEntity getById(int customerId);
    boolean existsByEmail(String email);
    boolean existsByPhone(String phone);
    boolean existsByGst(String gst);
    boolean existsByName(String customerName);

}

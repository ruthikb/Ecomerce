package com.xworkz.ecomerceApp.service;

import com.xworkz.ecomerceApp.dto.AddCustomerDto;
import com.xworkz.ecomerceApp.dto.UserDto;

import java.util.List;

public interface AddCoustomerService {
    boolean addCustomer(AddCustomerDto addCustomerDto);

    List<AddCustomerDto> getAllCustomers();



    boolean updateCustomerById(int id, AddCustomerDto addCustomerDto);

    boolean deleteCustomerById(int id);


    UserDto getAdminByName(String email);


    AddCustomerDto getCustomersById(int id);
}

package com.xworkz.ecomerceApp.service;

import com.xworkz.ecomerceApp.dto.AddCustomerDto;
import com.xworkz.ecomerceApp.dto.UserDto;

import java.util.List;

public interface AddCoustomerService {
    boolean addCustomer(AddCustomerDto addCustomerDto);

    List<AddCustomerDto> getAllCustomers();

    AddCustomerDto getCustomersByEmail(String email);

    boolean updateCustomerByEmail(String email);

    boolean deleteCustomerByEmail(String email);


    UserDto getAdminByName(String email);
}

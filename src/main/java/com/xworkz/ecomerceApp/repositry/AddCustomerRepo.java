package com.xworkz.ecomerceApp.repositry;

import com.xworkz.ecomerceApp.entity.AddCustomerEntity;

import java.util.List;

public interface AddCustomerRepo {
    public boolean saveCustomer(AddCustomerEntity addCustomerEntity) ;

    List<AddCustomerEntity> getAllCoustomers();

    AddCustomerEntity getCoustomerByEmail(String email);

    boolean updateCustomerByEmail(String email, AddCustomerEntity addCustomerEntity);

    boolean deleteCustomerByEmail(String email);

    AddCustomerEntity viewCustomerByEmail(String email);
}

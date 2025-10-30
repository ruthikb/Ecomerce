package com.xworkz.ecomerceApp.repositry;

import com.xworkz.ecomerceApp.entity.AddCustomerEntity;
import com.xworkz.ecomerceApp.entity.UserEntity;

import java.util.List;

public interface AddCustomerRepo {
    public boolean saveCustomer(AddCustomerEntity addCustomerEntity) ;

    List<AddCustomerEntity> getAllCoustomers();

    AddCustomerEntity getCoustomerById(int id);

    boolean updateCustomerById(int id, AddCustomerEntity addCustomerEntity);

    boolean deleteCustomerById(int id);


    UserEntity getAdminName(String email);
}

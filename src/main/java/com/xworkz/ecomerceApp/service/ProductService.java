package com.xworkz.ecomerceApp.service;

import com.xworkz.ecomerceApp.dto.ProductNameDto;
import com.xworkz.ecomerceApp.entity.ProductNameEntity;

import java.util.List;

public interface ProductService {
    boolean validateAndAddGroupName  (String productGroupName);

    List<String> fetchProducts();

//    ProductNameEntity getById(Long productGroupId);
//    List<ProductNameEntity> findAllProductNames();


}

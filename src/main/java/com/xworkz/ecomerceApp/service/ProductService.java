package com.xworkz.ecomerceApp.service;

import com.xworkz.ecomerceApp.dto.ProductNameDto;
import com.xworkz.ecomerceApp.entity.ProductNameEntity;

import java.util.List;

public interface ProductService {
//    boolean validateAndAddGroupName  (String productGroupName);

    void saveProduct(ProductNameDto dto);

    List<ProductNameEntity> getAllProductNamesById(int id);

    List<ProductNameEntity> getAllProductNames();

    List<String> getAllProductNamesOnly();

    List<ProductNameEntity> getById(int id);

//    ProductNameEntity getById(Long productGroupId);
//    List<ProductNameEntity> findAllProductNames();


}

package com.xworkz.ecomerceApp.service;

import com.xworkz.ecomerceApp.dto.ProductNameDto;
import com.xworkz.ecomerceApp.entity.ProductNameEntity;

import java.util.List;

public interface ProductService {
    String saveProduct(ProductNameDto dto);

    ProductNameEntity getById(Long productGroupId);
    List<ProductNameEntity> findAllProductNames();


}

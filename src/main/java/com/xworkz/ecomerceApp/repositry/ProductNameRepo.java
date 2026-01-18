package com.xworkz.ecomerceApp.repositry;

import com.xworkz.ecomerceApp.dto.ProductNameDto;
import com.xworkz.ecomerceApp.entity.ProductNameEntity;

import java.util.Arrays;
import java.util.List;

public interface ProductNameRepo {
//    boolean isProductNameExists(String productName);


//    boolean saveProductName(ProductNameEntity productNameEntity);
//    ProductNameEntity getById(Long id);
//
//    List<ProductNameEntity> findAllProductNames();

    List<ProductNameEntity> findAllProductGroupName();

    void save(ProductNameEntity productGroupEntity);

    List<ProductNameEntity> fetchProductNames();
}

package com.xworkz.ecomerceApp.repositry;

import com.xworkz.ecomerceApp.dto.ProductNameDto;
import com.xworkz.ecomerceApp.entity.ProductNameEntity;

import java.util.List;

public interface ProductNameRepo {
    void save(ProductNameEntity entity);

    List<ProductNameEntity> findById(int id);

    List<ProductNameEntity> findAllProductNames();

    List<String> findAllProductNamesOnly();
//    boolean isProductNameExists(String productName);


//    boolean saveProductName(ProductNameEntity productNameEntity);
//    ProductNameEntity getById(Long id);
//
//    List<ProductNameEntity> findAllProductNames();

//    List<ProductNameEntity> findAllProductGroupName();
//
//    void save(ProductNameEntity productGroupEntity);
}

package com.xworkz.ecomerceApp.service.impl;

import com.xworkz.ecomerceApp.dto.ProductNameDto;
import com.xworkz.ecomerceApp.entity.ProductNameEntity;
import com.xworkz.ecomerceApp.repositry.AddCustomerRepo;
import com.xworkz.ecomerceApp.repositry.ProductNameRepo;
import com.xworkz.ecomerceApp.repositry.UserRepositry;
import com.xworkz.ecomerceApp.service.ProductService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductNameRepo productListRepo;


    @Override
    public boolean validateAndAddGroupName(String productGroupName) {
        List<ProductNameEntity> all = productListRepo.findAllProductGroupName();
        for (ProductNameEntity productGroupEntity : all) {
            if (productGroupEntity.getProductName().equals(productGroupName)) {
                return false;
            }
        }
        ProductNameEntity productGroupEntity = new ProductNameEntity();
        productGroupEntity.setProductName(productGroupName);
        productListRepo.save(productGroupEntity);
        return true;
    }

    @Override
    public List<String> fetchProducts() {
        return productListRepo.fetchProductNames().stream().map(ProductNameEntity::getProductName).collect(Collectors.toList());
    }


}

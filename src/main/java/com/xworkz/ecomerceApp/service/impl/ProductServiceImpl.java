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

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductNameRepo productListRepo;




    @Override
    public void saveProduct(ProductNameDto dto) {
        if (dto == null) {
            throw new IllegalArgumentException("ProductNameDto cannot be null");
        }
        else {
            System.out.println("ProductNameDto is valid");
            ProductNameEntity entity = new ProductNameEntity();
            BeanUtils.copyProperties(dto, entity);
            productListRepo.save(entity);
        }




    }

    @Override
    public List<ProductNameEntity> getAllProductNamesById(int id) {
        return productListRepo.findById(id);
    }

    @Override
    public List<ProductNameEntity> getAllProductNames() {
        return productListRepo.findAllProductNames();
    }

    @Override
    public List<String> getAllProductNamesOnly() {
        return productListRepo.findAllProductNamesOnly();
    }


}

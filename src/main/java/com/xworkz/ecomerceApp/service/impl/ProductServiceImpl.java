package com.xworkz.ecomerceApp.service.impl;

import com.xworkz.ecomerceApp.dto.ProductNameDto;
import com.xworkz.ecomerceApp.entity.ProductNameEntity;
import com.xworkz.ecomerceApp.repositry.ProductNameRepo;
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
    public String saveProduct(ProductNameDto dto) {

        ProductNameEntity product = new ProductNameEntity();
        BeanUtils.copyProperties(dto, product);
        productListRepo.saveProductName(product);
        return null;
    }

    @Override
    public ProductNameEntity getById(Long productGroupId) {
        return productListRepo.getById(productGroupId);
    }

    @Override
    public List<ProductNameEntity> findAllProductNames() {
       return Collections.emptyList();
    }


}

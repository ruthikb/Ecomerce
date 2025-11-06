package com.xworkz.ecomerceApp.service.impl;

import com.xworkz.ecomerceApp.dto.ProductNameDto;
import com.xworkz.ecomerceApp.entity.ProductNameEntity;
import com.xworkz.ecomerceApp.repositry.ProductNameRepo;
import com.xworkz.ecomerceApp.service.ProductService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    ProductNameRepo productNameRepo;
    @Override
    public String getProductNameService(ProductNameDto productNameDto) {
        boolean exists=productNameRepo.isProductNameExists(productNameDto.getProductName());
        if(exists){
            return "productAlready exists";
        }
        ProductNameEntity productNameEntity=new ProductNameEntity();
        BeanUtils.copyProperties(productNameDto,productNameEntity);
        boolean saved=productNameRepo.saveProductName(productNameEntity);
        if(saved){
            return "Product Name received successfully";
        }else {
            return "Failed to receive Product Name";
        }

    }
}

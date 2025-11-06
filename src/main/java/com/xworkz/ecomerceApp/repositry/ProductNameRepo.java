package com.xworkz.ecomerceApp.repositry;

import com.xworkz.ecomerceApp.dto.ProductNameDto;
import com.xworkz.ecomerceApp.entity.ProductNameEntity;

public interface ProductNameRepo {
    boolean isProductNameExists(String productName);


    boolean saveProductName(ProductNameEntity productNameEntity);
}

package com.xworkz.ecomerceApp.service.impl;

import com.xworkz.ecomerceApp.dto.PurchaseDto;
import com.xworkz.ecomerceApp.entity.AddCustomerEntity;
import com.xworkz.ecomerceApp.entity.ProductNameEntity;
import com.xworkz.ecomerceApp.entity.PurchaseEntity;
import com.xworkz.ecomerceApp.repositry.PurchaseRepo;
import com.xworkz.ecomerceApp.service.AddCoustomerService;
import com.xworkz.ecomerceApp.service.ProductService;
import com.xworkz.ecomerceApp.service.PurchaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class PurchaseServiceImpl implements PurchaseService{

    @Autowired
    private PurchaseRepo purchaseRepo;

    @Autowired
    private AddCoustomerService customerService;

    @Autowired
    private ProductService productGroupService;

    @Override
    public boolean savePurchase(PurchaseDto dto) {
        if (dto == null)
            return false;
        PurchaseEntity entity = new PurchaseEntity();

        entity.setVoucherType(dto.getVoucherType());
        entity.setCustomer(customerService.getById(Math.toIntExact(dto.getCustomerId())));

        // Resolve the selected productGroupId to an actual ProductNameEntity and set it
        if (dto.getProductGroupId() != null) {
            int prodId = Math.toIntExact(dto.getProductGroupId());
            List<ProductNameEntity> productList = productGroupService.getById(prodId);
            if (productList != null && !productList.isEmpty()) {
                ProductNameEntity product = productList.get(0);
                entity.setProductGroup(product);
            }
        }

        entity.setMake(dto.getMake());
        entity.setModel(dto.getModel());
        entity.setProductCode(dto.getProductCode());
        entity.setItemName(dto.getItemName());
        entity.setOpeningValue(dto.getOpeningValue());
        entity.setOpeningBalance(dto.getOpeningBalance());
        entity.setPurchasePrice(dto.getPurchasePrice());
        entity.setOrderDueDate(dto.getOrderDueDate());
//        entity.setProductGroup(productGroup);
        entity.setStatus("PENDING");

        return purchaseRepo.savePurchase(entity);
    }

    @Override
    public List<PurchaseEntity> getAllPurchases() {
        return purchaseRepo.findAllPurchases();
    }
}
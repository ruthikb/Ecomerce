
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
        if (dto == null) return false;


        AddCustomerEntity customer = null;
        ProductNameEntity productGroup = null;
        if (dto.getCustomerId() != null) {
            customer = customerService.getById(dto.getCustomerId().intValue());
        }
        if (dto.getProductGroupId() != null) {
            productGroup = productGroupService.getById(dto.getProductGroupId());
        }

        if (customer == null || productGroup == null) {

            return false;
        }

        PurchaseEntity entity = new PurchaseEntity();

        entity.setVoucherType(dto.getVoucherType());
        entity.setMake(dto.getMake());
        entity.setModel(dto.getModel());
        entity.setProductCode(dto.getProductCode());
        entity.setItemName(dto.getItemName());
        entity.setOpeningValue(dto.getOpeningValue());
        entity.setOpeningBalance(dto.getOpeningBalance());
        entity.setPurchasePrice(dto.getPurchasePrice());
        entity.setOrderDueDate(dto.getOrderDueDate());

        entity.setCustomer(customer);
        entity.setProductGroup(productGroup);
        entity.setStatus("PENDING");

        return purchaseRepo.savePurchase(entity);
    }
}
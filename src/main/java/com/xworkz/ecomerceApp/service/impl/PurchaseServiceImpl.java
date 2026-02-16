package com.xworkz.ecomerceApp.service.impl;

import com.xworkz.ecomerceApp.dto.PurchaseDto;
import com.xworkz.ecomerceApp.entity.ProductNameEntity;
import com.xworkz.ecomerceApp.entity.PurchaseEntity;
import com.xworkz.ecomerceApp.repositry.PurchaseRepo;
import com.xworkz.ecomerceApp.service.AddCoustomerService;
import com.xworkz.ecomerceApp.service.ProductService;
import com.xworkz.ecomerceApp.service.PurchaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

    @Override
    public List<PurchaseEntity> getPendingPurchases() {
        return  purchaseRepo.findPendingPurchases();
    }

    @Override
    public PurchaseEntity markAsApproved(long id) {
        PurchaseEntity purchaseEntity=purchaseRepo.findById(id);
        if(purchaseEntity!=null) {
            System.err.println(purchaseEntity);
            purchaseEntity.setStatus("APPROVED");
            purchaseRepo.update(purchaseEntity);
            System.err.println(purchaseEntity);
            return purchaseEntity;
        }
       return null;
    }

    @Override
    public PurchaseEntity  markAsRejected(long id) {
        PurchaseEntity purchaseEntity=purchaseRepo.findById(id);
        if(purchaseEntity!=null) {
            System.err.println(purchaseEntity);
            purchaseEntity.setStatus("REJECTED");
            purchaseRepo.update(purchaseEntity);
            System.err.println(purchaseEntity);
            return purchaseEntity;
        }
        return null;
    }


        @Override
        public PurchaseEntity findById(long id) {
            return purchaseRepo.find(id);
        }

//    @Override
//    public List<PurchaseEntity> fetchAllProductList() {
//        return purchaseRepo.findAllPurchases();
//    }


//    @Override
//    public List<PurchaseEntity> findByStatus(String status) {
//        return purchaseRepo.findAllPurchasesByStatus(status);
//    }


}
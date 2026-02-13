package com.xworkz.ecomerceApp.service;

import com.xworkz.ecomerceApp.dto.PurchaseDto;
import com.xworkz.ecomerceApp.entity.PurchaseEntity;

import java.util.List;

public interface PurchaseService {
    boolean savePurchase(PurchaseDto dto);

    List<PurchaseEntity> getAllPurchases();

    List<PurchaseEntity> getPendingPurchases();

        PurchaseEntity markAsApproved(long id);

    PurchaseEntity markAsRejected(long id);

    PurchaseEntity findById(long id);

//    List<PurchaseEntity> findByStatus(String status);


}

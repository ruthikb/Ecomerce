package com.xworkz.ecomerceApp.repositry;

import com.xworkz.ecomerceApp.entity.PurchaseEntity;

import java.util.List;

public interface PurchaseRepo    {
    boolean savePurchase(PurchaseEntity entity);

    List<PurchaseEntity> findAllPurchases();

    List<PurchaseEntity> findPendingPurchases();

    boolean Approved(long id);

    boolean rejected(long id);

    PurchaseEntity findById(long id);

    boolean update(PurchaseEntity purchaseEntity);

    PurchaseEntity find(long id);

//    List<PurchaseEntity> findAllPurchasesByStatus(String status);
}

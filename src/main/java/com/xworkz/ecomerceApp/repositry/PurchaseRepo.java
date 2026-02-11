package com.xworkz.ecomerceApp.repositry;

import com.xworkz.ecomerceApp.entity.PurchaseEntity;

import java.util.List;

public interface PurchaseRepo    {
    boolean savePurchase(PurchaseEntity entity);

    List<PurchaseEntity> findAllPurchases();
}

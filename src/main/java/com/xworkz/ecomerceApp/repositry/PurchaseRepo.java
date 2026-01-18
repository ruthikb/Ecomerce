package com.xworkz.ecomerceApp.repositry;

import com.xworkz.ecomerceApp.entity.PurchaseEntity;

public interface PurchaseRepo    {
    boolean savePurchase(PurchaseEntity entity);
}

package com.xworkz.ecomerceApp.repositry.impl;

import com.xworkz.ecomerceApp.entity.PurchaseEntity;
import com.xworkz.ecomerceApp.repositry.PurchaseRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
@Repository
public class PurchaseRepoImpl implements PurchaseRepo {

    @Autowired
    EntityManagerFactory entityManagerFactory;
    @Override
    public boolean savePurchase(PurchaseEntity entity) {
        try {
       EntityManager entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();
            entityManager.persist(entity);
            entityManager.getTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}

package com.xworkz.ecomerceApp.repositry.impl;

import com.xworkz.ecomerceApp.entity.PurchaseEntity;
import com.xworkz.ecomerceApp.repositry.PurchaseRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import java.util.Collections;
import java.util.List;

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

    @Override
    public List<PurchaseEntity> findAllPurchases() {
        try {
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();
            Query query = entityManager.createNamedQuery("findAllPurchases");
            List<PurchaseEntity> result = query.getResultList();
            entityManager.getTransaction().commit();
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Collections.emptyList();

        }

    @Override
    public List<PurchaseEntity> findPendingPurchases() {
        try {
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();
            Query query = entityManager.createNamedQuery("findPendingPurchases");
            List<PurchaseEntity> result = query.getResultList();
            entityManager.getTransaction().commit();
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return Collections.emptyList();
    }

    @Override
    public boolean Approved(long id) {
        try{
            EntityManager entityManager= entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();
            Query  query=entityManager.createNamedQuery("ApprovedPurchase");
            query.setParameter("id",id);
            int updatedCount=query.executeUpdate();
            entityManager.getTransaction().commit();
            return updatedCount > 0;
        }catch (Exception e){
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean rejected(long id) {
        try{
            EntityManager entityManager= entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();
            Query  query=entityManager.createNamedQuery("rejectedPurchase");
            query.setParameter("id",id);
            int updatedCount=query.executeUpdate();
            entityManager.getTransaction().commit();
            return updatedCount > 0;
        }catch (Exception e){
            e.printStackTrace();

        }
        return false;
    }
}

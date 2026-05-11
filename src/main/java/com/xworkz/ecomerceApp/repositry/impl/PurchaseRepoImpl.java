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

    @Override
    public PurchaseEntity findById(long id) {
        try{
            EntityManager  entityManager= entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();
            Query query=entityManager.createNamedQuery("findById");
            query.setParameter("id",id);
            PurchaseEntity result=(PurchaseEntity) query.getSingleResult();
            entityManager.getTransaction().commit();
            return result;
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean update(PurchaseEntity purchaseEntity) {
        try{
            EntityManager entityManager= entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();
            entityManager.merge(purchaseEntity);
            entityManager.getTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public PurchaseEntity find(long id) {
        EntityManager manager= entityManagerFactory.createEntityManager();
        return  manager.find(PurchaseEntity.class,id);
    }

//    @Override
//    public List<PurchaseEntity> findAllPurchasesByStatus(String status) {
//        try {
//            EntityManager entityManager = entityManagerFactory.createEntityManager();
//            entityManager.getTransaction().begin();
//            Query query = entityManager.createNamedQuery("findAllPurchasesByStatus");
//            query.setParameter("status", status);
//            List<PurchaseEntity> result = query.getResultList();
//            entityManager.getTransaction().commit();
//            return result;
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return Collections.emptyList();
//    }
}

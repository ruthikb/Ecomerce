package com.xworkz.ecomerceApp.repositry.impl;

import com.xworkz.ecomerceApp.entity.SalesEntity;
import com.xworkz.ecomerceApp.repositry.SalesRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import java.util.Collections;
import java.util.List;

@Repository
public class SalesRepoImpl implements SalesRepo {

    @Autowired
    EntityManagerFactory entityManagerFactory;
    @Override
    public boolean Saved(SalesEntity salesEntity) {
        EntityManager manager = null;
        try{
            manager = entityManagerFactory.createEntityManager();
            manager.getTransaction().begin();
            manager.persist(salesEntity);
            manager.getTransaction().commit();
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }finally {
            if(manager != null && manager.isOpen()){
                manager.close();
            }
        }
    }

    @Override
    public List<SalesEntity> findAll() {
        EntityManager entityManager=entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query=entityManager.createNamedQuery("findAllSales");
            entityManager.getTransaction().commit();
            return (List<SalesEntity>) query.getResultList();
        }catch (Exception e){
            System.err.println(e.getMessage());
        }
        finally {
            if (entityManager != null && entityManager.isOpen()) {
                entityManager.close();
            }
        }
        return Collections.emptyList();
    }
}

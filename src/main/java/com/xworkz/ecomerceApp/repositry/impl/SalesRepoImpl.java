package com.xworkz.ecomerceApp.repositry.impl;

import com.xworkz.ecomerceApp.entity.SalesEntity;
import com.xworkz.ecomerceApp.repositry.SalesRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
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
}

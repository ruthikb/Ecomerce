package com.xworkz.ecomerceApp.repositry.impl;

import com.xworkz.ecomerceApp.dto.ProductNameDto;
import com.xworkz.ecomerceApp.entity.ProductNameEntity;
import com.xworkz.ecomerceApp.repositry.ProductNameRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
@Repository
public class ProductNameRepoImpl implements ProductNameRepo {
    @Autowired
    EntityManagerFactory entityManagerFactory;

    @Override
    public boolean isProductNameExists(String productName) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query = entityManager.createNamedQuery("isProductNameExists");
            query.setParameter("productName", productName);
            entityManager.getTransaction().commit();
            Object result = query.getSingleResult();
            return true;
        } catch (Exception e) {
            System.err.println(e.getMessage());
            return false;
        } finally {
            entityManager.close();
        }
    }

    @Override
    public boolean saveProductName(ProductNameEntity productNameEntity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(productNameEntity);
            entityManager.getTransaction().commit();
            return true;

        } catch (Exception e) {
            System.err.println(e.getMessage());
            return false;
        } finally {
            entityManager.close();
        }


    }
}

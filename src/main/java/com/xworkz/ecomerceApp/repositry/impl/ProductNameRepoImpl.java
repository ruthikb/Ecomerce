package com.xworkz.ecomerceApp.repositry.impl;

import com.xworkz.ecomerceApp.dto.ProductNameDto;
import com.xworkz.ecomerceApp.entity.ProductNameEntity;
import com.xworkz.ecomerceApp.repositry.ProductNameRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import java.util.Collections;
import java.util.List;

@Repository
public class ProductNameRepoImpl implements ProductNameRepo {
    @Autowired
    EntityManagerFactory entityManagerFactory;


    @Override
    public void save(ProductNameEntity productGroupEntity) {
        try {
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();
            entityManager.persist(productGroupEntity);
            entityManager.getTransaction().commit();
            entityManager.close();
        }
        catch (Exception e){
            e.printStackTrace();

    }

}

    @Override
    public List<ProductNameEntity> findById(int id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            Query query = entityManager.createNamedQuery("getNameById");
            query.setParameter("id", id);
            return query.getResultList();
        } finally {
            entityManager.close();
        }
    }

    @Override
    public List<ProductNameEntity> findAllProductNames() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            Query query = entityManager.createNamedQuery("getAllProductNames");
            return query.getResultList();
        } finally {
            entityManager.close();
        }
    }

    @Override
    public List<String> findAllProductNamesOnly() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            Query query = entityManager.createNamedQuery("getAllProductNamesOnly");
            return query.getResultList();
        } finally {
            entityManager.close();
        }
    }
}

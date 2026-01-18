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
    public List<ProductNameEntity> findAllProductGroupName() {
        try {
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            Query query = entityManager.createQuery("SELECT p FROM ProductNameEntity p");
            List<ProductNameEntity> productNames = query.getResultList();
            entityManager.close();
            return productNames;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Collections.emptyList();

    }

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
    public List<ProductNameEntity> fetchProductNames() {
        entityManagerFactory=null;
        try {
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            Query query= entityManager.createQuery("select p from ProductNameEntity p");
            return query.getResultList();
        }
        catch (Exception e){
            e.printStackTrace();
            return Collections.emptyList();
        }
        finally {
            entityManagerFactory.close();
        }
    }
}

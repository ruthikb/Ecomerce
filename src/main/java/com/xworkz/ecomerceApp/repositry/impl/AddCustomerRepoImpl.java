package com.xworkz.ecomerceApp.repositry.impl;


import com.xworkz.ecomerceApp.dto.enums.CustomerType;
import com.xworkz.ecomerceApp.entity.AddCustomerEntity;
import com.xworkz.ecomerceApp.entity.UserEntity;
import com.xworkz.ecomerceApp.repositry.AddCustomerRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import java.util.Collections;
import java.util.List;

@Repository
public class AddCustomerRepoImpl implements AddCustomerRepo {
    @Autowired
    EntityManagerFactory entityManagerFactory;





    @Override
    public AddCustomerEntity save(AddCustomerEntity entity) {
        try {
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();
            entityManager.persist(entity);
            entityManager.getTransaction().commit();
            entityManager.close();
            return entity;
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return null;
    }

    @Override
    public List<AddCustomerEntity> findAll() {
        try {
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();
            Query query = entityManager.createNamedQuery("AddCustomerEntity.findAll");
            List<AddCustomerEntity> result = query.getResultList();
            entityManager.getTransaction().commit();
            entityManager.close();
            return result;
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return Collections.emptyList();
    }

    @Override
    public AddCustomerEntity getById(int id) {
        try {
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();
            Query query = entityManager.createNamedQuery("AddCustomerEntity.getById");
            query.setParameter("id", id);
            AddCustomerEntity result = (AddCustomerEntity) query.getSingleResult();
            entityManager.getTransaction().commit();
            entityManager.close();
            return result;
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return null;
    }

    @Override
    public boolean deleteById(int id) {
        try {
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();
            AddCustomerEntity entity = entityManager.find(AddCustomerEntity.class, id);
            if (entity != null) {
                entityManager.remove(entity);
                entityManager.getTransaction().commit();
                entityManager.close();
                return true;
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return false;
    }

    @Override
    public List<AddCustomerEntity> findByType(String type) {
        try {
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();
            Query query = entityManager.createNamedQuery("AddCustomerEntity.findByType");
            query.setParameter("type", type);
            List<AddCustomerEntity> result = query.getResultList();
            entityManager.getTransaction().commit();
            entityManager.close();
            return result;
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return Collections.emptyList();
    }

    @Override
    public List<String> findDebtorCustomerTypes() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            Query query = entityManager.createNamedQuery("getDebtorCustomerTypes");
            query.setParameter("type", "debtor");
            return query.getResultList();
        } finally {
            entityManager.close();
        }
    }

//    @Override
//    public List<AddCustomerEntity> getDebitCustomers() {
//        try {
//            EntityManager entityManager = entityManagerFactory.createEntityManager();
//            entityManager.getTransaction().begin();
//            Query query = entityManager.createNamedQuery("getDebitCustomers");
//            query.setParameter("type", CustomerType.debtor);
//            List<AddCustomerEntity> result = query.getResultList();
//            entityManager.getTransaction().commit();
//            entityManager.close();
//            return result;
//        } catch (Exception e) {
//            System.err.println(e.getMessage());
//        }
//
//        return Collections.emptyList();
//    }
}

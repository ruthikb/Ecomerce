package com.xworkz.ecomerceApp.repositry.impl;


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
    public boolean saveCustomer(AddCustomerEntity addCustomerEntity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(addCustomerEntity);
            entityManager.getTransaction().commit();
            return true;
        }catch (Exception e){
            System.err.println(e.getMessage());
            return false;
        }
        finally {
            entityManager.close();
        }

    }

    @Override
    public List<AddCustomerEntity> getAllCoustomers() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query = entityManager.createNamedQuery("getAllCustomer");
            entityManager.getTransaction().commit();
            return (List<AddCustomerEntity>)query.getResultList();
        }catch (Exception e) {
            System.err.println(e.getMessage());
        return Collections.emptyList();
        }
        finally {
            entityManager.close();
        }
    }

    @Override
    public AddCustomerEntity getCoustomerById(int id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query = entityManager.createNamedQuery("getCustomerById");
            query.setParameter("id",id);
            entityManager.getTransaction().commit();
            return (AddCustomerEntity) query.getSingleResult();
        }catch (Exception e) {
            System.err.println(e.getMessage());
            return (AddCustomerEntity) Collections.emptyList();
        }
        finally {
            entityManager.close();
        }
    }

    @Override
    public boolean updateCustomerById(int id, AddCustomerEntity addCustomerEntity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.merge(addCustomerEntity);
            entityManager.getTransaction().commit();
            return true;
        }catch (Exception e){
            System.err.println(e.getMessage());
            return false;
        }finally {
            entityManager.close();
        }

    }

    @Override
    public boolean deleteCustomerById(int id) {
        System.err.println("repo id"+id);
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query = entityManager.createNamedQuery("deleteCustomer");
            query.setParameter("id",id);
            query.executeUpdate();
            entityManager.getTransaction().commit();
            return true;
        } catch (Exception e) {
            System.err.println(e.getMessage());
            return false;
        }
        finally {
            entityManager.close();
        }
    }

    @Override
    public UserEntity getAdminName(String email) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query = entityManager.createNamedQuery("getAdminName");
            query.setParameter("email",email);
            entityManager.getTransaction().commit();
            return (UserEntity) query.getSingleResult();
        } catch (Exception e) {
            System.err.println(e.getMessage());
            return (UserEntity) Collections.emptyList();
        }
        finally {
            entityManager.close();
        }

    }


}

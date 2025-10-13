package com.xworkz.ecomerceApp.repositry.impl;

import com.xworkz.ecomerceApp.entity.UserEntity;
import com.xworkz.ecomerceApp.repositry.UserRepositry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

@Repository
public class UserRepositryImpl implements UserRepositry {

    public void setFactory(EntityManagerFactory factory) {
        System.err.println("repositry implematation");
    }

    @Autowired
    EntityManagerFactory factory;

    @Override
    public boolean registerUser(UserEntity userEntity) {
        System.err.println(userEntity);
        try {
            EntityManager entityManager = factory.createEntityManager();
            entityManager.getTransaction().begin();
            entityManager.persist(userEntity);
            entityManager.getTransaction().commit();
            return true;
        } catch (Exception e) {
            System.err.println(e.getMessage() + "======");
            System.err.println(e.getMessage());
            return false;
        }


    }

    @Override
    public UserEntity findEmailRepo(String email) {
        System.err.println(email);
        try {
            EntityManager entityManager = factory.createEntityManager();
            entityManager.getTransaction().begin();
            Query query = entityManager.createNamedQuery("getEmail");
            query.setParameter("email", email);
            entityManager.getTransaction().commit();

        }catch (Exception e){
            System.err.println(e.getMessage());
        }

        return null;
    }
}

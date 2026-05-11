package com.xworkz.ecomerceApp.repositry.impl;

import com.xworkz.ecomerceApp.dto.enums.Role;
import com.xworkz.ecomerceApp.entity.UserEntity;
import com.xworkz.ecomerceApp.repositry.ViewUserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import java.util.Collections;
import java.util.List;
@Repository
public class ViewUserRepoImpl implements ViewUserRepo {
    @Autowired
    EntityManagerFactory entityManagerFactory;
    @Override
    public List<UserEntity> getUser() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query=entityManager.createNamedQuery("getAllUser");
            entityManager.getTransaction().commit();
            return (List<UserEntity>)query.getResultList();
        } catch (Exception e) {
            System.err.println(e.getMessage());
            return Collections.emptyList();
        }
        finally {
            entityManager.close();
        }

    }

    @Override
    public UserEntity getUserById(int id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try{
            entityManager.getTransaction().begin();
            Query query = entityManager.createNamedQuery("getUserById");
            query.setParameter("id",id);
            entityManager.getTransaction().commit();
            return (UserEntity) query.getSingleResult();
        }catch (Exception e){
            System.err.println(e.getMessage());
            return (UserEntity) Collections.emptyList();
        }
        finally {
            entityManager.close();
        }
    }

    @Override
    public boolean deleteUserById(int id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query = entityManager.createNamedQuery("deleteUserById");
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
}

package com.xworkz.ecomerceApp.repositry.impl;
import com.xworkz.ecomerceApp.entity.UserEntity;
import com.xworkz.ecomerceApp.repositry.UserRepositry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

@Repository
public class UserRepositryImpl implements UserRepositry{



    @Autowired
     EntityManagerFactory entityManagerFactory;
    @Override
    public boolean registerUser(UserEntity  userEntity) {
        EntityManager entityManager = null;
        EntityTransaction entityTransaction = null;
        try {
            entityManager=entityManagerFactory.createEntityManager();
            entityTransaction=entityManager.getTransaction();
            entityTransaction.begin();
            entityManager.persist(userEntity);
            entityTransaction.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean existsEmailOrPhone(String email, Long phone) {
        EntityManager entityManager = null;
        try {
            entityManager = entityManagerFactory.createEntityManager();

            Query query = entityManager.createNamedQuery("userExist");
            query.setParameter("email", email);
            query.setParameter("phone", phone);
            Long count = (Long) query.getSingleResult();
            return count > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }

    }

    @Override
    public void clearOtp() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
    try {
        entityManager.getTransaction().begin();
        Query query = entityManager.createNamedQuery("clearOtp");
        query.executeUpdate();
        entityManager.getTransaction().commit();
    }
    catch (Exception e){
        System.err.println(e.getMessage());
    }
    finally {
        entityManager.close();
    }
    }


}

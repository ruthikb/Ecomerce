package com.xworkz.ecomerceApp.repositry.impl;

import com.xworkz.ecomerceApp.entity.AdminEntity;
import com.xworkz.ecomerceApp.entity.LoginEntity;
import com.xworkz.ecomerceApp.entity.UserEntity;
import com.xworkz.ecomerceApp.repositry.LoginRepositry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import java.util.List;

@Repository
public class LoginRepoImpl implements LoginRepositry {

    @Autowired
    EntityManagerFactory entityManagerFactory;


    @Override
        public UserEntity  findByEmailOrPhone(String emailOrPhone) {
        System.err.println("repo got invoked");
        System.out.println(emailOrPhone);
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            Query query = entityManager.createNamedQuery("findByEmailOrPhone");

            query.setParameter("email", emailOrPhone);
            query.setParameter("phone", emailOrPhone);
            System.err.println("repo got ended");


            return (UserEntity) query.getResultStream().findFirst().orElse(null);
        } finally {
            entityManager.close();
        }

    }

    @Override
    public boolean updateUser(UserEntity user) {
        EntityManager entityManager = null;
        try {
            entityManager = entityManagerFactory.createEntityManager();
            entityManager.getTransaction().begin();
            entityManager.merge(user);
            entityManager.getTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;

        } finally {
           entityManager.close();
        }

    }

    @Override
    public boolean saveAdmin(AdminEntity adminEntity) {
        return saveLoginInfo(adminEntity, "AdminEntity.checkTodayLogin");
    }

    @Override
    public boolean saveUser(LoginEntity loginEntity) {
        return saveLoginInfo(loginEntity, "LoginEntity.checkTodayLogin");
    }

    @Override
    public boolean saveOtp(UserEntity user) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.merge(user);
            entityManager.getTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        finally {
            entityManager.close();
        }
    }

    @Override
    public boolean updatePassword(UserEntity entity) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.merge(entity);
            entityManager.getTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        finally {
            entityManager.close();
        }
    }

    private <T> boolean saveLoginInfo(T entity, String  string) {
        EntityManager entityManager = null;
        try {
            entityManager = entityManagerFactory.createEntityManager();
          entityManager.getTransaction().begin();

            Query query =entityManager.createNamedQuery(string);
            if (entity instanceof AdminEntity) {
                AdminEntity admin = (AdminEntity) entity;
                query.setParameter("emailOrPhoneNumber", admin.getEmailOrPhoneNumber());
                query.setParameter("today", admin.getLoginDate());
            } else if (entity instanceof LoginEntity) {
                LoginEntity login = (LoginEntity) entity;
                query.setParameter("emailOrPhoneNumber", login.getEmailOrPhoneNumber());
                query.setParameter("today", login.getLoginDate());
            }

            Object resultList = query.getResultStream().findFirst().orElse(null);

            if (resultList != null) {
                System.out.println("Login already exists today. Updating time...");
                if (entity instanceof AdminEntity) {
                    AdminEntity admin = (AdminEntity) entity;
                    AdminEntity existingAdmin = (AdminEntity) resultList;
                    existingAdmin.setLoginTime(admin.getLoginTime());
                    entityManager.merge(existingAdmin);
                } else if (entity instanceof LoginEntity) {
                    LoginEntity login=(LoginEntity) entity;
                    LoginEntity existingUser = (LoginEntity) resultList;
                    existingUser.setLoginTime(login.getLoginTime());
                    entityManager.merge(existingUser);
                }
            } else {
                System.out.println("Inserting new login record...");
                entityManager.persist(entity);
            }

            entityManager.getTransaction().commit();
            return true;

        } catch (Exception e) {

            e.printStackTrace();
            return false;
        } finally {
            entityManager.close();
        }
    }

}




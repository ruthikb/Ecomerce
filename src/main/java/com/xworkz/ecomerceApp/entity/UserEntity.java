package com.xworkz.ecomerceApp.entity;

import com.xworkz.ecomerceApp.dto.enums.Role;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor

@NamedQueries({
        @NamedQuery(name = "userExist", query = "select count(u) from UserEntity u where u.email=:email or u.phone=:phone"),
        @NamedQuery(name = "findByEmailOrPhone", query = "FROM UserEntity u  WHERE u.email = :email OR u.phone = :phone"),
        @NamedQuery(name = "clearOtp",query = "update UserEntity set otp=null")
})
public class UserEntity{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  int id;
    @Column(name = "first_name")
    private  String  firstName;
    @Column(name = "last_name")
    private  String  lastName;
    @Column(name = "email")
    private  String email;
    @Column (name = "password")
    private  String  password;
    @Column(name ="role")
    @Enumerated(EnumType.STRING)
    private Role role;
    @Column(name = "phone")
    private  String phone;
    @Column(name = "failed_attempts")
    private Integer failedAttempts;
    @Column(name = "lock_time")
    private LocalDateTime lockTime;
    @Column(name = "otp")
    private String otp;
}

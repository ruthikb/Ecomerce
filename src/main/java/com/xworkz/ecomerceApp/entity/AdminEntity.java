package com.xworkz.ecomerceApp.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalTime;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor

@NamedQueries(
        @NamedQuery(name = "AdminEntity.checkTodayLogin",query = "FROM AdminEntity  WHERE emailOrPhoneNumber = :emailOrPhoneNumber AND loginDate = :today")
)
public class AdminEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "emailOrPhone")
    private String emailOrPhoneNumber;

    @Column(name = "password")
    private String password;

    @Column(name = "login_date")
    private LocalDate loginDate;

    @Column(name = "login_time")
    private LocalTime loginTime;

}

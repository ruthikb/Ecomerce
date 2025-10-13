package com.xworkz.ecomerceApp.entity;

import com.xworkz.ecomerceApp.dto.Role;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(schema = "user_register")
@NamedQueries(
        @NamedQuery(name = "getEmail",query = " from UserEntity where email=:email")
)
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
    private  long Phone;
}

package com.xworkz.ecomerceApp.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "sales_list")
@Data
public class SalesEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    @Column(name = "customer_name")
    private String customerId;
    @Column(name = "product_name")
    private String productGroupId;
    private String brand;
    private String model;
    @Column(name = "selling_price")
    private String sellingPrice;
    private String quantity;
    @Column(name = "total_amount")
    private String totalAmount;
    @Column(name = "sales_date")
    private String salesDate;
    private String email;
}

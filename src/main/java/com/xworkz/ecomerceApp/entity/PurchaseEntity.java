package com.xworkz.ecomerceApp.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDate;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@NamedQueries(
        @NamedQuery(name = "findAllPurchases", query = "SELECT p FROM PurchaseEntity p")
)
public class PurchaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String voucherType;

    @ManyToOne
    @JoinColumn(name = "customer_id")
    private AddCustomerEntity customer;

    @ManyToOne
    @JoinColumn(name = "product_group_id")
    private ProductNameEntity productGroup;

    private String make;
    private String model;
    private String productCode;
    private String itemName;
    private double openingValue;
    private int openingBalance;
    private double purchasePrice;
    private LocalDate orderDueDate;
    private String status;
}

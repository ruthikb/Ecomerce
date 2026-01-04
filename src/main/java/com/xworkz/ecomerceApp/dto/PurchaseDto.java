package com.xworkz.ecomerceApp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PurchaseDto {
    private String voucherType;
    private Long customerId;
    private Long productGroupId;
    private String make;
    private String model;
    private String productCode;
    private String itemName;
    private double openingValue;
    private int openingBalance;
    private double purchasePrice;

    private LocalDate orderDueDate;
}

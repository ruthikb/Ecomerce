package com.xworkz.ecomerceApp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class purchaseDto {


    private String voucherType;


    private String customerName;


    private String productGroupName;


    private String make;

    private String model;

    private String productCode;


    private String itemName;


    private Double openingValue;

    private Integer openingBalance;

    private  Integer quantity;

    private Double purchasePrice;


}

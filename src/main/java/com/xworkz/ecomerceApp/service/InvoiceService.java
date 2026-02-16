package com.xworkz.ecomerceApp.service;

import com.xworkz.ecomerceApp.dto.SalesDto;
import com.xworkz.ecomerceApp.entity.PurchaseEntity;

import java.io.File;

public interface InvoiceService {

        byte[] generateInvoiceForPurchase(PurchaseEntity purchaseEntity);

        File generateInvoicePdfForSales(SalesDto salesDto);
    }


package com.xworkz.ecomerceApp.service;

import com.xworkz.ecomerceApp.dto.SalesDto;

import java.util.List;

public interface SalesService {
    boolean save(SalesDto salesDto);

    List<SalesDto> getAllSales();
}

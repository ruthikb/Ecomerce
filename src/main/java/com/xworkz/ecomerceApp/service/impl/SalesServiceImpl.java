package com.xworkz.ecomerceApp.service.impl;

import com.xworkz.ecomerceApp.dto.SalesDto;
import com.xworkz.ecomerceApp.entity.SalesEntity;
import com.xworkz.ecomerceApp.repositry.SalesRepo;
import com.xworkz.ecomerceApp.service.SalesService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class SalesServiceImpl implements SalesService {
    @Autowired
    SalesRepo salesRepo;

    @Override
    public boolean save(SalesDto salesDto) {
        if (salesDto != null) {
            SalesEntity salesEntity = new SalesEntity();
            BeanUtils.copyProperties(salesDto, salesEntity);
            return salesRepo.Saved(salesEntity);
        }
        return false;
    }

    @Override
    public List<SalesDto> getAllSales() {
        List<SalesDto> salesDtos = new ArrayList<>();
        List<SalesEntity> salesEntities = salesRepo.findAll();
        for (SalesEntity salesEntity : salesEntities) {
            SalesDto salesDto = new SalesDto();
            BeanUtils.copyProperties(salesEntity, salesDto);
            salesDtos.add(salesDto);
        }
        return salesDtos;

    }
}

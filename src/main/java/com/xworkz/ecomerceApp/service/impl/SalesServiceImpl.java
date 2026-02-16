package com.xworkz.ecomerceApp.service.impl;

import com.xworkz.ecomerceApp.dto.SalesDto;
import com.xworkz.ecomerceApp.entity.SalesEntity;
import com.xworkz.ecomerceApp.repositry.SalesRepo;
import com.xworkz.ecomerceApp.service.SalesService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SalesServiceImpl implements SalesService {
    @Autowired
    SalesRepo salesRepo;
    @Override
    public boolean save(SalesDto salesDto) {
        if (salesDto!=null){
            SalesEntity salesEntity = new SalesEntity();
            BeanUtils.copyProperties(salesDto,salesEntity);
            return salesRepo.Saved(salesEntity);
        }
        return false;
    }
}

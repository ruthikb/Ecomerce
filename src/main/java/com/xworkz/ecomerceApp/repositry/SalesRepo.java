package com.xworkz.ecomerceApp.repositry;

import com.xworkz.ecomerceApp.entity.SalesEntity;

import java.util.List;

public interface SalesRepo {
    boolean Saved(SalesEntity salesEntity);

    List<SalesEntity> findAll();
}

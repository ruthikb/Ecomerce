package com.xworkz.ecomerceApp.scheduler.impl;

import com.xworkz.ecomerceApp.repositry.UserRepositry;
import com.xworkz.ecomerceApp.scheduler.ClearOtpScheduler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class ClearOtpSchedulerImpl implements ClearOtpScheduler {
@Autowired
    UserRepositry userRepositry;

@Scheduled(fixedRate = 50000)
public  void clearOtp(){
        userRepositry.clearOtp();
}
}

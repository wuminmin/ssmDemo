package com.qianqiulin.ssmDemo.service;

import javax.jws.WebMethod;
import javax.jws.WebService;
import java.util.Date;

/**
 * Created by TyurinTsien
 * Date：24/07/2017
 * Tel：18081002339
 */
@WebService
public class demo {


    @WebMethod
    public String getDateNow(String yourName) {

        return "Hi," + yourName + "\n" + String.valueOf(new Date());
    }
}

package com.qianqiulin.ssmDemo.controller;

import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by TyurinTsien
 * Date：17/09/2017
 * Tel：18081002339
 */
@Controller
@RequestMapping("/test")
public class TestController {

    @RequestMapping(value = "/page")
    public ModelAndView employee(HttpServletRequest request, HttpServletResponse response) {

        ModelAndView mav = new ModelAndView();
        mav.setViewName("/webpart/test");
        return mav;
    }

    @ResponseBody
    @RequestMapping(value = "/json", method = {RequestMethod.GET}, produces = "text/plain;charset=UTF-8")
    public String employeeJson(HttpServletRequest request, HttpServletResponse response) {

        return "{  \n" +
                "    employee :  \n" +
                "    {  \n" +
                "        firstName: \"John\",  \n" +
                "        lastName : \"Doe\",  \n" +
                "        employeeNumber : 123,  \n" +
                "        title : \"Accountant\"  \n" +
                "    }  \n" +
                "}  ";
    }
}
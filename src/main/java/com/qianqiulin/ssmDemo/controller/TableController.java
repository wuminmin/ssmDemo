package com.qianqiulin.ssmDemo.controller;

import com.qianqiulin.ssmDemo.pojo.Complaint;
import com.qianqiulin.ssmDemo.sqlService.ComplaintSql;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import static java.lang.System.out;

@Controller
@RequestMapping("/")
public class TableController {

    @Autowired
    private ComplaintSql complaintSql;

    @RequestMapping(value = "table")
    public ModelAndView table(ModelAndView mav){
        List<Complaint> complaints = complaintSql.selectAllComplaintList();
        mav.addObject("complaints", complaints);
        mav.setViewName("table");
        return mav;
    }

    @RequestMapping(value = "add")
    public ModelAndView add(ModelAndView mav, Complaint request){
        Complaint record = request;

        System.out.println("aaaaaaaaaaaaaaaaaaa"+request.getYingyebu().toString());

        SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒");
        Date date = new Date(System.currentTimeMillis());
        String time = format.format(date);
        record.setDate(time);

//        String msg = this.validate(record);
//        modelAndView.addObject("customer", record);
//
//        if (msg != null && msg.length() > 0)
//        {
//            modelAndView.addObject("error", msg);
//            return modelAndView;
//        }
        int id = complaintSql.insert(record);
        mav.setViewName("record");
        return mav;
    }

    @RequestMapping(value = "record")
    public ModelAndView record(ModelAndView mav){
        mav.setViewName("record");
        return mav;
    }

    @RequestMapping(value = "login")
    public ModelAndView login(ModelAndView mav){
        return mav;
    }
}

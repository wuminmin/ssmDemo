package com.qianqiulin.ssmDemo.controller;

import com.qianqiulin.ssmDemo.pojo.Complaint;
import com.qianqiulin.ssmDemo.sqlService.ComplaintSql;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/")
public class TableController {

    @Autowired
    private ComplaintSql complaintSql;
    @RequestMapping(value = "table")
    public ModelAndView table(ModelAndView mav,HttpServletRequest request, HttpServletResponse response){

        HashMap<String, Object> hashMap = new HashMap<String, Object>();
        String _id = request.getParameter("id");
        String yingyebu = request.getParameter("yingyebu");
        String didian = request.getParameter("didian");
        String jingdu = request.getParameter("jingdu");
        String weidu = request.getParameter("weidu");
        String fugaiyonghushu = request.getParameter("fugaiyonghushu");
        String gudingdianhuashu = request.getParameter("gudingdianhuashu");
        String tietaqingkuang = request.getParameter("tietaqingkuang");
        String jiejuefangan = request.getParameter("jiejuefangan");
        String date = request.getParameter("date");
        String chulijieguo = request.getParameter("chulijieguo");
        int id = Integer.parseInt(_id);

        hashMap.put("id", id);
        hashMap.put("yingyebu", yingyebu);
        hashMap.put("didian", didian);
        hashMap.put("jingdu", jingdu);
        hashMap.put("weidu", weidu);
        hashMap.put("fugaiyonghushu", fugaiyonghushu);
        hashMap.put("gudingdianhuashu", gudingdianhuashu);
        hashMap.put("tietaqingkuang", tietaqingkuang);
        hashMap.put("jiejuefangan", jiejuefangan);
        hashMap.put("date", date);
        hashMap.put("chulijieguo", chulijieguo);

        mav.addObject("id", id);
        mav.addObject("yingyebu", yingyebu);
        mav.addObject("didian", didian);
        mav.addObject("jingdu", jingdu);
        mav.addObject("weidu", weidu);
        mav.addObject("fugaiyonghushu", fugaiyonghushu);
        mav.addObject("gudingdianhuashu", gudingdianhuashu);
        mav.addObject("tietaqingkuang", tietaqingkuang);
        mav.addObject("jiejuefangan", jiejuefangan);
        mav.addObject("date", date);
        mav.addObject("chulijieguo", chulijieguo);

        List<Complaint> complaints = complaintSql.selectAllComplaintList();
        mav.addObject("Complaint", complaints);
//        mav.setViewName("/table_bootstrap");
        return mav;
    }
}

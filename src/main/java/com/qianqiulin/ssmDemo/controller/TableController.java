package com.qianqiulin.ssmDemo.controller;

import com.alibaba.fastjson.JSON;
import com.qianqiulin.ssmDemo.pojo.Complaint;
import com.qianqiulin.ssmDemo.pojo.User;
import com.qianqiulin.ssmDemo.sqlService.ComplaintSql;
import com.qianqiulin.ssmDemo.view.ExcelView;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

import static java.lang.System.out;


@Controller
@RequiresRoles("admins")
@RequestMapping("/table")
public class TableController {

    @Autowired
    private ComplaintSql complaintSql;

    @RequestMapping(value = "/table")
    public ModelAndView table(ModelAndView mav, HttpSession httpSession){
        String userName = (String) httpSession.getAttribute("userName");
        Integer userID = Integer.parseInt(String.valueOf(httpSession.getAttribute("userID")  != null ? httpSession.getAttribute("userID") : "0").trim());
        String userRole = (String) httpSession.getAttribute("userRole");
        if (userRole.equals("2")) {
//            mav.addObject("users", users);
//            mav.setViewName("user");
//            return mav;

            List<Complaint> complaints = complaintSql.selectAllComplaintList();
            mav.addObject("complaints", complaints);
            mav.setViewName("table");
            return mav;

        }else if(userRole.equals("1")){
//            List<User> newusers = new ArrayList<User>();
//            User newUser = userSql.selectByPrimaryUsername(userName);
//            newusers.add(newUser);
//            mav.addObject("user", newUser);
//            mav.setViewName("userNormal");
//            return mav;


            List<Complaint> complaints = complaintSql.selectAllComplaintList();
            mav.addObject("complaints", complaints);
            mav.setViewName("tableNormal");
            return mav;

        }else{
            mav.setViewName("redirect:/table/tableNormal");
            return mav;
        }

    }

    @RequestMapping(value = "/excel",method = RequestMethod.GET)
    public ModelAndView excel(ModelAndView modelAndView ,HttpServletRequest request)throws Exception{

        List<Complaint> customers = complaintSql.selectAllComplaintList();
        Map<String,List<Complaint>> map = new HashMap<String,List<Complaint>>();
        map.put("infoList",customers);
        ExcelView ve = new ExcelView();
        return new ModelAndView(ve,map);
    }

    @RequestMapping(value = "/delete")
    public ModelAndView delete(ModelAndView mav,HttpServletRequest request){
        String  s= request.getParameter("deleteId");
        try {
            int i = Integer.parseInt(s);
            complaintSql.delete(i);
        }catch (Exception e){
            e.printStackTrace();
        }

        mav.setViewName("redirect:/table/table");
        return mav;
    }

    @RequestMapping(value = "record")
    public ModelAndView record(ModelAndView mav){
        mav.setViewName("tableRecord");
        return mav;
    }

    @RequestMapping(value = "/add")
    public ModelAndView add(ModelAndView mav, Complaint request){
        Complaint record = request;

        SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日");
        Date date = new Date(System.currentTimeMillis());
        String time = format.format(date);
        record.setDate(time);

        int id = complaintSql.insert(record);
        mav.setViewName("record");
        return mav;
    }

    @RequestMapping(value = "/batchimport", method = RequestMethod.POST)
    public ModelAndView batchimport(@RequestParam(value="filename") MultipartFile file,ModelAndView mav,
                              HttpServletRequest request,HttpServletResponse response) throws IOException {
        //判断文件是否为空
        if(file==null) return null;
        //获取文件名
        String name=file.getOriginalFilename();
        //进一步判断文件是否为空（即判断其大小是否为0或其名称是否为null）
        long size=file.getSize();
        if(name==null || ("").equals(name) && size==0) return null;

        //批量导入。参数：文件名，文件。
        boolean b = complaintSql.batchImport(name,file);
        if(b){
            String Msg ="批量导入EXCEL成功！";
            request.getSession().setAttribute("msg",Msg);
        }else{
            String Msg ="批量导入EXCEL失败！";
            request.getSession().setAttribute("msg",Msg);
        }
        mav.setViewName("redirect:/table/table");
        return mav;
    }

    @ResponseBody
    @RequestMapping(value = "/mapjson", method = {RequestMethod.GET}, produces = "text/plain;charset=UTF-8")
    public String mapjson( ){

        List<Complaint> complaints = complaintSql.selectAllComplaintList();

        String mapjson = JSON.toJSONString(complaints);

        System.out.println(mapjson);
        return mapjson;
    }

    @RequestMapping(value = "/map")
    public ModelAndView map(ModelAndView mav){
        List<Complaint> complaints = complaintSql.selectAllComplaintList();
        mav.addObject("complaints", complaints);
        mav.setViewName("map");
        return mav;
    }
}

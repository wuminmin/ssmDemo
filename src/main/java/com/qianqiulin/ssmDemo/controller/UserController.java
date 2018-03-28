package com.qianqiulin.ssmDemo.controller;

import com.qianqiulin.ssmDemo.pojo.Complaint;
import com.qianqiulin.ssmDemo.pojo.User;
import com.qianqiulin.ssmDemo.sqlService.UserSql;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Array;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequiresRoles("admins")
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserSql userSql;

    @RequestMapping(value = "/table")
    public ModelAndView table(ModelAndView mav, HttpSession httpSession){
        String userName = (String) httpSession.getAttribute("userName");
        Integer userID = Integer.parseInt(String.valueOf(httpSession.getAttribute("userID")  != null ? httpSession.getAttribute("userID") : "0").trim());
        String userRole = (String) httpSession.getAttribute("userRole");
        List<User> users = userSql.selectAllUserList();
        if (userRole.equals("2")) {
            mav.addObject("users", users);
            mav.setViewName("user");
            return mav;
        }else if(userRole.equals("1")){
            List<User> newusers = new ArrayList<User>();
            User newUser = userSql.selectByPrimaryUsername(userName);
            newusers.add(newUser);
            mav.addObject("user", newUser);
            mav.setViewName("userNormal");
            return mav;
        }else{
            mav.setViewName("redirect:/table/table");
            return mav;
        }
    }

    @RequestMapping(value = "/delete")
    public ModelAndView delete(ModelAndView mav,HttpServletRequest request){
        String  s= request.getParameter("deleteId");
        try {
            int i = Integer.parseInt(s);
            userSql.delete(i);
        }catch (Exception e){
            e.printStackTrace();
        }
        mav.setViewName("redirect:/user/table");
        return mav;
    }

    @RequestMapping(value = "/add")
    public ModelAndView add(ModelAndView mav, User request){
        User record = request;
        record.setUsertype("1");
//        SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日");
//        Date date = new Date(System.currentTimeMillis());
//        String time = format.format(date);
//        record.setDate(time);

        userSql.insert(record);
        mav.setViewName("redirect:/user/table");
        return mav;
    }

    @RequestMapping(value = "/update")
    public ModelAndView update(ModelAndView mav, User request, HttpSession httpSession){
        String userName = (String) httpSession.getAttribute("userName");
//        String userID = (String) httpSession.getAttribute("userID");
        Integer userID = Integer.parseInt(String.valueOf(httpSession.getAttribute("userID")  != null ? httpSession.getAttribute("userID") : "0").trim());

        User record = request;
        record.setUserid( userID);
        record.setUsername(userName);
//        record.setUsertype("1");
//        SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日");
//        Date date = new Date(System.currentTimeMillis());
//        String time = format.format(date);
//        record.setDate(time);

        userSql.update(record);
        mav.setViewName("redirect:/user/table");
        return mav;
    }
}

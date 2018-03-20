package com.qianqiulin.ssmDemo.controller;

import com.qianqiulin.ssmDemo.pojo.Complaint;
import com.qianqiulin.ssmDemo.sqlService.ComplaintSql;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Logger;

@Controller
@RequestMapping(value = "/")
public class LoginController {
    @Autowired
    private ComplaintSql complaintSql;
    private static Logger logger = Logger.getLogger(String.valueOf(LoginController.class));

    @RequestMapping(value = "loginCheck",method = RequestMethod.POST)
    public ModelAndView login(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession){
        ModelAndView mav = new ModelAndView();
        String userTel = request.getParameter("userTel");
        String userPwd = request.getParameter("userPwd");
        String verifyCode = request.getParameter("VerifyCode").toLowerCase();
        String verCode = (String) httpSession.getAttribute("verCode");
        System.out.println(verCode);
        logger.info("loginInfo:\nuserTel=" + userTel);
        //shiro登录授权
        UsernamePasswordToken shirotoken = new UsernamePasswordToken(userTel, userPwd);
//        shirotoken.setRememberMe(true);

        //取消验证码
        verCode = verifyCode;
        if (verCode.equals(verifyCode)) {
            Subject subject = SecurityUtils.getSubject();
            try {
                subject.login(shirotoken);
                logger.info("loginSuccess!!!");
                //登录成功后跳转
                String userRole = (String) httpSession.getAttribute("userRole");
                if (userRole.equals("1")) {

                    mav.setViewName("redirect:/table/table");
                } else if (userRole.equals("0")) {

                    mav.setViewName("redirect:/client/index");
                } else {
                    mav.addObject("errorInfo", "你的信息有误");
                    logger.info("loginError");
                    mav.setViewName("/login");
                }
            } catch (Exception e) {
                e.printStackTrace();
                mav.addObject("errorInfo", "错误信息");
                logger.info(e.toString());
                logger.info("loginError");
                mav.setViewName("/login");
            }
        }else{
            mav.addObject("errorInfo", "验证码不正确");
            mav.setViewName("/login");
        }
        return mav;
    }

    @RequestMapping(value = "record")
    public ModelAndView record(ModelAndView mav){
        mav.setViewName("record");
        return mav;
    }

    @RequestMapping(value = "/loginOut")
    public ModelAndView loginOut(ModelAndView mav){
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        mav.setViewName("login");
        return mav;
    }

    @RequestMapping(value = "/login")
    public ModelAndView login(ModelAndView mav){
        mav.setViewName("login");
        return mav;
    }

    @RequestMapping(value = "/wyj")
    public ModelAndView wyj(ModelAndView mav){
        mav.setViewName("wyj/wyj");
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

}

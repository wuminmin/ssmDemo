package com.qianqiulin.ssmDemo.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.logging.Logger;

@Controller
@RequestMapping(value = "/")
public class LoginController {

    private static Logger logger = Logger.getLogger(String.valueOf(LoginController.class));

    @RequestMapping(value = "loginCheck")
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

                    mav.setViewName("redirect:/table");
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
}

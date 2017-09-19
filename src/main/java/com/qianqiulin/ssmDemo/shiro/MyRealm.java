package com.qianqiulin.ssmDemo.shiro;

import com.qianqiulin.ssmDemo.pojo.User;
import com.qianqiulin.ssmDemo.sqlService.UserSql;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by TyurinTsien
 * Date：11/05/2017
 * Tel：18081002339
 */
public class MyRealm extends AuthorizingRealm {


    /**
     * 授权，赋予角色
     *
     * @param principalCollection
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {

        System.out.println("AuthorizationInfo");
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
//        String userInfoRole = userInfoService.selectByUserTel(principalCollection.toString()).getUserrole();
//        userInfoRole = (userInfoRole.equals("1")) ? "admins" : "users";
//        System.out.println(userInfoRole);
//        authorizationInfo.addRole(userInfoRole);
        return authorizationInfo;
    }

    /**
     * 登录验证
     *
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken)
            throws AuthenticationException {

        try {
            UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
            // 通过表单接收的用户名
            String staffCode = token.getUsername();
            String staffPwd = String.valueOf(token.getPassword());
            System.out.println("获取认证信息中:" + staffCode);
//            // 用户登录校验
//            Boolean loginCheck = userInfoService.loginCheck(staffCode, staffPwd);
//            if (loginCheck == true) {
//                UserInfo userInfo = userInfoService.selectByStaffCode(staffCode.toString());
//                setSession("staffCode", staffCode);
//                setSession("userID", userInfo.getSystemid());
//                return new SimpleAuthenticationInfo(staffCode, staffPwd, getName());
//            }
            UserSql userSql;

            return new SimpleAuthenticationInfo(staffCode, staffPwd, getName());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    /**
     * 将一些数据放到ShiroSession中,以便于其它地方使用
     * 比如Controller,使用时直接用HttpSession.getAttribute(key)就可以取到
     *
     * @param key
     * @param value
     */
    private void setSession(Object key, Object value) {
        Subject currentUser = SecurityUtils.getSubject();
        if (null != currentUser) {
            Session session = currentUser.getSession();
//            session.setTimeout(3000);
            System.out.println("Session默认超时时间为[" + session.getTimeout() + "]毫秒");
            if (null != session) {
                session.setAttribute(key, value);
            }
        }
    }
}

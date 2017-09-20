package com.qianqiulin.ssmDemo.sqlService;

import com.qianqiulin.ssmDemo.pojo.User;

import java.util.List;

public interface UserSql {
    User selectByPrimaryUsername(String username);
    Boolean loginCheck(String staffCode,String staffPwd);
    List<User> selectAllUserList();
    void delete(int id);
    void insert(User record);
}

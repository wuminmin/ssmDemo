package com.qianqiulin.ssmDemo.sqlService;

import com.qianqiulin.ssmDemo.pojo.User;

public interface UserSql {
    User selectByPrimaryUsername(String username);
}
package com.qianqiulin.ssmDemo.sqlService.impl;

import com.qianqiulin.ssmDemo.mapper.UserMapper;
import com.qianqiulin.ssmDemo.pojo.User;
import com.qianqiulin.ssmDemo.sqlService.UserSql;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
@Service
public class UserSqlImpl implements UserSql {

    @Resource
    private UserMapper userMapper;

    @Override
    public User selectByPrimaryUsername(String username) {
        User user = userMapper.selectByPrimaryUsername(username);
        return user;
    }
}

package com.qianqiulin.ssmDemo.mapper;

import com.qianqiulin.ssmDemo.pojo.Lemon_user;

public interface Lemon_userMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Lemon_user record);

    int insertSelective(Lemon_user record);

    Lemon_user selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Lemon_user record);

    int updateByPrimaryKey(Lemon_user record);
}
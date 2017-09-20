package com.qianqiulin.ssmDemo.mapper;

import com.qianqiulin.ssmDemo.pojo.User;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User selectByPrimaryUsername(String username);

    List<User> selectAllUserList();

}
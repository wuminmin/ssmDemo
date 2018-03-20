package com.qianqiulin.ssmDemo.mapper;

import com.qianqiulin.ssmDemo.pojo.Action;

public interface ActionMapper {
    int deleteByPrimaryKey(Integer actionid);

    int insert(Action record);

    int insertSelective(Action record);

    Action selectByPrimaryKey(Integer actionid);

    int updateByPrimaryKeySelective(Action record);

    int updateByPrimaryKey(Action record);
}
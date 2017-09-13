package com.qianqiulin.ssmDemo.mapper;

import com.qianqiulin.ssmDemo.pojo.Complaint;

import java.util.List;

public interface ComplaintMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Complaint record);

    int insertSelective(Complaint record);

    Complaint selectByPrimaryKey(Integer id);

    List<Complaint> selectByPrimaryKeyAll();

    int updateByPrimaryKeySelective(Complaint record);

    int updateByPrimaryKey(Complaint record);
}
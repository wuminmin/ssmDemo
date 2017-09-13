package com.qianqiulin.ssmDemo.sqlService.impl;

import com.qianqiulin.ssmDemo.sqlService.ComplaintSql;
import com.qianqiulin.ssmDemo.mapper.ComplaintMapper;
import com.qianqiulin.ssmDemo.pojo.Complaint;
import org.springframework.stereotype.Service;


import javax.annotation.Resource;
import java.util.List;

@Service
public class ComplaintSqlImpl implements ComplaintSql{

    @Resource
    private ComplaintMapper complaintMapper;

    @Override
    public List<Complaint> selectAllComplaintList() {
        List<Complaint> complaints = complaintMapper.selectByPrimaryKeyAll();
        return complaints;
    }
}

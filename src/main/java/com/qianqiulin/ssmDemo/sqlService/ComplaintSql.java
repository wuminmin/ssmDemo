package com.qianqiulin.ssmDemo.sqlService;

import com.qianqiulin.ssmDemo.pojo.Complaint;

import java.util.List;

public interface ComplaintSql {
    List<Complaint> selectAllComplaintList();
    int insert(Complaint complaint);
    void delete(int id);
}

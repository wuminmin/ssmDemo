package com.qianqiulin.ssmDemo.sqlService;

import com.qianqiulin.ssmDemo.pojo.Complaint;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ComplaintSql {
    List<Complaint> selectAllComplaintList();
    int insert(Complaint complaint);
    void delete(int id);

    boolean batchImport(String name, MultipartFile file);
}

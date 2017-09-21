package com.qianqiulin.ssmDemo.sqlService.impl;

import com.qianqiulin.ssmDemo.pojo.User;
import com.qianqiulin.ssmDemo.sqlService.ComplaintSql;
import com.qianqiulin.ssmDemo.mapper.ComplaintMapper;
import com.qianqiulin.ssmDemo.pojo.Complaint;
import com.qianqiulin.ssmDemo.utils.POIUtil;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ComplaintSqlImpl implements ComplaintSql{

    @Resource
    private ComplaintMapper complaintMapper;

    @Override
    public List<Complaint> selectAllComplaintList() {
        List<Complaint> complaints = complaintMapper.selectByPrimaryKeyAll();
        return complaints;
    }

    @Override
    public int insert(Complaint complaint) {
        int flag = complaintMapper.insert(complaint);
        return flag;
    }

    @Override
    public void delete(int id) {
        try {
            complaintMapper.deleteByPrimaryKey(id);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public boolean batchImport(String name, MultipartFile file) {
        boolean b = false;

        Map<String, Object> param = new HashMap<String, Object>();
        List<Complaint> complaints = new ArrayList<Complaint>();
        try {
            List<String[]> list = POIUtil.readExcel(file);
            for(int i = 0;i<list.size();i++){
                String[] str = list.get(i);
                Complaint complaint = new Complaint();
                complaint.setId(Integer.valueOf(str[0]));
                complaint.setYingyebu(str[1]);
                complaint.setDidian(str[2]);
                complaint.setJingdu(str[3]);
                complaint.setWeidu(str[4]);
                complaint.setFugaiyonghushu(str[5]);
                complaint.setGudingdianhuashu(str[6]);
                complaint.setTietaqingkuang(str[7]);
                complaint.setJiejuefangan(str[8]);
                complaint.setDate(str[9]);
                complaint.setChulijieguo(str[10]);
                complaints.add(complaint);
            }
        } catch (IOException e) {
//            logger.info("读取excel文件失败", e);
        }
//        param.put("allUsers", complaints);

        //迭代添加客户信息（注：实际上这里也可以直接将customerList集合作为参数，在Mybatis的相应映射文件中使用foreach标签进行批量添加。）
        for(Complaint complaint:complaints){
            complaintMapper.insert(complaint);
        }
        return b;
    }
}

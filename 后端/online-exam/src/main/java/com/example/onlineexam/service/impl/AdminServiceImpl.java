package com.example.onlineexam.service.impl;


import com.example.onlineexam.mapper.AdminMapper;
import com.example.onlineexam.pojo.Admin;
import com.example.onlineexam.service.AdminService;
import com.example.onlineexam.util.MD5EncodingUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;



    @Override
    public int updatePwd(Admin admin) {
        admin.setPwd(MD5EncodingUtil.getMD5(admin.getPwd()));
        return adminMapper.updatePwd(admin);
    }
}

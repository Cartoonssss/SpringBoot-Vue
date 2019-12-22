package com.example.onlineexam.service.impl;

import com.example.onlineexam.mapper.LoginMapper;
import com.example.onlineexam.pojo.*;
import com.example.onlineexam.service.LoginService;
import com.example.onlineexam.util.ApiResult;
import com.example.onlineexam.util.ApiResultHandler;
import com.example.onlineexam.util.MD5EncodingUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {
    @Autowired
    private LoginMapper loginMapper;


    @Override
    public Admin adminLogin(Integer username, String password) {
        password= MD5EncodingUtil.getMD5(password);
        return loginMapper.adminLogin(username,password);
    }

    @Override
    public Teacher teacherLogin(Integer username, String password) {
        password= MD5EncodingUtil.getMD5(password);
        return loginMapper.teacherLogin(username,password);
    }

    @Override
    public Student studentLogin(Integer username, String password) {
        password= MD5EncodingUtil.getMD5(password);
        return loginMapper.studentLogin(username,password);
    }
}

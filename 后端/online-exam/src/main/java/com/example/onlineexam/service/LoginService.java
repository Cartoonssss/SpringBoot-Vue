package com.example.onlineexam.service;

import com.example.onlineexam.pojo.Admin;
import com.example.onlineexam.pojo.Student;
import com.example.onlineexam.pojo.Teacher;
import com.example.onlineexam.util.ApiResult;
import com.example.onlineexam.pojo.Login;

public interface LoginService {
    /*ApiResult login(Login login);*/

    public Admin adminLogin(Integer username, String password);

    public Teacher teacherLogin(Integer username, String password);

    public Student studentLogin(Integer username, String password);
}

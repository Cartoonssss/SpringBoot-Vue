package com.example.onlineexam.controller;

import com.example.onlineexam.pojo.Admin;
import com.example.onlineexam.pojo.Student;
import com.example.onlineexam.pojo.Teacher;
import com.example.onlineexam.util.ApiResult;
import com.example.onlineexam.pojo.Login;
import com.example.onlineexam.service.LoginService;
import com.example.onlineexam.util.ApiResultHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;

@RestController
public class LoginController {
    @Autowired
    private LoginService loginService;


    @PostMapping("login")
    public ApiResult login(@RequestBody Login login, HttpServletRequest request){

        Integer username = login.getUsername();
        String password = login.getPassword();
        Admin adminRes = loginService.adminLogin(username, password);
        if (adminRes != null) {
            request.getSession().setAttribute("admin","admin");
            return ApiResultHandler.buildApiResult(200, "请求成功", adminRes);
        }

        Teacher teacherRes = loginService.teacherLogin(username,password);
        if (teacherRes != null) {
            request.getSession().setAttribute("teacher","teacher");
            return ApiResultHandler.buildApiResult(200, "请求成功", teacherRes);
        }

        Student studentRes = loginService.studentLogin(username,password);
        if (studentRes != null) {
            request.getSession().setAttribute("student","student");
            return ApiResultHandler.buildApiResult(200, "请求成功", studentRes);
        }

        return ApiResultHandler.buildApiResult(400, "请求失败", null);
    }

}

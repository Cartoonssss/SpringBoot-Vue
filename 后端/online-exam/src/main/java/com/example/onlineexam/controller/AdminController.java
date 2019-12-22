package com.example.onlineexam.controller;


import com.example.onlineexam.pojo.Admin;
import com.example.onlineexam.service.impl.AdminServiceImpl;
import com.example.onlineexam.util.ApiResult;
import com.example.onlineexam.util.ApiResultHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AdminController {

    @Autowired
    private AdminServiceImpl adminService;

    @PutMapping("/adminPWD")
    public ApiResult updatePwd(@RequestBody Admin admin) {
        System.out.println("admin...");
        adminService.updatePwd(admin);
        return ApiResultHandler.buildApiResult(200,"密码更新成功",null);
    }
}

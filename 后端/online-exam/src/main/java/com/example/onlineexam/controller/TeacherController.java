package com.example.onlineexam.controller;

import com.example.onlineexam.util.ApiResult;
import com.example.onlineexam.pojo.Teacher;
import com.example.onlineexam.service.TeacherService;
import com.example.onlineexam.util.ApiResultHandler;
import com.example.onlineexam.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@RestController
public class TeacherController {
    @Autowired
    private TeacherService teacherService;
    @GetMapping("/teachers/{page}/{size}")
    public ApiResult teachers(@PathVariable("page") Integer page,@PathVariable("size") Integer size){
        PageBean<Teacher> teacherPageInfo = teacherService.selectTeacherByPage(page, size);
        return ApiResultHandler.buildApiResult(200, "查询教师", teacherPageInfo);
    }
    @PostMapping("/teacher")
    public ApiResult addTeacher(@RequestBody Teacher teacher){
        Integer integer = teacherService.addTeacher(teacher);
        if(integer==1){
            return ApiResultHandler.buildApiResult(200, "增加成功", integer);
        }
        else {
            return ApiResultHandler.buildApiResult(400, "增加失败", integer);
        }
    }
    @GetMapping("/teacher/{id}")
    public ApiResult teacher(@PathVariable("id") Integer id){
        Teacher teacher = teacherService.selectTeacherById(id);
        return ApiResultHandler.buildApiResult(200, "查询教师", teacher);
    }
    @PutMapping("/teacher")
    public ApiResult updateTeacher(@RequestBody Teacher teacher){
        Integer integer = teacherService.updateTeacher(teacher);
        if (integer==1){
            return ApiResultHandler.buildApiResult(200, "更新成功", integer);
        }
        else {
            return ApiResultHandler.buildApiResult(400, "更新失败", integer);
        }
    }
    @DeleteMapping("/teacher/{id}")
    public ApiResult deleteTeacher(@PathVariable("id") Integer id){
        Integer integer = teacherService.deleteTeacher(id);
        if(integer==1){
            return ApiResultHandler.buildApiResult(200, "删除成功", integer);
        }
        else {
            return ApiResultHandler.buildApiResult(400, "删除失败", integer);
        }
    }

    @PostMapping("/admin_teacherExit")
    public ApiResult exit(HttpServletRequest request) {
        System.out.println("执行了。。。。。");
        String admin = (String) request.getSession().getAttribute("admin");
        String teacher = (String) request.getSession().getAttribute("teacher");
        if(admin!=null) {
            request.getSession().removeAttribute("admin");
        }
        if(teacher!=null) {
            request.getSession().removeAttribute("teacher");
        }
        return ApiResultHandler.buildApiResult(200,"退出成功",null);
    }

    /**
     * 修改密码
     * @param teacher
     * @return
     */
    @PutMapping("/teacherPWD")
    public ApiResult updatePwd(@RequestBody Teacher teacher) {
        System.out.println("teacher...");
        teacherService.updatePwdTeacher(teacher);
        return ApiResultHandler.buildApiResult(200,"密码更新成功",null);
    }
}

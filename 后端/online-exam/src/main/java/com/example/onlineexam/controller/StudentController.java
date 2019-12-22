package com.example.onlineexam.controller;

import com.example.onlineexam.util.ApiResult;
import com.example.onlineexam.pojo.Student;
import com.example.onlineexam.service.StudentService;
import com.example.onlineexam.util.ApiResultHandler;
import com.example.onlineexam.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@RestController
public class StudentController {
    @Autowired
    private StudentService studentService;
    @GetMapping("/students/{page}/{size}")
    public ApiResult students(@PathVariable("page") Integer page,@PathVariable("size") Integer size){
        PageBean<Student> studentPageInfo = studentService.selectStudentByPage(page, size);
        return ApiResultHandler.buildApiResult(200, "所有学生", studentPageInfo);
    }
    @GetMapping("/student/{id}")
    public ApiResult student(@PathVariable Integer id){
        Student student = studentService.selectStudentById(id);
        return ApiResultHandler.buildApiResult(200, "查找学生", student);
    }
    @PutMapping("/student")
    public ApiResult updaetStudent(@RequestBody Student student){
        Integer integer = studentService.updateStudent(student);
        if(integer==1){
            return ApiResultHandler.buildApiResult(200, "更新成功", integer);
        }
        else {
            return ApiResultHandler.buildApiResult(400, "更新失败", integer);
        }
    }
    @PostMapping("/student")
    public ApiResult addStudent(@RequestBody Student student){
        Integer integer = studentService.addStudent(student);
        if(integer==1){
            return ApiResultHandler.buildApiResult(200, "添加成功", integer);
        }
        else {
            return ApiResultHandler.buildApiResult(400, "添加失败", integer);
        }
    }
    @DeleteMapping("/student/{id}")
    public ApiResult deleteStudent(@PathVariable("id") Integer id){
        Integer integer = studentService.deleteStudent(id);
        if(integer==1){
            return ApiResultHandler.buildApiResult(200, "删除成功", integer);
        }
        else {
            return ApiResultHandler.buildApiResult(400, "删除失败", integer);
        }
    }
    @PutMapping("studentPWD")
    public ApiResult updateStudentPwd(@RequestBody Student student){
        System.out.println("student....");
        Integer integer = studentService.updateStudentPwd(student);
        if(integer==1){
            return ApiResultHandler.buildApiResult(200, "修改密码成功", integer);
        }
        else {
            return ApiResultHandler.buildApiResult(400, "修改密码失败", integer);
        }
    }
    @PostMapping("/studentExit")
    public ApiResult exit(HttpServletRequest request) {
        request.getSession().removeAttribute("student");
        return ApiResultHandler.buildApiResult(200,"退出成功",null);
    }

}

package com.example.onlineexam.controller;

import com.example.onlineexam.util.ApiResult;
import com.example.onlineexam.pojo.ExamManage;
import com.example.onlineexam.service.ExamManageService;
import com.example.onlineexam.util.ApiResultHandler;
import com.example.onlineexam.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class ExamManageController {
    @Autowired
    private ExamManageService examManageService;
    @GetMapping("/exams/{page}/{size}")
    public ApiResult exams(@PathVariable("page") Integer page, @PathVariable("size") Integer size){
        PageBean<ExamManage> all = examManageService.selectExamManageByPage(page, size);
        return ApiResultHandler.buildApiResult(200, "成功", all);
    }
    @GetMapping("/partexams/{page}/{size}")
    public ApiResult partexams(@PathVariable("page") Integer page, @PathVariable("size") Integer size){
        PageBean<ExamManage> all = examManageService.selectPartExamManageByPage(page, size);
        return ApiResultHandler.buildApiResult(200, "成功", all);
    }
    @GetMapping("/examManagePaperId")
    public ApiResult examManagePaperId() {
        Integer integer = examManageService.examManagePaperId();
        return ApiResultHandler.buildApiResult(200, "成功", integer);
    }
    @PostMapping("/exam")
    public ApiResult exam(@RequestBody ExamManage examManage){
        Integer res = examManageService.addExam(examManage);
        if(res==1) {
            return ApiResultHandler.buildApiResult(200, "增加成功", res);
        }
        else {
            return ApiResultHandler.buildApiResult(400, "增加失败", res);
        }
    }
    @GetMapping("/exam/{id}")
    public ApiResult getexam(@PathVariable("id") Integer id){
        ExamManage examManage = examManageService.selectExamManageById(id);
        return ApiResultHandler.buildApiResult(200, "查询试卷", examManage);
    }
    @PutMapping("/exam")
    public ApiResult updateExam(@RequestBody ExamManage examManage){
        Integer integer = examManageService.updateExam(examManage);
        if(integer==1){
            return ApiResultHandler.buildApiResult(200, "更新成功", integer);
        }
        else {
            return ApiResultHandler.buildApiResult(400, "更新失败", integer);
        }
    }
    @DeleteMapping("/exam/{id}")
    public ApiResult deleteExam(@PathVariable("id") Integer id){
        Integer integer = examManageService.deleteExam(id);
        if(integer==1){
            return ApiResultHandler.buildApiResult(200, "删除成功", integer);
        }
        else {
            return ApiResultHandler.buildApiResult(400, "删除失败", integer);
        }
    }
    @GetMapping("exams")
    public ApiResult findExamByKey(){
        List<ExamManage> examManages = examManageService.selectAll();
        return ApiResultHandler.buildApiResult(200, "查询所有", examManages);
    }
    @GetMapping("partexams")
    public ApiResult findPartExamByKey(){
        List<ExamManage> examManages = examManageService.selectPartExamManage();
        return ApiResultHandler.buildApiResult(200, "查询所有", examManages);
    }
}
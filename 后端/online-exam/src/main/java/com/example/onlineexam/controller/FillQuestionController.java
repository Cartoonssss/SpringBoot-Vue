package com.example.onlineexam.controller;

import com.example.onlineexam.util.ApiResult;
import com.example.onlineexam.pojo.FillQuestion;
import com.example.onlineexam.service.FillQuestionService;
import com.example.onlineexam.util.ApiResultHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FillQuestionController {
    @Autowired
    private FillQuestionService fillQuestionService;
    @PostMapping("fillQuestion")
    public ApiResult fillQuestion(@RequestBody FillQuestion fillQuestion){
        int i = fillQuestionService.addFillQuestion(fillQuestion);
        if(i==1){
            return ApiResultHandler.buildApiResult(200, "添加成功",i);
        }
        return ApiResultHandler.buildApiResult(400, "添加失败", i);
    }
    @GetMapping("fillQuestionId")
    public ApiResult fillQuestionId(){
        FillQuestion fillQuestion = fillQuestionService.fillQuestionId();
        return ApiResultHandler.buildApiResult(200, "查询填空题ID", fillQuestion);
    }
}

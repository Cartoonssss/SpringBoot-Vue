package com.example.onlineexam.controller;

import com.example.onlineexam.util.ApiResult;
import com.example.onlineexam.pojo.MultiQuestion;
import com.example.onlineexam.service.MultiQuestionService;
import com.example.onlineexam.util.ApiResultHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MultiQuestionController {
    @Autowired
    private MultiQuestionService multiQuestionService;
    @PostMapping("MultiQuestion")
    public ApiResult MultiQuestion(@RequestBody MultiQuestion multiQuestion){
        int i = multiQuestionService.addMultiQuestion(multiQuestion);
        if (i==1){
            return ApiResultHandler.buildApiResult(200, "添加成功", i);
        }
        return ApiResultHandler.buildApiResult(400, "添加失败", i);
    }
    @GetMapping("multiQuestionId")
    public ApiResult multiQuestionId(){
        MultiQuestion multiQuestion = multiQuestionService.multiQuestionId();
        return ApiResultHandler.buildApiResult(200, "查询选择题Id", multiQuestion);
    }
}

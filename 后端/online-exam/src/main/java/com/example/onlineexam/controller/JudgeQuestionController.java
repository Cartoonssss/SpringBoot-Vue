package com.example.onlineexam.controller;

import com.example.onlineexam.util.ApiResult;
import com.example.onlineexam.pojo.JudgeQuestion;
import com.example.onlineexam.service.JudgeQuestionService;
import com.example.onlineexam.util.ApiResultHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class JudgeQuestionController {
    @Autowired
    private JudgeQuestionService judgeQuestionService;
    @PostMapping("judgeQuestion")
    public ApiResult judgeQuestion(@RequestBody JudgeQuestion judgeQuestion){
        int i = judgeQuestionService.addJudgeQuestion(judgeQuestion);
        if(i==1){
            return ApiResultHandler.buildApiResult(200, "添加成功", i);
        }
        return ApiResultHandler.buildApiResult(400, "添加失败", i);
    }
    @GetMapping("judgeQuestionId")
    public ApiResult judgeQuestionId(){
        JudgeQuestion judgeQuestion = judgeQuestionService.judgeQuestionId();
        return ApiResultHandler.buildApiResult(200, "查询判断题ID", judgeQuestion);
    }
}

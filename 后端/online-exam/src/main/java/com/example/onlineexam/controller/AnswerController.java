package com.example.onlineexam.controller;

import com.example.onlineexam.pojo.Answer;
import com.example.onlineexam.pojo.FillQuestion;
import com.example.onlineexam.pojo.JudgeQuestion;
import com.example.onlineexam.pojo.MultiQuestion;
import com.example.onlineexam.service.FillQuestionService;
import com.example.onlineexam.service.JudgeQuestionService;
import com.example.onlineexam.service.MultiQuestionService;
import com.example.onlineexam.util.ApiResult;
import com.example.onlineexam.service.AnswerService;
import com.example.onlineexam.util.ApiResultHandler;
import com.example.onlineexam.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class AnswerController {
    @Autowired
    private AnswerService answerService;
    @Autowired
    private MultiQuestionService multiQuestionService;
    @Autowired
    private FillQuestionService fillQuestionService;
    @Autowired
    private JudgeQuestionService judgeQuestionService;
    @GetMapping("/answers/{page}/{size}")
    public ApiResult answers(@PathVariable("page") Integer page,@PathVariable("size") Integer size){
        PageBean<Answer> answerPageInfo = answerService.selectAnswerByPage(page, size);
        return ApiResultHandler.buildApiResult(200, "所有数据", answerPageInfo);
    }
    @GetMapping("question/{questionId}/{type}")
    public ApiResult selectQuestion(@PathVariable("questionId") Integer questionId,@PathVariable("type") String type){
        return answerService.selectQuestion(questionId,type);
    }
    @PutMapping("questionMulti")
    public ApiResult updateQuestionMulti(@RequestBody MultiQuestion multiQuestion){
        int i = multiQuestionService.updateQuestion(multiQuestion);
        if(i==1){
            return ApiResultHandler.buildApiResult(200, "更新选择题成功", i);
        }
        else {
            return ApiResultHandler.buildApiResult(400, "更新选择题成功", i);
        }
    }
    @PutMapping("questionFill")
    public ApiResult updateQuestionFill(@RequestBody FillQuestion fillQuestion){
        int i = fillQuestionService.updateQuestion(fillQuestion);
        if(i==1){
            return ApiResultHandler.buildApiResult(200, "更新填空题成功", i);
        }
        else {
            return ApiResultHandler.buildApiResult(400, "更新填空题成功", i);
        }
    }
    @PutMapping("questionJudge")
    public ApiResult updateQuestionJudge(@RequestBody JudgeQuestion judgeQuestion){
        int i = judgeQuestionService.updateQuestion(judgeQuestion);
        if(i==1){
            return ApiResultHandler.buildApiResult(200, "更新判断题成功", i);
        }
        else {
            return ApiResultHandler.buildApiResult(400, "更新判断题成功", i);
        }
    }
    @DeleteMapping("question/{questionId}/{type}")
    public ApiResult deleteQuestion(@PathVariable("questionId") Integer questionId,@PathVariable("type") String type) {
         return answerService.deleteQuestion(questionId, type);
    }
}

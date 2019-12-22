package com.example.onlineexam.controller;

import com.example.onlineexam.pojo.*;
import com.example.onlineexam.service.FillQuestionService;
import com.example.onlineexam.service.JudgeQuestionService;
import com.example.onlineexam.service.MultiQuestionService;
import com.example.onlineexam.service.PaperManageService;
import com.example.onlineexam.util.ApiResult;
import com.example.onlineexam.util.ApiResultHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class PaperManageController {
    @Autowired
    private PaperManageService paperManageService;
    @Autowired
    private MultiQuestionService multiQuestionService;
    @Autowired
    private FillQuestionService fillQuestionService;
    @Autowired
    private JudgeQuestionService judgeQuestionService;
    @PostMapping("paperManage")
    public ApiResult paperManage(@RequestBody PaperManage paperManage){
        int i = paperManageService.addPaper(paperManage);
        if(i==1){
            return ApiResultHandler.buildApiResult(200, "添加成功", i);
        }
        return ApiResultHandler.buildApiResult(400, "添加失败", i);
    }
    @GetMapping("paper/{paperId}")
    public Map<Integer,List> paper(@PathVariable("paperId") int paperId){
        List<MultiQuestion> multiQuestions = multiQuestionService.getmultiQuestionByPaperId(paperId);
        List<FillQuestion> fillQuestions = fillQuestionService.getFillQuestionByPaperId(paperId);
        List<JudgeQuestion> judgeQuestions = judgeQuestionService.getJudgeQuestionByPaperId(paperId);
        Map<Integer, List> map = new HashMap<>();
        map.put(1, multiQuestions);
        map.put(2, fillQuestions);
        map.put(3, judgeQuestions);
        return map;
    }
}

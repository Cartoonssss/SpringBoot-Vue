package com.example.onlineexam.service.impl;

import com.example.onlineexam.mapper.AnswerMapper;
import com.example.onlineexam.mapper.FillQuestionMapper;
import com.example.onlineexam.mapper.JudgeQuestionMapper;
import com.example.onlineexam.mapper.MultiQuestionMapper;
import com.example.onlineexam.pojo.Answer;
import com.example.onlineexam.pojo.FillQuestion;
import com.example.onlineexam.pojo.JudgeQuestion;
import com.example.onlineexam.pojo.MultiQuestion;
import com.example.onlineexam.service.AnswerService;
import com.example.onlineexam.util.ApiResult;
import com.example.onlineexam.util.ApiResultHandler;
import com.example.onlineexam.util.PageBean;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AnswerServiceImpl implements AnswerService {
    @Autowired
    private AnswerMapper answerMapper;
    @Autowired
    private MultiQuestionMapper multiQuestionMapper;
    @Autowired
    private FillQuestionMapper fillQuestionMapper;
    @Autowired
    private JudgeQuestionMapper judgeQuestionMapper;
    @Override
    public PageBean<Answer> selectAnswerByPage(Integer page, Integer size) {
        PageHelper.startPage(page, size);
        List<Answer> answers = answerMapper.selectAllAnswer();
        PageBean<Answer> answerPageInfo = new PageBean<>(answers,size);
        return answerPageInfo;
    }

    @Override
    public ApiResult selectQuestion(Integer questionId, String type) {
        if("选择题".equals(type)){
            MultiQuestion multiQuestion = multiQuestionMapper.selectById(questionId);
            return ApiResultHandler.buildApiResult(200, "查询选择题", multiQuestion);
        }
        if("填空题".equals(type)){
            FillQuestion fillQuestion = fillQuestionMapper.selectById(questionId);
            return ApiResultHandler.buildApiResult(200, "查询填空题", fillQuestion);
        }
        if("判断题".equals(type)){
            JudgeQuestion judgeQuestion = judgeQuestionMapper.selectById(questionId);
            return ApiResultHandler.buildApiResult(200, "查询判断题", judgeQuestion);
        }
        return ApiResultHandler.buildApiResult(400,"未知题型",null);
    }

    @Override
    public ApiResult deleteQuestion(Integer questionId, String type) {
        if ("选择题".equals(type)){
            int i = multiQuestionMapper.deleteById(questionId);
            if (i==1){
                return ApiResultHandler.buildApiResult(200, "删除成功", i);
            }
            else {
                return ApiResultHandler.buildApiResult(400, "删除失败", i);
            }
        }
        if ("填空题".equals(type)){
            int i = fillQuestionMapper.deleteById(questionId);
            if (i==1){
                return ApiResultHandler.buildApiResult(200, "删除成功", i);
            }
            else {
                return ApiResultHandler.buildApiResult(400, "删除失败", i);
            }
        }
        if ("判断题".equals(type)){
            int i = judgeQuestionMapper.deleteById(questionId);
            if (i==1){
                return ApiResultHandler.buildApiResult(200, "删除成功", i);
            }
            else {
                return ApiResultHandler.buildApiResult(400, "删除失败", i);
            }
        }
        return ApiResultHandler.buildApiResult(400,"未知题型",null);
    }
}

package com.example.onlineexam.service;

import com.example.onlineexam.pojo.JudgeQuestion;

import java.util.List;

public interface JudgeQuestionService {
    int addJudgeQuestion(JudgeQuestion judgeQuestion);

    JudgeQuestion judgeQuestionId();

    List<JudgeQuestion> getJudgeQuestionByPaperId(int paperId);

    int updateQuestion(JudgeQuestion judgeQuestion);
}

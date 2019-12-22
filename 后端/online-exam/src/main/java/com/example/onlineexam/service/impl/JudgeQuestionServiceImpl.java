package com.example.onlineexam.service.impl;

import com.example.onlineexam.mapper.JudgeQuestionMapper;
import com.example.onlineexam.pojo.JudgeQuestion;
import com.example.onlineexam.service.JudgeQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class JudgeQuestionServiceImpl implements JudgeQuestionService {
    @Autowired
    private JudgeQuestionMapper judgeQuestionMapper;

    @Override
    @Transactional
    public int addJudgeQuestion(JudgeQuestion judgeQuestion) {
        return judgeQuestionMapper.addJudgeQuestion(judgeQuestion);
    }

    @Override
    public JudgeQuestion judgeQuestionId() {
        return judgeQuestionMapper.judgeQuestionId();
    }

    @Override
    public List<JudgeQuestion> getJudgeQuestionByPaperId(int paperId) {
        return judgeQuestionMapper.getJudgeQuestionByPaperId(paperId);
    }

    @Override
    public int updateQuestion(JudgeQuestion judgeQuestion) {
        return judgeQuestionMapper.updateQuestion(judgeQuestion);
    }
}

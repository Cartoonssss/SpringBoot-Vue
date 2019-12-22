package com.example.onlineexam.service.impl;

import com.example.onlineexam.mapper.FillQuestionMapper;
import com.example.onlineexam.pojo.FillQuestion;
import com.example.onlineexam.service.FillQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class FillQuestionServiceImpl implements FillQuestionService {
    @Autowired
    private FillQuestionMapper fillQuestionMapper;

    @Override
    @Transactional
    public int addFillQuestion(FillQuestion fillQuestion) {
        return fillQuestionMapper.addFillQuestion(fillQuestion);
    }

    @Override
    public FillQuestion fillQuestionId() {
        return fillQuestionMapper.fillQuestionId();
    }

    @Override
    public List<FillQuestion> getFillQuestionByPaperId(int paperId) {
        return fillQuestionMapper.getFillQuestionByPaperId(paperId);
    }

    @Override
    public int updateQuestion(FillQuestion fillQuestion) {
        return fillQuestionMapper.updateQuestion(fillQuestion);
    }
}

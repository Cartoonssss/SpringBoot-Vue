package com.example.onlineexam.service.impl;

import com.example.onlineexam.mapper.MultiQuestionMapper;
import com.example.onlineexam.pojo.MultiQuestion;
import com.example.onlineexam.service.MultiQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class MultiQuestionServiceImpl implements MultiQuestionService {
    @Autowired
    private MultiQuestionMapper multiQuestionMapper;

    @Override
    @Transactional
    public int addMultiQuestion(MultiQuestion multiQuestion) {
        return multiQuestionMapper.addMultiQuestion(multiQuestion);
    }

    @Override
    public MultiQuestion multiQuestionId() {
        return multiQuestionMapper.multiQuestionId();
    }

    @Override
    public List<MultiQuestion> getmultiQuestionByPaperId(int paperId) {
        return multiQuestionMapper.getmultiQuestionByPaperId(paperId);
    }

    @Override
    public MultiQuestion selectById(Integer questionId) {
        return multiQuestionMapper.selectById(questionId);
    }

    @Override
    public int updateQuestion(MultiQuestion multiQuestion) {
        return multiQuestionMapper.updateQuestion(multiQuestion);
    }

    @Override
    public int deleteById(Integer questionId) {
        return multiQuestionMapper.deleteById(questionId);
    }
}

package com.example.onlineexam.service;

import com.example.onlineexam.pojo.MultiQuestion;

import java.util.List;

public interface MultiQuestionService {
    int addMultiQuestion(MultiQuestion multiQuestion);

    MultiQuestion multiQuestionId();

    List<MultiQuestion> getmultiQuestionByPaperId(int paperId);

    MultiQuestion selectById(Integer questionId);

    int updateQuestion(MultiQuestion multiQuestion);

    int deleteById(Integer questionId);
}

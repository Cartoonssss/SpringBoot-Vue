package com.example.onlineexam.service;

import com.example.onlineexam.pojo.FillQuestion;

import java.util.List;

public interface FillQuestionService {
    int addFillQuestion(FillQuestion fillQuestion);

    FillQuestion fillQuestionId();

    List<FillQuestion> getFillQuestionByPaperId(int paperId);

    int updateQuestion(FillQuestion fillQuestion);
}

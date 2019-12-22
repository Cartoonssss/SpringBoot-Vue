package com.example.onlineexam.service;

import com.example.onlineexam.pojo.Answer;
import com.example.onlineexam.util.ApiResult;
import com.example.onlineexam.util.PageBean;

public interface AnswerService {
    PageBean<Answer> selectAnswerByPage(Integer page, Integer size);

    ApiResult selectQuestion(Integer questionId, String type);

    ApiResult deleteQuestion(Integer questionId, String type);
}

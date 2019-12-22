package com.example.onlineexam.mapper;

import com.example.onlineexam.pojo.Answer;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface AnswerMapper {

    @Select("select questionId,question, subject, score, section,level, \"选择题\" as type from multiquestion " +
            "union select  questionId,question, subject, score, section,level, \"判断题\" as type  from judgequestion " +
            "union select  questionId,question, subject, score, section,level, \"填空题\" as type from fillquestion")
    List<Answer> selectAllAnswer();
}

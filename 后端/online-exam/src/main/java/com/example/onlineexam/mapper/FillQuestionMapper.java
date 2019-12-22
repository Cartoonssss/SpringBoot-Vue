package com.example.onlineexam.mapper;

import com.example.onlineexam.pojo.FillQuestion;
import com.example.onlineexam.pojo.MultiQuestion;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface FillQuestionMapper {
    @Insert("insert into " +
            "fillquestion(subject,question,answer,analysis,level,section) " +
            "values (#{subject,},#{question},#{answer},#{analysis},#{level},#{section})")
    int addFillQuestion(FillQuestion fillQuestion);

    @Select("SELECT questionId FROM fillquestion WHERE questionId=(" +
            "SELECT MAX(questionId) FROM fillquestion)")
    FillQuestion fillQuestionId();

    @Select("select * from fillquestion where questionId in " +
            "(select questionId from papermanage " +
            "where questionType = 2 and paperId = #{paperId})")
    List<FillQuestion> getFillQuestionByPaperId(int paperId);

    @Select("select * from fillquestion where questionId=#{questionId}")
    FillQuestion selectById(Integer questionId);

    @Update("update fillquestion " +
            "set subject=#{subject},question=#{question},answer=#{answer},analysis=#{analysis},score=#{score},level=#{level},section=#{section} " +
            "where questionId=#{questionId}")
    int updateQuestion(FillQuestion fillQuestion);

    @Delete("delete from fillquestion where questionId=#{questionId}")
    int deleteById(Integer questionId);
}

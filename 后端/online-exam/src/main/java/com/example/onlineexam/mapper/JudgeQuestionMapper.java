package com.example.onlineexam.mapper;

import com.example.onlineexam.pojo.JudgeQuestion;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface JudgeQuestionMapper {
    @Insert("insert into " +
            "judgequestion(subject,question,answer,analysis,level,section) values " +
            "(#{subject},#{question},#{answer},#{analysis},#{level},#{section})")
    int addJudgeQuestion(JudgeQuestion judgeQuestion);

    @Select("SELECT questionId FROM judgequestion WHERE questionId=(" +
            "SELECT MAX(questionId) FROM judgequestion)")
    JudgeQuestion judgeQuestionId();

    @Select("select * from judgequestion where questionId in " +
            "(select questionId from papermanage " +
            "where questionType = 3 and paperId = #{paperId})")
    List<JudgeQuestion> getJudgeQuestionByPaperId(int paperId);

    @Select("select * from judgequestion where questionId=#{questionId}")
    JudgeQuestion selectById(Integer questionId);

    @Update("update judgequestion " +
            "set subject=#{subject},question=#{question},answer=#{answer},analysis=#{analysis},score=#{score},level=#{level},section=#{section} " +
            "where questionId=#{questionId}")
    int updateQuestion(JudgeQuestion judgeQuestion);

    @Delete("delete from judgequestion where questionId=#{questionId}")
    int deleteById(Integer questionId);
}

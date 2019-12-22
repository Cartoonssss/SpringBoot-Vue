package com.example.onlineexam.mapper;

import com.example.onlineexam.pojo.MultiQuestion;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface MultiQuestionMapper {
    @Insert("insert into " +
            "multiquestion(subject,question,answerA,answerB,answerC,answerD,rightAnswer,analysis,section,level) " +
            "values(#{subject},#{question},#{answerA},#{answerB},#{answerC},#{answerD},#{rightAnswer},#{analysis},#{section},#{level})")
    int addMultiQuestion(MultiQuestion multiQuestion);

    @Select("SELECT questionId FROM multiquestion WHERE questionId=(" +
            "SELECT MAX(questionId) FROM multiquestion)")
    MultiQuestion multiQuestionId();

    @Select("select * from multiquestion where questionId in " +
            "(select questionId from papermanage " +
            "where questionType = 1 and paperId = #{paperId})")
    List<MultiQuestion> getmultiQuestionByPaperId(int paperId);

    @Select("select * from multiquestion where questionId=#{questionId}")
    MultiQuestion selectById(Integer questionId);

    @Update("update multiquestion " +
            "set subject=#{subject},question=#{question},answerA=#{answerA},answerB=#{answerB},answerC=#{answerC},answerD=#{answerD}," +
            "rightAnswer=#{rightAnswer},analysis=#{analysis},score=#{score},section=#{section},level=#{level} where questionId=#{questionId}")
    int updateQuestion(MultiQuestion multiQuestion);

    @Delete("delete from multiquestion where questionId=#{questionId}")
    int deleteById(Integer questionId);
}

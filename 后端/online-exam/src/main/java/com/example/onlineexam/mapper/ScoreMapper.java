package com.example.onlineexam.mapper;

import com.example.onlineexam.pojo.Score;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ScoreMapper {
    @Select("select * from score where studentId=#{studentId} ORDER BY answerDate")
    List<Score> selectScoreByStudentId(int studentId);

    @Select("select * from score where examCode=#{examCode}")
    List<Score> getScoreByExamCode(int examCode);

    @Insert("insert into " +
            "score(examCode,studentId,subject,ptScore,etScore,score,answerDate) " +
            "values(#{examCode},#{studentId},#{subject},#{ptScore},#{etScore},#{score},#{answerDate})")
    int addScore(Score score);
}

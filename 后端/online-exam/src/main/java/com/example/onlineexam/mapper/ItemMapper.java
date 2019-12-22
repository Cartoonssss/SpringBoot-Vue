package com.example.onlineexam.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ItemMapper {
    @Select("select questionId from multiquestion " +
            "WHERE subject=#{subject} and level=#{level} " +
            "order by rand() limit #{changeNumber}")
    List<Integer> randMultiQuestion(@Param("subject") String subject,@Param("changeNumber") Integer changeNumber,@Param("level") Integer level);

    @Select("select questionId from fillquestion " +
            "WHERE subject=#{subject} and level=#{level} " +
            "order by rand() limit #{fillNumber}")
    List<Integer> randFillQuestion(@Param("subject") String subject, @Param("fillNumber") Integer fillNumber,@Param("level") Integer level);

    @Select("select questionId from judgequestion " +
            "WHERE subject=#{subject} and level=#{level} " +
            "order by rand() limit #{judgeNumber}")
    List<Integer> randJudgeQuestion(@Param("subject") String subject, @Param("judgeNumber") Integer judgeNumber,@Param("level") Integer level);

    @Insert("insert into papermanage(paperId,questionType,questionId) " +
            "values(#{paperId},#{i},#{integer})")
    int addQuestion(@Param("integer") Integer integer, @Param("paperId") Integer paperId, @Param("i") int i);

    @Delete("delete from papermanage where paperId=#{paperId}")
    int cleanPaper(Integer paperId);
}

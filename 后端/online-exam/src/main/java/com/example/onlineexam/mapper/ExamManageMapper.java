package com.example.onlineexam.mapper;

import com.example.onlineexam.pojo.ExamManage;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface ExamManageMapper {
    @Select("SELECT * FROM exammanage")
    List<ExamManage> selectAllExamManage();

    @Select("SELECT * FROM exammanage WHERE paperId IN (SELECT paperId FROM papermanage)")
    List<ExamManage> selectPartExamManage();

    @Select("SELECT MAX(paperId) FROM exammanage")
    Integer examManagePaperId();

    @Insert("insert into exammanage" +
            "(description,source,paperId,examDate,totalTime,grade,term,major,institute,totalScore,type,tips)" +
            " values(#{description},#{source},#{paperId},#{examDate},#{totalTime},#{grade},#{term},#{major},#{institute},#{totalScore},#{type},#{tips})")
    Integer addExam(ExamManage examManage);

    @Select("select * from exammanage where examCode=#{id}")
    ExamManage selectExamManageById(Integer id);

    @Update("update exammanage " +
            "set description = #{description},source = #{source},paperId = #{paperId},examDate = #{examDate},totalTime = #{totalTime},grade = #{grade},term = #{term},major = #{major},institute = #{institute},totalScore = #{totalScore},type = #{type},tips = #{tips} " +
            "where examCode = #{examCode}")
    Integer updateExam(ExamManage examManage);

    @Delete("delete from exammanage where examCode = #{id}")
    Integer deleteExam(Integer id);

    @Select("select * from exammanage")
    List<ExamManage> selectAll();
}

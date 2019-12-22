package com.example.onlineexam.mapper;

import com.example.onlineexam.pojo.Teacher;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface TeacherMapper {
    @Select("select * from teacher")
    List<Teacher> selectAllTeacher();

    @Insert("insert into " +
            "teacher(teacherName,sex,tel,email,pwd,cardId,role,type,institute) " +
            "values(#{teacherName},#{sex},#{tel},#{email},#{pwd},#{cardId},#{role},#{type},#{institute})")
    Integer addTeacher(Teacher teacher);

    @Select("select * from teacher where teacherId=#{id}")
    Teacher selectTeacherById(Integer id);

    @Update("update teacher " +
            "set teacherName = #{teacherName},sex = #{sex},tel = #{tel}, email = #{email},pwd = #{pwd},cardId = #{cardId},role = #{role},institute = #{institute},type = #{type} " +
            "where teacherId = #{teacherId}")
    Integer updateTeacher(Teacher teacher);

    @Delete("delete from teacher where teacherId=#{id}")
    Integer deleteTeacher(Integer id);

    /**
     * 更新密码
     * @param teacher
     * @return 受影响的记录条数
     */
    @Update("update teacher set pwd = #{pwd} where teacherId = #{teacherId}")
    int updatePwdTeacher(Teacher teacher);
}

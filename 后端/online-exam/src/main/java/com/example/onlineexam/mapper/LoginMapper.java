package com.example.onlineexam.mapper;

import com.example.onlineexam.pojo.Admin;
import com.example.onlineexam.pojo.Login;
import com.example.onlineexam.pojo.Student;
import com.example.onlineexam.pojo.Teacher;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface LoginMapper {


    @Select("select adminId,adminName,sex,tel,email,cardId,role from admin where adminId = #{username} and pwd = #{password}")
    public Admin adminLogin(@Param("username") Integer username, @Param("password") String password);

    @Select("select teacherId,teacherName,institute,sex,tel,email,cardId," +
            "type,role from teacher where teacherId = #{username} and pwd = #{password}")
    public Teacher teacherLogin(@Param("username") Integer username,@Param("password") String password);

    @Select("select studentId,studentName,grade,major,clazz,institute,tel," +
            "email,cardId,sex,role from student where studentId = #{username} and pwd = #{password}")
    public Student studentLogin(@Param("username") Integer username,@Param("password") String password);
}

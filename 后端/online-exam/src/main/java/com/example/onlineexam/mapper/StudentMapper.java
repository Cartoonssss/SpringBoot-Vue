package com.example.onlineexam.mapper;

import com.example.onlineexam.pojo.Student;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface StudentMapper {
    @Select("select * from student")
    List<Student> selectAllStudent();

    @Select("select * from student where studentId=#{id}")
    Student selectStudentById(Integer id);

    @Update("update student " +
            "set studentName = #{studentName},grade = #{grade},major = #{major},clazz = #{clazz}," +
            "institute = #{institute},tel = #{tel},email = #{email},pwd = #{pwd},cardId = #{cardId},sex = #{sex},role = #{role} " +
            "where studentId = #{studentId}")
    Integer updateStudent(Student student);

    @Insert("insert into " +
            "student(studentName,grade,major,clazz,institute,tel,email,pwd,cardId,sex,role) values " +
            "(#{studentName},#{grade},#{major},#{clazz},#{institute},#{tel},#{email},#{pwd},#{cardId},#{sex},#{role})")
    Integer addStudent(Student student);

    @Delete("delete from student where studentId = #{id}")
    Integer deleteStudentById(Integer id);

    @Update("update student set pwd = #{pwd} where studentId = #{studentId}")
    Integer updateStudentPwd(Student student);
}

package com.example.onlineexam.service;

import com.example.onlineexam.pojo.Student;
import com.example.onlineexam.util.PageBean;

public interface StudentService {
    PageBean<Student> selectStudentByPage(Integer page, Integer size);

    Student selectStudentById(Integer id);

    Integer updateStudent(Student student);

    Integer addStudent(Student student);

    Integer deleteStudent(Integer id);

    Integer updateStudentPwd(Student student);
}

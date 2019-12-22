package com.example.onlineexam.service;

import com.example.onlineexam.pojo.Teacher;
import com.example.onlineexam.util.PageBean;

public interface TeacherService {
    PageBean<Teacher> selectTeacherByPage(Integer page, Integer size);

    Integer addTeacher(Teacher teacher);

    Teacher selectTeacherById(Integer id);

    Integer updateTeacher(Teacher teacher);

    Integer deleteTeacher(Integer id);

    int updatePwdTeacher(Teacher teacher);
}

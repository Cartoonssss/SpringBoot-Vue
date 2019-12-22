package com.example.onlineexam.service.impl;

import com.example.onlineexam.mapper.TeacherMapper;
import com.example.onlineexam.pojo.Teacher;
import com.example.onlineexam.service.TeacherService;
import com.example.onlineexam.util.MD5EncodingUtil;
import com.example.onlineexam.util.PageBean;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class TeacherServiceImpl implements TeacherService {
    @Autowired
    private TeacherMapper teacherMapper;

    @Override
    public PageBean<Teacher> selectTeacherByPage(Integer page, Integer size) {
        PageHelper.startPage(page, size);
        List<Teacher> teachers = teacherMapper.selectAllTeacher();
        PageBean<Teacher> teacherPageInfo = new PageBean<>(teachers,size);
        return teacherPageInfo;
    }

    @Override
    @Transactional
    public Integer addTeacher(Teacher teacher) {
        return teacherMapper.addTeacher(teacher);
    }

    @Override
    public Teacher selectTeacherById(Integer id) {
        return teacherMapper.selectTeacherById(id);
    }

    @Override
    @Transactional
    public Integer updateTeacher(Teacher teacher) {
        return teacherMapper.updateTeacher(teacher);
    }

    @Override
    @Transactional
    public Integer deleteTeacher(Integer id) {
        return teacherMapper.deleteTeacher(id);
    }

    @Override
    public int updatePwdTeacher(Teacher teacher) {
        teacher.setPwd(MD5EncodingUtil.getMD5(teacher.getPwd()));
        return teacherMapper.updatePwdTeacher(teacher);
    }
}

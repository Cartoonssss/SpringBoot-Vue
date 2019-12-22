package com.example.onlineexam.service.impl;

import com.example.onlineexam.mapper.StudentMapper;
import com.example.onlineexam.pojo.Student;
import com.example.onlineexam.service.StudentService;
import com.example.onlineexam.util.MD5EncodingUtil;
import com.example.onlineexam.util.PageBean;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentMapper studentMapper;
    @Override
    public PageBean<Student> selectStudentByPage(Integer page, Integer size) {
        PageHelper.startPage(page, size);
        List<Student> students = studentMapper.selectAllStudent();
        PageBean<Student> studentPageInfo = new PageBean<>(students,size);
        return studentPageInfo;
    }

    @Override
    public Student selectStudentById(Integer id) {
        return studentMapper.selectStudentById(id);
    }

    @Override
    @Transactional
    public Integer updateStudent(Student student) {
        return studentMapper.updateStudent(student);
    }

    @Override
    @Transactional
    public Integer addStudent(Student student) {
        student.setPwd(MD5EncodingUtil.getMD5(student.getPwd()));
        return studentMapper.addStudent(student);
    }

    @Override
    @Transactional
    public Integer deleteStudent(Integer id) {
        return studentMapper.deleteStudentById(id);
    }

    @Override
    public Integer updateStudentPwd(Student student) {
        student.setPwd(MD5EncodingUtil.getMD5(student.getPwd()));
        return studentMapper.updateStudentPwd(student);
    }
}

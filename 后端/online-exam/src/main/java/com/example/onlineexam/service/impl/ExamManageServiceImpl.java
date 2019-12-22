package com.example.onlineexam.service.impl;

import com.example.onlineexam.mapper.ExamManageMapper;
import com.example.onlineexam.pojo.ExamManage;
import com.example.onlineexam.service.ExamManageService;
import com.example.onlineexam.util.PageBean;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ExamManageServiceImpl implements ExamManageService {
    @Autowired
    private ExamManageMapper examManageMapper;
    @Override
    public PageBean<ExamManage> selectExamManageByPage(Integer page, Integer size) {
        PageHelper.startPage(page, size);
        List<ExamManage> examManages = examManageMapper.selectAllExamManage();
        PageBean<ExamManage> examManagePageBean = new PageBean<>(examManages,size);
        return examManagePageBean;
    }

    @Override
    public PageBean<ExamManage> selectPartExamManageByPage(Integer page, Integer size) {
        PageHelper.startPage(page, size);
        List<ExamManage> examManages = examManageMapper.selectPartExamManage();
        PageBean<ExamManage> examManagePageBean = new PageBean<>(examManages,size);
        return examManagePageBean;
    }

    @Override
    public List<ExamManage> selectPartExamManage() {
        return examManageMapper.selectPartExamManage();
    }

    @Override
    public Integer examManagePaperId() {
        return examManageMapper.examManagePaperId();
    }

    @Override
    @Transactional
    public Integer addExam(ExamManage examManage) {
        Integer integer = examManageMapper.examManagePaperId();
        examManage.setPaperId(integer+1);
        return examManageMapper.addExam(examManage);
    }

    @Override
    public ExamManage selectExamManageById(Integer id) {
        return examManageMapper.selectExamManageById(id);
    }

    @Override
    @Transactional
    public Integer updateExam(ExamManage examManage) {
        return examManageMapper.updateExam(examManage);
    }

    @Override
    @Transactional
    public Integer deleteExam(Integer id) {
        return examManageMapper.deleteExam(id);
    }

    @Override
    public List<ExamManage> selectAll() {
        return examManageMapper.selectAll();
    }
}

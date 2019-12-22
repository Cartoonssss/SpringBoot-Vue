package com.example.onlineexam.service;

import com.example.onlineexam.pojo.ExamManage;
import com.example.onlineexam.util.PageBean;

import java.util.List;

public interface ExamManageService {
    PageBean<ExamManage> selectExamManageByPage(Integer page, Integer size);

    PageBean<ExamManage> selectPartExamManageByPage(Integer page, Integer size);

    List<ExamManage> selectPartExamManage();

    Integer examManagePaperId();

    Integer addExam(ExamManage examManage);

    ExamManage selectExamManageById(Integer id);

    Integer updateExam(ExamManage examManage);

    Integer deleteExam(Integer id);

    List<ExamManage> selectAll();
}

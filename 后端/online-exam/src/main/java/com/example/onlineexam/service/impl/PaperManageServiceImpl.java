package com.example.onlineexam.service.impl;

import com.example.onlineexam.mapper.PaperManageMapper;
import com.example.onlineexam.pojo.PaperManage;
import com.example.onlineexam.service.PaperManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PaperManageServiceImpl implements PaperManageService {
    @Autowired
    private PaperManageMapper paperManageMapper;

    @Override
    @Transactional
    public int addPaper(PaperManage paperManage) {
        return paperManageMapper.addPaper(paperManage);
    }

}

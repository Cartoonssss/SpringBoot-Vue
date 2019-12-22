package com.example.onlineexam.service.impl;

import com.example.onlineexam.mapper.ScoreMapper;
import com.example.onlineexam.pojo.Score;
import com.example.onlineexam.service.ScoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ScoreServiceImpl implements ScoreService {
    @Autowired
    private ScoreMapper scoreMapper;

    @Override
    public List<Score> getScoreByStudentId(int studentId) {
        return scoreMapper.selectScoreByStudentId(studentId);
    }

    @Override
    public List<Score> getScoreByExamCode(int examCode) {
        return scoreMapper.getScoreByExamCode(examCode);
    }

    @Override
    public int addScore(Score score) {
        return scoreMapper.addScore(score);
    }
}

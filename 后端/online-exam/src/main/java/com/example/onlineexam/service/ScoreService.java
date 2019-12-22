package com.example.onlineexam.service;

import com.example.onlineexam.pojo.Score;

import java.util.List;

public interface ScoreService {
    List<Score> getScoreByStudentId(int studentId);

    List<Score> getScoreByExamCode(int examCode);

    int addScore(Score score);
}

package com.example.onlineexam.controller;

import com.example.onlineexam.util.ApiResult;
import com.example.onlineexam.pojo.Score;
import com.example.onlineexam.service.ScoreService;
import com.example.onlineexam.util.ApiResultHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class ScoreController {
    @Autowired
    private ScoreService scoreService;

    @GetMapping("score/{studentId}")
    public ApiResult score(@PathVariable("studentId") int studentId){
        List<Score> score = scoreService.getScoreByStudentId(studentId);
        if(score.size()==0){
            return ApiResultHandler.buildApiResult(400, "未查到成绩", score);
        }
        return ApiResultHandler.buildApiResult(200, "查询成功", score);
    }
    @GetMapping("scores/{examCode}")
    public ApiResult scores(@PathVariable("examCode") int examCode){
        List<Score> score = scoreService.getScoreByExamCode(examCode);
        return ApiResultHandler.buildApiResult(200, "查询成功", score);
    }
    @PostMapping("score")
    public ApiResult getScore(@RequestBody Score score){
        int i = scoreService.addScore(score);
        if(i==1){
            return ApiResultHandler.buildApiResult(200, "增加成绩成功", i);
        }
        else {
            return ApiResultHandler.buildApiResult(400, "增加成绩失败", i);
        }
    }
}

package com.example.onlineexam.controller;

import com.example.onlineexam.pojo.Replay;
import com.example.onlineexam.service.ReplayService;
import com.example.onlineexam.util.ApiResult;
import com.example.onlineexam.util.ApiResultHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class ReplayController {
    @Autowired
    private ReplayService replayService;

    @PostMapping("replay")
    public ApiResult replay(@RequestBody Replay replay){
        int i = replayService.addReplay(replay);
        if(i==1){
            return ApiResultHandler.buildApiResult(200, "回复留言成功", i);
        }
        else {
            return ApiResultHandler.buildApiResult(400, "回复留言失败", i);
        }
    }
    @GetMapping("replay/{messageId}")
    public ApiResult selectById(@PathVariable("messageId") Integer messageId){
        List<Replay> replays = replayService.selectById(messageId);
        return ApiResultHandler.buildApiResult(200, "查找留言", replays);
    }
}

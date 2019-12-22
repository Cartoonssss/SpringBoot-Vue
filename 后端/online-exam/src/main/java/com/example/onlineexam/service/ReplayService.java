package com.example.onlineexam.service;

import com.example.onlineexam.pojo.Replay;

import java.util.List;

public interface ReplayService {
    int addReplay(Replay replay);

    List<Replay> selectById(Integer messageId);
}

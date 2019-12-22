package com.example.onlineexam.service.impl;

import com.example.onlineexam.mapper.ReplayMapper;
import com.example.onlineexam.pojo.Replay;
import com.example.onlineexam.service.ReplayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReplayServiceImpl implements ReplayService {
    @Autowired
    private ReplayMapper replayMapper;

    @Override
    public int addReplay(Replay replay) {
        return replayMapper.addReplay(replay);
    }

    @Override
    public List<Replay> selectById(Integer messageId) {
        return replayMapper.selectById(messageId);
    }
}

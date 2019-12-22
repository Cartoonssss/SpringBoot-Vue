package com.example.onlineexam.service.impl;

import com.example.onlineexam.mapper.MessageMapper;
import com.example.onlineexam.pojo.Message;
import com.example.onlineexam.service.MessageService;
import com.example.onlineexam.util.PageBean;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {
    @Autowired
    private MessageMapper messageMapper;

    @Override
    public int addMessage(Message message) {
        return messageMapper.addMessage(message);
    }

    @Override
    public PageBean<Message> MessageByPage(Integer page, Integer size) {
        PageHelper.startPage(page, size);
        List<Message> messages = messageMapper.selectAllMessage();
        PageBean<Message> messagePageBean = new PageBean<>(messages,size);
        return messagePageBean;
    }

    @Override
    public Message selectById(Integer id) {
        return messageMapper.selectById(id);
    }
}

package com.example.onlineexam.service;

import com.example.onlineexam.pojo.Message;
import com.example.onlineexam.util.PageBean;

public interface MessageService {
    int addMessage(Message message);

    PageBean<Message> MessageByPage(Integer page, Integer size);

    Message selectById(Integer id);
}

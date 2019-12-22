package com.example.onlineexam.controller;

import com.example.onlineexam.pojo.Message;
import com.example.onlineexam.service.MessageService;
import com.example.onlineexam.util.ApiResult;
import com.example.onlineexam.util.ApiResultHandler;
import com.example.onlineexam.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class MessageController {
    @Autowired
    private MessageService messageService;
    @PostMapping("message")
    public ApiResult addMessage(@RequestBody Message message){
        int i = messageService.addMessage(message);
        if(i==1){
            return ApiResultHandler.buildApiResult(200, "添加留言成功", i);
        }
        else {
            return ApiResultHandler.buildApiResult(400, "添加留言失败", i);
        }
    }
    @GetMapping("messages/{page}/{size}")
    public ApiResult messages(@PathVariable("page") Integer page,@PathVariable("size") Integer size){
        PageBean<Message> messagePageBean = messageService.MessageByPage(page, size);
        return ApiResultHandler.buildApiResult(200, "分页查找成功", messagePageBean);
    }
    @GetMapping("/message/{id}")
    public ApiResult selectById(@PathVariable("id") Integer id){
        Message message = messageService.selectById(id);
        return ApiResultHandler.buildApiResult(200, "查询消息", message);
    }

}

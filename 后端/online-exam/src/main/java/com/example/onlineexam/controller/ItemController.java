package com.example.onlineexam.controller;

import com.example.onlineexam.util.ApiResult;
import com.example.onlineexam.pojo.Item;
import com.example.onlineexam.service.ItemService;
import com.example.onlineexam.util.ApiResultHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ItemController {
    @Autowired
    private ItemService itemService;
    @PostMapping("item")
    public ApiResult item(@RequestBody Item item){
        Integer changeNumber = item.getChangeNumber();
        Integer fillNumber = item.getFillNumber();
        Integer judgeNumber = item.getJudgeNumber();
        Integer paperId = item.getPaperId();
        String subject = item.getSubject();
        if(changeNumber==null && fillNumber==null && judgeNumber==null){
            return ApiResultHandler.buildApiResult(400, "题型数量不能全为空", null);
        }else {
        itemService.cleanPaper(paperId);
        ApiResult apiResult = itemService.randItem(item);
        return apiResult;
        }
    }
}

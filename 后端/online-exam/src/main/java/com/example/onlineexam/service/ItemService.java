package com.example.onlineexam.service;

import com.example.onlineexam.pojo.Item;
import com.example.onlineexam.util.ApiResult;

import java.util.List;

public interface ItemService {
//    List<Integer> randMultiQuestion(String subject, Integer changeNumber);
//
//    List<Integer> randFillQuestion(String subject, Integer fillNumber);
//
//    List<Integer> randJudgeQuestion(String subject, Integer judgeNumber);

    ApiResult randItem(Item item);

    int cleanPaper(Integer paperId);
}

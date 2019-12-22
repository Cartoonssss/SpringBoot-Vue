package com.example.onlineexam.service.impl;

import com.example.onlineexam.mapper.ItemMapper;
import com.example.onlineexam.pojo.Item;
import com.example.onlineexam.util.ApiResult;
import com.example.onlineexam.service.ItemService;
import com.example.onlineexam.util.ApiResultHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ItemServiceImpl implements ItemService {
    @Autowired
    private ItemMapper itemMapper;

//    @Override
//    public List<Integer> randMultiQuestion(String subject, Integer changeNumber) {
//        return itemMapper.randMultiQuestion(subject,changeNumber);
//    }
//
//    @Override
//    public List<Integer> randFillQuestion(String subject, Integer fillNumber) {
//        return itemMapper.randFillQuestion(subject,fillNumber);
//    }
//
//    @Override
//    public List<Integer> randJudgeQuestion(String subject, Integer judgeNumber) {
//        return itemMapper.randJudgeQuestion(subject,judgeNumber);
//    }

    @Override
    @Transactional
    public ApiResult randItem(Item item) {
        Integer changeNumber = item.getChangeNumber();
        Integer fillNumber = item.getFillNumber();
        Integer judgeNumber = item.getJudgeNumber();
        Integer paperId = item.getPaperId();
        String subject = item.getSubject();
        Integer level = item.getLevel();
        if(changeNumber!=null) {
            List<Integer> multiQuestion = itemMapper.randMultiQuestion(subject, changeNumber,level);
            if (multiQuestion.size() == 0) {
//            throw new RuntimeException("随机生成选择题失败");
                return ApiResultHandler.buildApiResult(400, "随机生成选择题失败", null);
            }
            for (Integer integer : multiQuestion) {
                int addQuestion = itemMapper.addQuestion(integer, paperId, 1);
                if (addQuestion == 0) {
//                throw new RuntimeException("添加选择题失败");
                    return ApiResultHandler.buildApiResult(400, "添加选择题失败", null);
                }
            }
        }

        if(fillNumber!=null) {
            List<Integer> fillQuestion = itemMapper.randFillQuestion(subject, fillNumber,level);
            if (fillQuestion.size() == 0) {
//            throw new RuntimeException("随机生成填空题失败");
                return ApiResultHandler.buildApiResult(400, "随机生成填空题失败", null);
            }
            for (Integer integer : fillQuestion) {
                int addQuestion = itemMapper.addQuestion(integer, paperId, 2);
                if (addQuestion == 0) {
//                throw new RuntimeException("添加填空题失败");
                    return ApiResultHandler.buildApiResult(400, "添加填空题失败", null);
                }
            }
        }

        if(judgeNumber!=null) {
            List<Integer> judgeQuestion = itemMapper.randJudgeQuestion(subject, judgeNumber,level);
            if (judgeQuestion.size() == 0) {
//            throw new RuntimeException("随机生成判断题失败");
                return ApiResultHandler.buildApiResult(400, "随机生成判断题失败", null);
            }
            for (Integer integer : judgeQuestion) {
                int addQuestion = itemMapper.addQuestion(integer, paperId, 3);
                if (addQuestion == 0) {
//                throw new RuntimeException("添加判断题失败");
                    return ApiResultHandler.buildApiResult(400, "添加判断题失败", null);
                }
            }
        }
        return ApiResultHandler.buildApiResult(200,"组卷成功",null);
    }


    @Override
    public int cleanPaper(Integer paperId) {
        return itemMapper.cleanPaper(paperId);
    }
}

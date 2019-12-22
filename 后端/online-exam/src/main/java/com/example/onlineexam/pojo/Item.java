package com.example.onlineexam.pojo;

import lombok.Data;

//题目模型
@Data
public class Item {
    private Integer level;

    private String subject;

    private Integer paperId;

    private Integer changeNumber;

    private Integer fillNumber;

    private Integer judgeNumber;
}

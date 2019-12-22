package com.example.onlineexam.pojo;

import lombok.Data;

@Data
public class Answer {
    private Integer questionId;
    private String question;
    private String subject;
    private String score;
    private String section;
    private String level;
    private String type;
}

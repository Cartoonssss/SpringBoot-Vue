package com.example.onlineexam.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class Replay {
    private Integer messageId;

    private Integer replayId;

    private String replay;

    private String replayName;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone="GMT+8")
    private Date replayTime;
}
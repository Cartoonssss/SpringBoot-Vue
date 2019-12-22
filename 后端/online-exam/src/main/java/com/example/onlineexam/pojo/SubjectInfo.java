package com.example.onlineexam.pojo;

import lombok.Data;

@Data
public class SubjectInfo {
    private Integer subjectId;

    private String subjectName;

    private String institute;

    private Integer instituteId;

    private Integer teacherId;
}
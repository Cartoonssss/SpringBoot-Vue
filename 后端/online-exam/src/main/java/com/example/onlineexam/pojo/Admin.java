package com.example.onlineexam.pojo;

import lombok.Data;

@Data
public class Admin {
    private Integer adminId;

    private String adminName;

    private String sex;

    private String tel;

    private String email;

    private String pwd;

    private String cardId;

    private String role;
}
package com.example.onlineexam.util;
import com.github.pagehelper.PageInfo;
import lombok.Data;

import java.util.List;
@Data
public class PageBean<T> {
    private List<T> records;   //结果集
    private long total;        //总记录数
    private int size;          //每页条数
    private int current;       //当前页
    private int pages;         //总页数

    public PageBean(List<T> list,int size) {
        PageInfo<T> pageInfo = new PageInfo<>(list);
        this.records=pageInfo.getList();
        this.total=pageInfo.getTotal();
        this.size=size;
        this.current=pageInfo.getPageNum();
        this.pages=pageInfo.getPages();
    }
}
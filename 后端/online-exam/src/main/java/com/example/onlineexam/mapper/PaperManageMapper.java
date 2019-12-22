package com.example.onlineexam.mapper;

import com.example.onlineexam.pojo.PaperManage;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface PaperManageMapper {
    @Insert("insert into " +
            "papermanage(paperId,questionType,questionId) values " +
            "(#{paperId},#{questionType},#{questionId})")
    int addPaper(PaperManage paperManage);
}

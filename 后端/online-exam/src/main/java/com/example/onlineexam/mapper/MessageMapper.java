package com.example.onlineexam.mapper;

import com.example.onlineexam.pojo.Message;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface MessageMapper {
    @Insert("insert into " +
            "message(title, content, time,name) " +
            "values(#{title},#{content},#{time},#{name})")
    int addMessage(Message message);

    @Select("select id,id as temp_id,title,content,time,name from message order by id desc")
    @Results({
            @Result(property = "replays", column = "temp_id",many = @Many(select = "com.example.onlineexam.mapper.ReplayMapper.selectById"))
    })
    List<Message> selectAllMessage();

    @Select("select * from message where id = #{id}")
    Message selectById(Integer id);
}

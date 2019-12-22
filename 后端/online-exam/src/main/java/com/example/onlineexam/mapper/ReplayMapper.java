package com.example.onlineexam.mapper;

import com.example.onlineexam.pojo.Replay;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ReplayMapper {
    @Insert("insert into " +
            "replay(messageId,replay,replayTime,replayName) " +
            "values(#{messageId}, #{replay},#{replayTime},#{replayName})")
    int addReplay(Replay replay);

    @Select("select * from replay where messageId = #{messageId}")
    List<Replay> selectById(Integer messageId);
}

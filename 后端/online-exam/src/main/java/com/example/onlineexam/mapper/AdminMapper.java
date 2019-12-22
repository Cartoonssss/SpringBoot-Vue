package com.example.onlineexam.mapper;


import com.example.onlineexam.pojo.Admin;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface AdminMapper {

    /**
     * 更新密码
     * @param admin
     * @return 受影响的记录条数
     */
    @Update("update admin set pwd = #{pwd} where adminId = #{adminId}")
    int updatePwd(Admin admin);
}

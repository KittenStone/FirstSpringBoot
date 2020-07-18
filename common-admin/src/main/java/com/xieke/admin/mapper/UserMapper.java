package com.xieke.admin.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.xieke.admin.dto.UserInfo;
import com.xieke.admin.entity.User;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * 系统用户表 Mapper 接口
 * </p>
 */
public interface UserMapper extends BaseMapper<User> {

    UserInfo findUserInfo(String userName);


    int updateUserAmountById(@Param("userId") Integer userId, @Param("amount") Double amount);

}

package com.xieke.admin.service;

import com.baomidou.mybatisplus.service.IService;
import com.xieke.admin.dto.UserInfo;
import com.xieke.admin.entity.User;

/**
 * <p>
 * 系统用户表 服务类
 * </p>
 */
public interface IUserService extends IService<User> {

    UserInfo findUserInfo(String userName);


    int updateUserAmountById(Integer userId,Double amount);

}

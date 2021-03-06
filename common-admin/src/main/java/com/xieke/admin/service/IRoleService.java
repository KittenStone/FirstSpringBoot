package com.xieke.admin.service;

import com.baomidou.mybatisplus.service.IService;
import com.xieke.admin.entity.Role;

/**
 * <p>
 * 系统角色表 服务类
 * </p>
 */
public interface IRoleService extends IService<Role> {

    Boolean saveRole(Role role);

}
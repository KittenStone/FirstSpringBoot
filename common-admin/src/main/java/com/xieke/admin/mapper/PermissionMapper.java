package com.xieke.admin.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.xieke.admin.dto.PermissionInfo;
import com.xieke.admin.entity.Permission;

import java.util.List;

/**
 * <p>
 * 系统权限表 Mapper 接口
 * </p>
 */
public interface PermissionMapper extends BaseMapper<Permission> {

    List<PermissionInfo> allPermissionInfo();

}

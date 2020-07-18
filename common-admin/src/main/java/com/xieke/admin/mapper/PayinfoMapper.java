package com.xieke.admin.mapper;

import com.xieke.admin.entity.PayInfoBean;
import com.xieke.admin.entity.Payinfo;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 订单信息 Mapper 接口
 */
public interface PayinfoMapper extends BaseMapper<Payinfo> {


    int getCountByPage(@Param("statr") int statr, @Param("end") int end, @Param("searchKey") String searchKey);

    List<PayInfoBean> getDataListByPage(@Param("statr") int statr, @Param("end") int end, @Param("searchKey") String searchKey);

}

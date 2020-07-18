package com.xieke.admin.service;

import com.baomidou.mybatisplus.service.IService;
import com.xieke.admin.entity.PayInfoBean;
import com.xieke.admin.entity.Payinfo;

import java.util.List;


/**
 * 订单信息 服务类
 */
public interface IPayinfoService extends IService<Payinfo> {


    int getCountByPage(int statr,int end,String searchKey);

    List<PayInfoBean> getDataListByPage(int statr, int end, String searchKey);

}
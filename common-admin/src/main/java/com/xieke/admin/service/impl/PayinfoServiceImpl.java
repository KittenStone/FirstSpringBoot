package com.xieke.admin.service.impl;



import com.xieke.admin.entity.PayInfoBean;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;


import com.xieke.admin.mapper.PayinfoMapper;
import com.xieke.admin.entity.Payinfo;
import com.xieke.admin.service.IPayinfoService;

import javax.annotation.Resource;
import java.util.List;


@Service
public class PayinfoServiceImpl extends ServiceImpl<PayinfoMapper, Payinfo> implements IPayinfoService {


    @Resource
    private PayinfoMapper payinfoMapper;


    @Override
    public int getCountByPage(int statr, int end, String searchKey) {
        return payinfoMapper.getCountByPage(statr,end,searchKey);
    }

    @Override
    public List<PayInfoBean> getDataListByPage(int statr, int end, String searchKey) {
        return payinfoMapper.getDataListByPage(statr,end,searchKey);
    }
}
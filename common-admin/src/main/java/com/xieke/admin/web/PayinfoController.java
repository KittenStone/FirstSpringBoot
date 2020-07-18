package com.xieke.admin.web;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.xieke.admin.dto.ResultInfo;
import com.xieke.admin.entity.Payinfo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.*;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;


import com.xieke.admin.service.IPayinfoService;

/**
 * 订单信息 前端控制器
 */
@Controller
@RequestMapping("/payinfo")
public class PayinfoController {
    @Resource
    private IPayinfoService iPayinfoService;

    @RequestMapping("/*")
    public void toHtml(){

    }

    @RequestMapping("/listData")
    @RequiresPermissions("payinfo:view")
    public @ResponseBody
    ResultInfo<List<Payinfo>> listData(Payinfo payinfo, Integer page, Integer limit,String searchKey){

        int start=(page-1)*limit;

        int end =limit;

        int count = iPayinfoService.getCountByPage(start,end,searchKey);

        List list=iPayinfoService.getDataListByPage(start,end,searchKey);
        return new ResultInfo<>(list, count);

    }

    @RequestMapping("/add")
    @RequiresPermissions("payinfo:add")
    public @ResponseBody
    ResultInfo<Boolean> add(Payinfo payinfo){
        boolean b = iPayinfoService.insert(payinfo);
        return new ResultInfo<>(b);
    }

    @RequestMapping("/delBatch")
    @RequiresPermissions("payinfo:del")
    public @ResponseBody
    ResultInfo<Boolean> delBatch(Integer[] idArr){
        boolean b = iPayinfoService.deleteBatchIds(Arrays.asList(idArr));
        return new ResultInfo<>(b);
    }

    @RequestMapping("/edit")
    @RequiresPermissions("payinfo:edit")
    public @ResponseBody
    ResultInfo<Boolean> edit(Payinfo payinfo){
        boolean b = iPayinfoService.updateById(payinfo);
        return new ResultInfo<>(b);
    }

}

package com.xieke.admin.web;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.xieke.admin.dto.ResultInfo;
import com.xieke.admin.entity.Role;
import com.xieke.admin.entity.TeachTime;
import com.xieke.admin.service.ITeachTimeService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.*;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;


/**
 * 教学时间-节次 前端控制器
 */
@Controller
@RequestMapping("/teachTime")
public class TeachTimeController {
    @Resource
    private ITeachTimeService iTeachTimeService;

    @RequestMapping("/*")
    public void toHtml(){

    }

    @RequestMapping("/selectListData")
    @ResponseBody
    public ResultInfo<List<TeachTime>> selectListData(TeachTime role){
        List<TeachTime> list = iTeachTimeService.selectList(new EntityWrapper<>(role));
        return new ResultInfo<>(list);
    }


    @RequestMapping("/listData")
    @RequiresPermissions("teachTime:view")
    public @ResponseBody
    ResultInfo<List<TeachTime>> listData(TeachTime teachTime, Integer page, Integer limit){
        EntityWrapper<TeachTime> wrapper = new EntityWrapper<>(teachTime);
        Page<TeachTime> pageObj = iTeachTimeService.selectPage(new Page<>(page,limit), wrapper);
        return new ResultInfo<>(pageObj.getRecords(), pageObj.getTotal());
    }

    @RequestMapping("/add")
    @RequiresPermissions("teachTime:add")
    public @ResponseBody
    ResultInfo<Boolean> add(TeachTime teachTime){
        boolean b = iTeachTimeService.insert(teachTime);
        return new ResultInfo<>(b);
    }

    @RequestMapping("/delBatch")
    @RequiresPermissions("teachTime:del")
    public @ResponseBody
    ResultInfo<Boolean> delBatch(Integer[] idArr){
        boolean b = iTeachTimeService.deleteBatchIds(Arrays.asList(idArr));
        return new ResultInfo<>(b);
    }

    @RequestMapping("/edit")
    @RequiresPermissions("teachTime:edit")
    public @ResponseBody
    ResultInfo<Boolean> edit(TeachTime teachTime){
        boolean b = iTeachTimeService.updateById(teachTime);
        return new ResultInfo<>(b);
    }

}

package com.xieke.admin.web;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.xieke.admin.dto.ResultInfo;
import com.xieke.admin.entity.TeachWeek;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.*;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;


import com.xieke.admin.service.ITeachWeekService;

/**
 * 教学时间-周次 前端控制器
 */
@Controller
@RequestMapping("/teachWeek")
public class TeachWeekController {
    @Resource
    private ITeachWeekService iTeachWeekService;

    @RequestMapping("/*")
    public void toHtml(){

    }

    @RequestMapping("/selectListData")
    @ResponseBody
    public ResultInfo<List<TeachWeek>> selectListData(TeachWeek role){
        List<TeachWeek> list = iTeachWeekService.selectList(new EntityWrapper<>(role));
        return new ResultInfo<>(list);
    }


    @RequestMapping("/listData")
    @RequiresPermissions("teachWeek:view")
    public @ResponseBody
    ResultInfo<List<TeachWeek>> listData(TeachWeek teachWeek, Integer page, Integer limit){
        EntityWrapper<TeachWeek> wrapper = new EntityWrapper<>(teachWeek);
        Page<TeachWeek> pageObj = iTeachWeekService.selectPage(new Page<>(page,limit), wrapper);
        return new ResultInfo<>(pageObj.getRecords(), pageObj.getTotal());
    }

    @RequestMapping("/add")
    @RequiresPermissions("teachWeek:add")
    public @ResponseBody
    ResultInfo<Boolean> add(TeachWeek teachWeek){
        boolean b = iTeachWeekService.insert(teachWeek);
        return new ResultInfo<>(b);
    }

    @RequestMapping("/delBatch")
    @RequiresPermissions("teachWeek:del")
    public @ResponseBody
    ResultInfo<Boolean> delBatch(Integer[] idArr){
        boolean b = iTeachWeekService.deleteBatchIds(Arrays.asList(idArr));
        return new ResultInfo<>(b);
    }

    @RequestMapping("/edit")
    @RequiresPermissions("teachWeek:edit")
    public @ResponseBody
    ResultInfo<Boolean> edit(TeachWeek teachWeek){
        boolean b = iTeachWeekService.updateById(teachWeek);
        return new ResultInfo<>(b);
    }

}

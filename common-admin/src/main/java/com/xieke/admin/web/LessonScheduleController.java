package com.xieke.admin.web;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.xieke.admin.dto.ResultInfo;
import com.xieke.admin.entity.LessonSchedule;
import com.xieke.admin.entity.LessonScheduleBean;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.*;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;


import com.xieke.admin.service.ILessonScheduleService;

/**
 * 教学班表 前端控制器
 */
@Controller
@RequestMapping("/lessonSchedule")
public class LessonScheduleController {
    @Resource
    private ILessonScheduleService iLessonScheduleService;

    @RequestMapping("/*")
    public void toHtml(){

    }

    @RequestMapping("/listData")
    @RequiresPermissions("lessonSchedule:view")
    public @ResponseBody
    ResultInfo<List<LessonSchedule>> listData(String searchKey,LessonSchedule lessonSchedule, Integer page, Integer limit){
//        EntityWrapper<LessonSchedule> wrapper = new EntityWrapper<>(lessonSchedule);
//        Page<LessonSchedule> pageObj = iLessonScheduleService.selectPage(new Page<>(page,limit), wrapper);
//        return new ResultInfo<>(pageObj.getRecords(), pageObj.getTotal());

        int start=(page-1)*limit;

        int end =limit;

        int count = iLessonScheduleService.selectCount(lessonSchedule,searchKey);

        List list=iLessonScheduleService.listJoinData(lessonSchedule,start,end,searchKey);
        return new ResultInfo<>(list, count);
    }

    @RequestMapping("/add")
    @RequiresPermissions("lessonSchedule:add")
    public @ResponseBody
    ResultInfo<Boolean> add(LessonSchedule lessonSchedule){

        int existNum=iLessonScheduleService.hasChoosed(lessonSchedule);
        if(existNum==0){

            boolean b = iLessonScheduleService.insert(lessonSchedule);
            return new ResultInfo<>(b);

        }
        else {
            return new ResultInfo<>("该行课计划已经存在");
        }





    }

    @RequestMapping("/delBatch")
    @RequiresPermissions("lessonSchedule:del")
    public @ResponseBody
    ResultInfo<Boolean> delBatch(Integer[] idArr){
        boolean b = iLessonScheduleService.deleteBatchIds(Arrays.asList(idArr));
        return new ResultInfo<>(b);
    }

    @RequestMapping("/edit")
    @RequiresPermissions("lessonSchedule:edit")
    public @ResponseBody
    ResultInfo<Boolean> edit(LessonSchedule lessonSchedule){


        int existNum=iLessonScheduleService.hasChoosed(lessonSchedule);
        if(existNum==0){

            boolean b = iLessonScheduleService.updateById(lessonSchedule);
            return new ResultInfo<>(b);

        }
        else {
            return new ResultInfo<>("该行课计划已经存在");
        }



    }

}

package com.xieke.admin.web;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.xieke.admin.dto.ResultInfo;
import com.xieke.admin.entity.Course;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;
import javax.annotation.Resource;

import org.springframework.stereotype.Controller;


import com.xieke.admin.service.ICourseService;

/**
 * 课程表 前端控制器
 */
@Controller
@RequestMapping("/course")
public class CourseController {
    @Resource
    private ICourseService iCourseService;

    @RequestMapping("/*")
    public void toHtml() {

    }


    @RequestMapping("/selectListData")
    @ResponseBody
    public ResultInfo<List<Course>> selectListData(Course role){
        List<Course> list = iCourseService.selectList(new EntityWrapper<>(role));
        return new ResultInfo<>(list);
    }

    @RequestMapping("/listData")
    @RequiresPermissions("course:view")
    public @ResponseBody
    ResultInfo<List<Course>> listData(Course course, Integer page, Integer limit) {
        EntityWrapper<Course> wrapper = new EntityWrapper<>(course);
        Page<Course> pageObj = iCourseService.selectPage(new Page<>(page, limit), wrapper);
        return new ResultInfo<>(pageObj.getRecords(), pageObj.getTotal());
    }

    @RequestMapping("/add")
    @RequiresPermissions("course:add")
    public @ResponseBody
    ResultInfo<Boolean> add(Course course) {
        boolean b = iCourseService.insert(course);
        return new ResultInfo<>(b);
    }

    @RequestMapping("/delBatch")
    @RequiresPermissions("course:del")
    public @ResponseBody
    ResultInfo<Boolean> delBatch(Integer[] idArr) {
        boolean b = iCourseService.deleteBatchIds(Arrays.asList(idArr));
        return new ResultInfo<>(b);
    }

    @RequestMapping("/edit")
    @RequiresPermissions("course:edit")
    public @ResponseBody
    ResultInfo<Boolean> edit(Course course) {
        boolean b = iCourseService.updateById(course);
        return new ResultInfo<>(b);
    }

}

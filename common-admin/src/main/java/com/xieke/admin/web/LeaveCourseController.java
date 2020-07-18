package com.xieke.admin.web;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.xieke.admin.dto.ResultInfo;
import com.xieke.admin.dto.UserInfo;
import com.xieke.admin.entity.LeaveCourse;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.*;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;


import com.xieke.admin.service.ILeaveCourseService;

/**
 * 课堂请假信息表 前端控制器
 */
@Controller
@RequestMapping("/leaveCourse")
public class LeaveCourseController extends BaseController{
    @Resource
    private ILeaveCourseService iLeaveCourseService;

    @RequestMapping("/*")
    public void toHtml(){

    }

    @RequestMapping("/listData")
    @RequiresPermissions("leaveCourse:view")
    public @ResponseBody
    ResultInfo<List> listData(Integer page, Integer limit,String searchKey ){
        int start=(page-1)*limit;
        int end =limit;
        int count = iLeaveCourseService.selectCount(start,end,searchKey);
        List list=iLeaveCourseService.selectDataList(start,end,searchKey);
        return new ResultInfo<>(list, count);
    }

    /**
     * 学生选课列表
     * @param page
     * @param limit
     * @param searchKey
     * @return
     */
    @RequestMapping("/stuLeavelList")
    public @ResponseBody
    ResultInfo<List> stuChooseList(Integer page, Integer limit, String searchKey){
        UserInfo userInfo=this.getUserInfo();
        Integer userId=userInfo.getId();
        int start=(page-1)*limit;
        int end =limit;
        int count = iLeaveCourseService.selectStuCount(start,end,searchKey,userId);
        List list=iLeaveCourseService.selectStuDataList(start,end,searchKey,userId);
        return new ResultInfo<>(list, count);
    }

    /**
     * 学生选课列表
     * @param page
     * @param limit
     * @param searchKey
     * @return
     */
    @RequestMapping("/teachLeavelList")
    public @ResponseBody
    ResultInfo<List> teachChooseList(Integer page, Integer limit, String searchKey){
        UserInfo userInfo=this.getUserInfo();
        Integer userId=userInfo.getId();
        int start=(page-1)*limit;
        int end =limit;
        int count = iLeaveCourseService.selectTeachCount(start,end,searchKey,userId);
        List list=iLeaveCourseService.selectTeachDataList(start,end,searchKey,userId);
        return new ResultInfo<>(list, count);
    }


    @RequestMapping("/batchLevel")
    public @ResponseBody
    ResultInfo<Boolean> batchLevel(Integer[] idArr){
        UserInfo userInfo=this.getUserInfo();
        Integer userId=userInfo.getId();
        boolean exist=false;
        if(idArr!=null && idArr.length>0){
            for (int i = 0; i < idArr.length; i++) {
                int count=iLeaveCourseService.isLeaved(idArr[i],userId);
                if(count!=0){
                    exist=true;
                    break;
                }
            }
        }
        if(exist){
            return new ResultInfo<>("选择的课已经请过假了，不能重复请假");
        }
        boolean insert=false;
        if(idArr!=null && idArr.length>0){
            for (int i = 0; i < idArr.length; i++) {
                LeaveCourse leaveCourse=new LeaveCourse();
                leaveCourse.setChlsId(idArr[i]);
                leaveCourse.setLeveaUser(userId);
                leaveCourse.setComment("该课已请假");
                insert = iLeaveCourseService.insert(leaveCourse);
            }
        }
        return new ResultInfo<>(insert);
    }


    @RequestMapping("/add")
    @RequiresPermissions("leaveCourse:add")
    public @ResponseBody
    ResultInfo<Boolean> add(LeaveCourse leaveCourse){
        boolean b = iLeaveCourseService.insert(leaveCourse);
        return new ResultInfo<>(b);
    }

    @RequestMapping("/delBatch")
    @RequiresPermissions("leaveCourse:del")
    public @ResponseBody
    ResultInfo<Boolean> delBatch(Integer[] idArr){
        boolean b = iLeaveCourseService.deleteBatchIds(Arrays.asList(idArr));
        return new ResultInfo<>(b);
    }

    @RequestMapping("/edit")
    @RequiresPermissions("leaveCourse:edit")
    public @ResponseBody
    ResultInfo<Boolean> edit(LeaveCourse leaveCourse){
        boolean b = iLeaveCourseService.updateById(leaveCourse);
        return new ResultInfo<>(b);
    }

}

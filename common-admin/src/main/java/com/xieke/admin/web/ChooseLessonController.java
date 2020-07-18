package com.xieke.admin.web;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.xieke.admin.dto.ResultInfo;
import com.xieke.admin.dto.UserInfo;
import com.xieke.admin.entity.*;
import com.xieke.admin.service.IPayinfoService;
import com.xieke.admin.service.IUserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.*;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;


import com.xieke.admin.service.IChooseLessonService;

/**
 * 选课信息表 前端控制器
 */
@Controller
@RequestMapping("/chooseLesson")
public class ChooseLessonController  extends BaseController{
    @Resource
    private IChooseLessonService iChooseLessonService;


    @Resource
    private IPayinfoService payinfoService;

    @Resource
    private IUserService userService;

    @RequestMapping("/*")
    public void toHtml(){

    }

    @RequestMapping("/listData")
    @RequiresPermissions("chooseLesson:view")
    public @ResponseBody
    ResultInfo<List<ChooseLessonBean>> listData(ChooseLesson chooseLesson, Integer page, Integer limit, String searchKey){

        int start=(page-1)*limit;

        int end =limit;

        int count = iChooseLessonService.selectJoinCount(start,end,searchKey);

        List list=iChooseLessonService.selectJoinListData(start,end,searchKey);
        return new ResultInfo<>(list, count);

    }


    /**
     * 学生选课列表
     * @param page
     * @param limit
     * @param searchKey
     * @return
     */
    @RequestMapping("/stuChooseList")
    @RequiresPermissions("chooseLesson:view")
    public @ResponseBody
    ResultInfo<List> stuChooseList(Integer page, Integer limit, String searchKey){
        UserInfo userInfo=this.getUserInfo();
        Integer userId=userInfo.getId();
        int start=(page-1)*limit;
        int end =limit;
        int count = iChooseLessonService.selectStuChooseDataCount(start,end,searchKey,userId);
        List list=iChooseLessonService.selectStuChooseDataList(start,end,searchKey,userId);
        return new ResultInfo<>(list, count);
    }

    /**
     * 学生选课列表
     * @param page
     * @param limit
     * @param searchKey
     * @return
     */
    @RequestMapping("/teachChooseList")
    @RequiresPermissions("chooseLesson:view")
    public @ResponseBody
    ResultInfo<List> teachChooseList(Integer page, Integer limit, String searchKey){
        UserInfo userInfo=this.getUserInfo();
        Integer userId=userInfo.getId();
        int start=(page-1)*limit;
        int end =limit;
        int count = iChooseLessonService.selectTeachChooseDataCount(start,end,searchKey,userId);
        List list=iChooseLessonService.selectTeachChooseDataList(start,end,searchKey,userId);
        return new ResultInfo<>(list, count);
    }



    @RequestMapping("/add")
    @RequiresPermissions("chooseLesson:add")
    public @ResponseBody
    ResultInfo<Boolean> add(ChooseLesson chooseLesson){
        boolean b = iChooseLessonService.insert(chooseLesson);
        return new ResultInfo<>(b);
    }

    @RequestMapping("/delBatch")
    @RequiresPermissions("chooseLesson:del")
    public @ResponseBody
    ResultInfo<Boolean> delBatch(Integer[] idArr){
        boolean b = iChooseLessonService.deleteBatchIds(Arrays.asList(idArr));
        return new ResultInfo<>(b);
    }



    @RequestMapping("/chooseCourses")
    @ResponseBody
    public ResultInfo<Boolean> selectListData(Integer[] idArr){

        UserInfo userInfo=this.getUserInfo();
        Integer userId=userInfo.getId();
        boolean exist=false;
        if(idArr!=null && idArr.length>0){
            for (int i = 0; i < idArr.length; i++) {
                int count = iChooseLessonService.isChoose(idArr[i], userId);
                if(count!=0){
                    exist=true;
                    break;
                }
            }
        }
        if(exist){
            return new ResultInfo<>("300","已经有课被选择过了");
        }

        //判断余额是否足
        //1.查询课程总金额
        Double amount = iChooseLessonService.selectCourseAmount(Arrays.asList(idArr));

        Double userAmount=0.0;
        Double userRate=0.0;
        if(userInfo.getAmount()!=null){
            userAmount=userInfo.getAmount();
        }
        if(userInfo.getRate()!=null){
            userRate=userInfo.getRate();
        }

        Double finalAmount=amount*userRate;
        if(finalAmount.compareTo(userAmount)>0){
            return new ResultInfo<>("301","账户余额不足");
        }
        if(idArr!=null && idArr.length>0){
            for (int i = 0; i < idArr.length; i++) {
                ChooseLesson obj=new ChooseLesson();
                obj.setChooseUser(userId);
                obj.setLesScheId(idArr[i]);
                obj.setStatus("未审核");
                iChooseLessonService.insert(obj);
            }
        }

        //插入订单信息
        Payinfo payinfo=new Payinfo();
        payinfo.setStudentid(userId);
        payinfo.setPayamount(finalAmount);
        payinfo.setPaytime(new Date());
        payinfoService.insert(payinfo);

        //更新账户余额

        userService.updateUserAmountById(userId,userAmount-finalAmount);



        return new ResultInfo<>("200","选课成功");
    }


    @RequestMapping("/edit")
    @RequiresPermissions("chooseLesson:edit")
    public @ResponseBody
    ResultInfo<Boolean> edit(ChooseLesson chooseLesson){
        boolean b = iChooseLessonService.updateById(chooseLesson);
        return new ResultInfo<>(b);
    }



    @RequestMapping("/exchangeLesson")
    public @ResponseBody
    ResultInfo<Boolean> exchangeLesson(LessonSchedule lessonSchedule){

        Integer chooseId=lessonSchedule.getId();      //chooseId
        //行课计划id
        Integer scheduleId = iChooseLessonService.selectIdByChooseId(chooseId);

        Integer times=lessonSchedule.getTimeId();
        Integer weeks=lessonSchedule.getWeekId();

        Integer integer = iChooseLessonService.updateSchduleByTimeWeek(scheduleId, weeks, times);
        Boolean result=false;
        if(integer.compareTo(0)>0){
            result=true;
        }
        return new ResultInfo<>(result);
    }


}

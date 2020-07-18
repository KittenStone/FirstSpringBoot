package com.xieke.admin.service;

import com.baomidou.mybatisplus.service.IService;
import com.xieke.admin.entity.LeaveCourse;
import com.xieke.admin.entity.LeaveCourseBean;

import java.util.List;


/**
 * 课堂请假信息表 服务类
 */
public interface ILeaveCourseService extends IService<LeaveCourse> {

    int isLeaved(Integer chlsId,Integer userId);

    int selectCount(int start,int end,String searchKey);

    List<LeaveCourseBean> selectDataList(int start, int end, String searchKey);


    int selectStuCount(int start,int end,String searchKey,int userId);

    List<LeaveCourseBean> selectStuDataList(int start, int end, String searchKey,int userId);

    int selectTeachCount(int start,int end,String searchKey,int userId);

    List<LeaveCourseBean> selectTeachDataList(int start, int end, String searchKey,int userId);

}
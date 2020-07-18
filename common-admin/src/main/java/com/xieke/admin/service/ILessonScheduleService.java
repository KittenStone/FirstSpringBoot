package com.xieke.admin.service;

import com.baomidou.mybatisplus.service.IService;
import com.xieke.admin.entity.LessonSchedule;
import com.xieke.admin.entity.LessonScheduleBean;

import java.util.List;


/**
 * 教学班表 服务类
 */
public interface ILessonScheduleService extends IService<LessonSchedule> {

    int hasChoosed(LessonSchedule lessonSchedule);


    int selectCount(LessonSchedule lessonSchedule,String searchKey);


    List<LessonScheduleBean > listJoinData (LessonSchedule lessonSchedule,int start,int end,String searchKey);

}
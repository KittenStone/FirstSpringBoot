package com.xieke.admin.service.impl;



import com.xieke.admin.entity.LessonScheduleBean;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;


import com.xieke.admin.mapper.LessonScheduleMapper;
import com.xieke.admin.entity.LessonSchedule;
import com.xieke.admin.service.ILessonScheduleService;

import javax.annotation.Resource;
import java.util.List;


@Service
public class LessonScheduleServiceImpl extends ServiceImpl<LessonScheduleMapper, LessonSchedule> implements ILessonScheduleService {


    @Resource
    private LessonScheduleMapper lessonScheduleMapper;


    @Override
    public int hasChoosed(LessonSchedule lessonSchedule) {
        return lessonScheduleMapper.hasChoosed(lessonSchedule);
    }


    @Override
    public int selectCount(LessonSchedule lessonSchedule,String searchKey) {
        return lessonScheduleMapper.selectCount(lessonSchedule, searchKey);
    }

    @Override
    public List<LessonScheduleBean> listJoinData(LessonSchedule lessonSchedule, int start, int end,String searchKey) {
        return lessonScheduleMapper.listJoinData(lessonSchedule,start,end, searchKey);
    }
}
package com.xieke.admin.mapper;

import com.xieke.admin.entity.LessonSchedule;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.xieke.admin.entity.LessonScheduleBean;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 教学班表 Mapper 接口
 */
public interface LessonScheduleMapper extends BaseMapper<LessonSchedule> {


     int hasChoosed(LessonSchedule lessonSchedule);


     int selectCount(@Param("lessonSchedule") LessonSchedule lessonSchedule, @Param("searchKey") String searchKey);


     List<LessonScheduleBean> listJoinData(@Param("lessonSchedule") LessonSchedule lessonSchedule, @Param("start") int start, @Param("end") int end, @Param("searchKey") String searchKey);

}

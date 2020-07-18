package com.xieke.admin.mapper;

import com.xieke.admin.entity.LeaveCourse;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.xieke.admin.entity.LeaveCourseBean;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 课堂请假信息表 Mapper 接口
 */
public interface LeaveCourseMapper extends BaseMapper<LeaveCourse> {

    int isLeaved(@Param("chlsId") Integer chlsId, @Param("userId") Integer userId);


    int selectCount(@Param("start") int start, @Param("end") int end, @Param("searchKey") String searchKey);

    List<LeaveCourseBean> selectDataList(@Param("start") int start, @Param("end") int end, @Param("searchKey") String searchKey);


    int selectStuCount(@Param("start") int start, @Param("end") int end, @Param("searchKey") String searchKey, @Param("userId") int userId);

    List<LeaveCourseBean> selectStuDataList(@Param("start") int start, @Param("end") int end, @Param("searchKey") String searchKey, @Param("userId") int userId);

    int selectTeachCount(@Param("start") int start, @Param("end") int end, @Param("searchKey") String searchKey, @Param("userId") int userId);

    List<LeaveCourseBean> selectTeachDataList(@Param("start") int start, @Param("end") int end, @Param("searchKey") String searchKey, @Param("userId") int userId);

}

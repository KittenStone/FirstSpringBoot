package com.xieke.admin.mapper;

import com.xieke.admin.entity.ChooseLesson;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.xieke.admin.entity.ChooseLessonBean;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 选课信息表 Mapper 接口
 */
public interface ChooseLessonMapper extends BaseMapper<ChooseLesson> {

    int isChoose(@Param("lsId") int lsId, @Param("userId") int userId);


    Double selectCourseAmount(@Param("idList") List<Integer> idList);


    List<ChooseLessonBean> selectJoinListData(@Param("start") int start, @Param("end") int end, @Param("searchKey") String searchKey);


    int selectJoinCount(@Param("start") int start, @Param("end") int end, @Param("searchKey") String searchKey);


    List<ChooseLessonBean> selectStuChooseDataList(@Param("start") int start, @Param("end") int end, @Param("searchKey") String searchKey, @Param("userId") int userId);

    int selectStuChooseDataCount(@Param("start") int start, @Param("end") int end, @Param("searchKey") String searchKey, @Param("userId") int userId);


    List<ChooseLessonBean> selectTeachChooseDataList(@Param("start") int start, @Param("end") int end, @Param("searchKey") String searchKey, @Param("userId") int userId);

    int selectTeachChooseDataCount(@Param("start") int start, @Param("end") int end, @Param("searchKey") String searchKey, @Param("userId") int userId);


    Integer selectIdByChooseId(@Param("chooseId") Integer chooseId);

    Integer updateSchduleByTimeWeek(@Param("id") Integer id, @Param("weeks") Integer weeks, @Param("times") Integer times);

}

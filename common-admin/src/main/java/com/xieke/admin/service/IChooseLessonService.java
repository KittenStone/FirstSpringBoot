package com.xieke.admin.service;

import com.baomidou.mybatisplus.service.IService;
import com.xieke.admin.entity.ChooseLesson;
import com.xieke.admin.entity.ChooseLessonBean;

import java.io.Serializable;
import java.util.List;


/**
 * 选课信息表 服务类
 */
public interface IChooseLessonService extends IService<ChooseLesson> {


    int isChoose(int lsId,int userId);

    Double selectCourseAmount(List<Integer> idList);

    List<ChooseLessonBean> selectJoinListData(int start,int end,String searchKey);

    int selectJoinCount(int start,int end,String searchKey);


    List<ChooseLessonBean> selectStuChooseDataList(int start,int end,String searchKey,int userId);

    int selectStuChooseDataCount(int start,int end,String searchKey,int userId);


    List<ChooseLessonBean> selectTeachChooseDataList(int start,int end,String searchKey,int userId);

    int selectTeachChooseDataCount(int start,int end,String searchKey,int userId);

    Integer selectIdByChooseId(Integer chooseId);


    Integer updateSchduleByTimeWeek( Integer id,  Integer weeks, Integer times);


}
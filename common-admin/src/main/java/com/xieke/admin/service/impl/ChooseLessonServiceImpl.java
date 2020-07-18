package com.xieke.admin.service.impl;



import com.xieke.admin.entity.ChooseLessonBean;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;


import com.xieke.admin.mapper.ChooseLessonMapper;
import com.xieke.admin.entity.ChooseLesson;
import com.xieke.admin.service.IChooseLessonService;

import javax.annotation.Resource;
import java.util.List;


@Service
public class ChooseLessonServiceImpl extends ServiceImpl<ChooseLessonMapper, ChooseLesson> implements IChooseLessonService {


    @Resource
    private ChooseLessonMapper chooseLessonMapper;


    @Override
    public int isChoose(int lsId, int userId) {
        return chooseLessonMapper.isChoose(lsId,userId);
    }


    @Override
    public Double selectCourseAmount(List<Integer> idList) {
        return chooseLessonMapper.selectCourseAmount(idList);
    }

    @Override
    public List<ChooseLessonBean> selectJoinListData(int start, int end, String searchKey) {
        return chooseLessonMapper.selectJoinListData(start,end,searchKey);
    }

    @Override
    public int selectJoinCount(int start,int end,String searchKey){
        return chooseLessonMapper.selectJoinCount(start,end,searchKey);
    }


    @Override
    public List<ChooseLessonBean> selectStuChooseDataList(int start, int end, String searchKey,int userId) {
        return chooseLessonMapper.selectStuChooseDataList(start,end,searchKey,userId);
    }

    @Override
    public int selectStuChooseDataCount(int start, int end, String searchKey,int userId) {
        return chooseLessonMapper.selectStuChooseDataCount(start,end,searchKey,userId);
    }

    @Override
    public List<ChooseLessonBean> selectTeachChooseDataList(int start, int end, String searchKey,int userId) {
        return chooseLessonMapper.selectTeachChooseDataList(start,end,searchKey,userId);
    }

    @Override
    public int selectTeachChooseDataCount(int start, int end, String searchKey,int userId) {
        return chooseLessonMapper.selectTeachChooseDataCount(start,end,searchKey,userId);
    }

    @Override
    public Integer selectIdByChooseId(Integer chooseId) {
        return chooseLessonMapper.selectIdByChooseId(chooseId);
    }

    @Override
    public Integer updateSchduleByTimeWeek(Integer id, Integer weeks, Integer times) {
        return chooseLessonMapper.updateSchduleByTimeWeek(id,weeks,times);
    }
}
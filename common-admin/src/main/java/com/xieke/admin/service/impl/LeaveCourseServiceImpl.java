package com.xieke.admin.service.impl;



import com.xieke.admin.entity.LeaveCourseBean;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;


import com.xieke.admin.mapper.LeaveCourseMapper;
import com.xieke.admin.entity.LeaveCourse;
import com.xieke.admin.service.ILeaveCourseService;

import javax.annotation.Resource;
import java.util.List;


@Service
public class LeaveCourseServiceImpl extends ServiceImpl<LeaveCourseMapper, LeaveCourse> implements ILeaveCourseService {

    @Resource
    private LeaveCourseMapper leaveCourseMapper;

    @Override
    public int isLeaved(Integer chlsId, Integer userId) {
        return leaveCourseMapper.isLeaved(chlsId, userId);
    }


    @Override
    public int selectCount(int start, int end, String searchKey) {
        return leaveCourseMapper.selectCount(start,end,searchKey);
    }

    @Override
    public List<LeaveCourseBean> selectDataList(int start, int end, String searchKey) {
        return leaveCourseMapper.selectDataList(start,end,searchKey);
    }

    @Override
    public int selectStuCount(int start, int end, String searchKey, int userId) {
        return leaveCourseMapper.selectStuCount(start,end,searchKey,userId);
    }

    @Override
    public List<LeaveCourseBean> selectStuDataList(int start, int end, String searchKey, int userId) {
        return leaveCourseMapper.selectStuDataList(start,end,searchKey,userId);
    }

    @Override
    public int selectTeachCount(int start, int end, String searchKey, int userId) {
        return leaveCourseMapper.selectTeachCount(start,end,searchKey,userId);
    }

    @Override
    public List<LeaveCourseBean> selectTeachDataList(int start, int end, String searchKey, int userId) {
        return leaveCourseMapper.selectTeachDataList(start,end,searchKey,userId);
    }
}
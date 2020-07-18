package com.xieke.admin.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * 教学时间-节次
 */
@TableName("teach_time")
public class TeachTime extends Model<TeachTime> {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键id
	 */
	    @TableId(value="id", type= IdType.AUTO)
			private Integer id;
	/**
	 * 上课节次
	 */
	    @TableField("teach_num")
			private Integer teachNum;
	/**
	 * 开始时间
	 */
	    @TableField("start_time")
		private String startTime;
	/**
	 * 
	 */
	    @TableField("end_time")
		private String endTime;

	/**
	 * 设置：主键id
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * 获取：主键id
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * 设置：上课节次
	 */
	public void setTeachNum(Integer teachNum) {
		this.teachNum = teachNum;
	}
	/**
	 * 获取：上课节次
	 */
	public Integer getTeachNum() {
		return teachNum;
	}
	/**
	 * 设置：开始时间
	 */
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	/**
	 * 获取：开始时间
	 */
	public String getStartTime() {
		return startTime;
	}
	/**
	 * 设置：
	 */
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	/**
	 * 获取：
	 */
	public String getEndTime() {
		return endTime;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}
}
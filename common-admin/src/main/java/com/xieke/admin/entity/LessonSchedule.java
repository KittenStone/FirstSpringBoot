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
 * 教学班表
 */
@TableName("lesson_schedule")
public class LessonSchedule extends Model<LessonSchedule> {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键id
	 */
	    @TableId(value="id", type= IdType.AUTO)
			private Integer id;
	/**
	 * 课程id
	 */
	    @TableField("course_id")
			private Integer courseId;
	/**
	 * 上课周次id
	 */
	    @TableField("week_id")
			private Integer weekId;
	/**
	 * 时间id
	 */
	    @TableField("time_id")
			private Integer timeId;
	/**
	 * 备注
	 */
	    @TableField("comment")
			private String comment;
	/**
	 * 教师id
	 */
	    @TableField("teacher_id")
			private String teacherId;
	/**
	 * 状态
	 */
	    @TableField("status")
			private String status;

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
	 * 设置：课程id
	 */
	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}
	/**
	 * 获取：课程id
	 */
	public Integer getCourseId() {
		return courseId;
	}
	/**
	 * 设置：上课周次id
	 */
	public void setWeekId(Integer weekId) {
		this.weekId = weekId;
	}
	/**
	 * 获取：上课周次id
	 */
	public Integer getWeekId() {
		return weekId;
	}
	/**
	 * 设置：时间id
	 */
	public void setTimeId(Integer timeId) {
		this.timeId = timeId;
	}
	/**
	 * 获取：时间id
	 */
	public Integer getTimeId() {
		return timeId;
	}
	/**
	 * 设置：备注
	 */
	public void setComment(String comment) {
		this.comment = comment;
	}
	/**
	 * 获取：备注
	 */
	public String getComment() {
		return comment;
	}
	/**
	 * 设置：教师id
	 */
	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}
	/**
	 * 获取：教师id
	 */
	public String getTeacherId() {
		return teacherId;
	}
	/**
	 * 设置：状态
	 */
	public void setStatus(String status) {
		this.status = status;
	}
	/**
	 * 获取：状态
	 */
	public String getStatus() {
		return status;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}
}
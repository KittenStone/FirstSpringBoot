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
 * 课堂请假信息表
 */
@TableName("leave_course")
public class LeaveCourse extends Model<LeaveCourse> {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键id
	 */
	    @TableId(value="id", type= IdType.AUTO)
			private Integer id;
	/**
	 * 已选课id
	 */
	    @TableField("chls_id")
			private Integer chlsId;
	/**
	 * 请假人id
	 */
	    @TableField("levea_user")
			private Integer leveaUser;
	/**
	 * 请假事由
	 */
	    @TableField("comment")
			private String comment;

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
	 * 设置：已选课id
	 */
	public void setChlsId(Integer chlsId) {
		this.chlsId = chlsId;
	}
	/**
	 * 获取：已选课id
	 */
	public Integer getChlsId() {
		return chlsId;
	}
	/**
	 * 设置：请假人id
	 */
	public void setLeveaUser(Integer leveaUser) {
		this.leveaUser = leveaUser;
	}
	/**
	 * 获取：请假人id
	 */
	public Integer getLeveaUser() {
		return leveaUser;
	}
	/**
	 * 设置：请假事由
	 */
	public void setComment(String comment) {
		this.comment = comment;
	}
	/**
	 * 获取：请假事由
	 */
	public String getComment() {
		return comment;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}
}
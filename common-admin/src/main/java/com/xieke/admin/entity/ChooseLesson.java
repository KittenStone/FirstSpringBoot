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
 * 选课信息表
 */
@TableName("choose_lesson")
public class ChooseLesson extends Model<ChooseLesson> {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键id
	 */
	    @TableId(value="id", type= IdType.AUTO)
			private Integer id;
	/**
	 * 课程表id
	 */
	    @TableField("les_sche_id")
			private Integer lesScheId;
	/**
	 * 选课人id
	 */
	    @TableField("choose_user")
			private Integer chooseUser;
	/**
	 * 备注
	 */
	    @TableField("comment")
			private String comment;
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
	 * 设置：课程表id
	 */
	public void setLesScheId(Integer lesScheId) {
		this.lesScheId = lesScheId;
	}
	/**
	 * 获取：课程表id
	 */
	public Integer getLesScheId() {
		return lesScheId;
	}
	/**
	 * 设置：选课人id
	 */
	public void setChooseUser(Integer chooseUser) {
		this.chooseUser = chooseUser;
	}
	/**
	 * 获取：选课人id
	 */
	public Integer getChooseUser() {
		return chooseUser;
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
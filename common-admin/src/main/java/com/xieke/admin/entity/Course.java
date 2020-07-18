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
 * 课程表
 */
@TableName("course")
public class Course extends Model<Course> {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键id
	 */
	    @TableId(value="CID", type= IdType.AUTO)
			private Integer cid;
	/**
	 * 课程名称
	 */
	    @TableField("CName")
			private String cname;
	/**
	 * 学科名称
	 */
	    @TableField("SubID")
			private String subid;
	/**
	 * 节次号
	 */
	    @TableField("LessonNum")
			private Integer lessonnum;
	/**
	 * 价格
	 */
	    @TableField("Price")
			private Integer price;
	/**
	 * 备注
	 */
	    @TableField("Comment")
			private String comment;

	/**
	 * 设置：主键id
	 */
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	/**
	 * 获取：主键id
	 */
	public Integer getCid() {
		return cid;
	}
	/**
	 * 设置：课程名称
	 */
	public void setCname(String cname) {
		this.cname = cname;
	}
	/**
	 * 获取：课程名称
	 */
	public String getCname() {
		return cname;
	}
	/**
	 * 设置：学科名称
	 */
	public void setSubid(String subid) {
		this.subid = subid;
	}
	/**
	 * 获取：学科名称
	 */
	public String getSubid() {
		return subid;
	}
	/**
	 * 设置：节次号
	 */
	public void setLessonnum(Integer lessonnum) {
		this.lessonnum = lessonnum;
	}
	/**
	 * 获取：节次号
	 */
	public Integer getLessonnum() {
		return lessonnum;
	}
	/**
	 * 设置：价格
	 */
	public void setPrice(Integer price) {
		this.price = price;
	}
	/**
	 * 获取：价格
	 */
	public Integer getPrice() {
		return price;
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


	@Override
	protected Serializable pkVal() {
		return this.cid;
	}
}
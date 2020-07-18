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
 * 教学时间-周次
 */
@TableName("teach_week")
public class TeachWeek extends Model<TeachWeek> {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键id
	 */
	    @TableId(value="id", type= IdType.AUTO)
			private Integer id;
	/**
	 * 
	 */
	    @TableField("weeks")
			private Integer weeks;

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
	 * 设置：
	 */
	public void setWeeks(Integer weeks) {
		this.weeks = weeks;
	}
	/**
	 * 获取：
	 */
	public Integer getWeeks() {
		return weeks;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}
}
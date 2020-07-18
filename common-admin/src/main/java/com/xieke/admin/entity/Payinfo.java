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
 * 订单信息
 */
@TableName("payinfo")
public class Payinfo extends Model<Payinfo> {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键id
	 */
	    @TableId(value="id", type= IdType.AUTO)
			private Integer id;
	/**
	 * 学生id
	 */
	    @TableField("StudentId")
			private Integer studentid;


	/**
	 * 支付金额
	 */
	    @TableField("PayAmount")
			private Double payamount;

	/**
	 * 支付时间
	 */
	    @TableField("PayTime")
		    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
		private Date paytime;


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
	 * 设置：学生id
	 */
	public void setStudentid(Integer studentid) {
		this.studentid = studentid;
	}
	/**
	 * 获取：学生id
	 */
	public Integer getStudentid() {
		return studentid;
	}

	/**
	 * 设置：支付金额
	 */
	public void setPayamount(Double payamount) {
		this.payamount = payamount;
	}
	/**
	 * 获取：支付金额
	 */
	public Double getPayamount() {
		return payamount;
	}

	/**
	 * 设置：支付时间
	 */
	public void setPaytime(Date paytime) {
		this.paytime = paytime;
	}
	/**
	 * 获取：支付时间
	 */
	public Date getPaytime() {
		return paytime;
	}


	@Override
	protected Serializable pkVal() {
		return this.id;
	}
}
package com.bean;

import java.sql.Timestamp;
import java.util.Date;

/**
 * Canjia entity. @author MyEclipse Persistence Tools
 */

public class Canjia implements java.io.Serializable {

	// Fields

	private Integer id;
	private String userid;
	private String activeid;
	private String avtivename;
	private Date time;

	// Constructors

	/** default constructor */
	public Canjia() {
	}

	/** full constructor */
	public Canjia(Integer id, String userid, String activeid,
			String avtivename, Date time) {
		this.id = id;
		this.userid = userid;
		this.activeid = activeid;
		this.avtivename = avtivename;
		this.time = time;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserid() {
		return this.userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getActiveid() {
		return this.activeid;
	}

	public void setActiveid(String activeid) {
		this.activeid = activeid;
	}

	public String getAvtivename() {
		return this.avtivename;
	}

	public void setAvtivename(String avtivename) {
		this.avtivename = avtivename;
	}

	public Date getTime() {
		return this.time;
	}

	public void setTime(Date date) {
		this.time = date;
	}

}
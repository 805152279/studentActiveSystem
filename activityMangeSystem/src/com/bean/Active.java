package com.bean;

import java.util.Date;

/**
 * Active entity. @author MyEclipse Persistence Tools
 */

public class Active implements java.io.Serializable {

	// Fields

	private String activeid;
	private String activename;
	private String userid;
	private String roomid;
	private String number;
	private String abstract_;
	private Date starttime;
	private Date endtime;
	private Integer isdeleted;

	// Constructors

	/** default constructor */
	public Active() {
	}

	/** minimal constructor */
	public Active(String activeid, String activename, String userid,
			Integer isdeleted) {
		this.activeid = activeid;
		this.activename = activename;
		this.userid = userid;
		this.isdeleted = isdeleted;
	}

	/** full constructor */
	public Active(String activeid, String activename, String userid,
			String roomid, String number, String abstract_, Date starttime,
			Date endtime, Integer isdeleted) {
		this.activeid = activeid;
		this.activename = activename;
		this.userid = userid;
		this.roomid = roomid;
		this.number = number;
		this.abstract_ = abstract_;
		this.starttime = starttime;
		this.endtime = endtime;
		this.isdeleted = isdeleted;
	}

	// Property accessors

	public String getActiveid() {
		return this.activeid;
	}

	public void setActiveid(String activeid) {
		this.activeid = activeid;
	}

	public String getActivename() {
		return this.activename;
	}

	public void setActivename(String activename) {
		this.activename = activename;
	}

	public String getUserid() {
		return this.userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getRoomid() {
		return this.roomid;
	}

	public void setRoomid(String roomid) {
		this.roomid = roomid;
	}

	public String getNumber() {
		return this.number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getAbstract_() {
		return this.abstract_;
	}

	public void setAbstract_(String abstract_) {
		this.abstract_ = abstract_;
	}

	public Date getStarttime() {
		return this.starttime;
	}

	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}

	public Date getEndtime() {
		return this.endtime;
	}

	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}

	public Integer getIsdeleted() {
		return this.isdeleted;
	}

	public void setIsdeleted(Integer isdeleted) {
		this.isdeleted = isdeleted;
	}

}
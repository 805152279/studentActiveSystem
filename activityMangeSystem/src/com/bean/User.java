package com.bean;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields

	private String userid;
	private String username;
	private String userpassword;
	private Integer userlevel;
	private Integer votenum;
	private Integer isdeleted;

	// Constructors

	/** default constructor */
	public User() {
	}

	/** full constructor */
	public User(String userid, String username, String userpassword,
			Integer userlevel, Integer votenum, Integer isdeleted) {
		this.userid = userid;
		this.username = username;
		this.userpassword = userpassword;
		this.userlevel = userlevel;
		this.votenum = votenum;
		this.isdeleted = isdeleted;
	}

	// Property accessors

	public String getUserid() {
		return this.userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserpassword() {
		return this.userpassword;
	}

	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}

	public Integer getUserlevel() {
		return this.userlevel;
	}

	public void setUserlevel(Integer userlevel) {
		this.userlevel = userlevel;
	}

	public Integer getVotenum() {
		return this.votenum;
	}

	public void setVotenum(Integer votenum) {
		this.votenum = votenum;
	}

	public Integer getIsdeleted() {
		return this.isdeleted;
	}

	public void setIsdeleted(Integer isdeleted) {
		this.isdeleted = isdeleted;
	}

}
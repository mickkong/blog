package com.mickkong.pojo;

import java.sql.Timestamp;

public class Comment {
	private int cid;
	private int aid;
	private User user;
	private String content;
	private Timestamp time;
	
	public Comment() {
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int id) {
		this.cid = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}
	
}

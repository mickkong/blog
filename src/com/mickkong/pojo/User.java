package com.mickkong.pojo;

import java.sql.Timestamp;

/**
 * 用户实体类
 * 
 * @author mickkong
 *
 */
public class User {
	private String uid;
	private String username;
	private String password;
	private String phone;
	private String email;
	private Timestamp last_login_time;

	public User() {
	}
	
	public User(String username, String password, String phone, String email) {
		super();
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.email = email;
	}

	public User(String username, String password, String phone, String email,Timestamp lastLoginTime) {
		super();
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.email = email;
		this.last_login_time = lastLoginTime;
	}

	public User(String uid, String username, String password, String phone, String email,Timestamp lastLoginTime) {
		super();
		this.uid = uid;
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.email = email;
		this.last_login_time = lastLoginTime;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public Timestamp getLastLoginTime() {
		return last_login_time;
	}

	public void setLastLoginTime(Timestamp lastLoginTime) {
		this.last_login_time = lastLoginTime;
	}

	@Override
	public String toString() {
		return "User [uid=" + uid + ", username=" + username + ", password=" + password + ", phone=" + phone
				+ ", email=" + email + "]";
	}

}

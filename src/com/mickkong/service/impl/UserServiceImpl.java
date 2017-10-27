package com.mickkong.service.impl;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mickkong.dao.UserDao;
import com.mickkong.pojo.User;
import com.mickkong.service.UserService;

import sun.misc.BASE64Encoder;

@Service
public class UserServiceImpl implements UserService {

	/**
	 * 成功
	 */
	public static final int SUCCESS = 1;
	/**
	 * 密码错误
	 */
	public static final int PWDERROR = 2;
	/**
	 * 用户不存在
	 */
	public static final int NONEXIST = 3;
	/**
	 * 用户已注册
	 */
	public static final int REGISTERED = 4;
	/**
	 * 信息不匹配
	 */
	public static final int UNMISMATCH = 5;

	@Autowired
	private UserDao userDao;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	/**
	 * 利用MD5进行加密
	 * 
	 * @param str
	 * @return encoderStr
	 */
	private String EncoderByMd5(String str) {
		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			BASE64Encoder base64en = new BASE64Encoder();
			String encoderStr = base64en.encode(md5.digest(str.getBytes("utf-8")));
			return encoderStr;
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int login(String username, String password) {
		User user = userDao.findByUsername(username);
		if (user != null) {
			if (user.getPassword().equals(EncoderByMd5(password))) {
				return SUCCESS;
			}
			return PWDERROR;
		}
		return NONEXIST;
	}

	@Override
	public int register(User user) {
		if (userDao.findByUsername(user.getUsername()) != null) {
			return REGISTERED;
		}
		user.setUid(UUID.randomUUID().toString().replaceAll("-", ""));
		user.setPassword(EncoderByMd5(user.getPassword()));
		System.out.println(user);
		userDao.insert(user);
		return SUCCESS;
	}

	@Override
	public int findPwd(User user) {
		User obj = userDao.findByUsername(user.getUsername());
		if (obj != null) {
			if (obj.getPhone().equals(user.getPhone()) && obj.getEmail().equals(user.getEmail())) {
				user.setPassword(EncoderByMd5(user.getPassword()));
				userDao.update(user);
				return SUCCESS;
			}
			return UNMISMATCH;
		}
		return NONEXIST;
	}
	
	@Override
	public int update(User user) {
		return userDao.update(user);
	}


	@Override
	public User findById(String uid) {
		return userDao.findByUid(uid);
	}

	@Override
	public User findByUsername(String username) {
		return userDao.findByUsername(username);
	}

}

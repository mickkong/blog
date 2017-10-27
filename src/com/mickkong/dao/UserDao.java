package com.mickkong.dao;

import com.mickkong.pojo.User;

/**
 * 用户数据处理接口
 * 
 * @author mickkong
 *
 */
public interface UserDao {
	int insert(User user);

	int delete(String uid);

	int update(User user);

	User findByUid(String uid);

	User findByUsername(String username);
}

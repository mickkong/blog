package com.mickkong.dao;
import java.util.List;

import com.mickkong.pojo.Comment;

public interface CommentDao {
	
	int delete(int id);

    int insert(Comment comment);

    Comment findById(int id);
    
    List<Comment> findAll(int aid);
}
package com.mickkong.service;
import java.util.List;

import com.mickkong.pojo.Comment;

public interface CommentService {
	
	String delete(int id);

    String insert(Comment comment);

    Comment findById(int id);
    
    List<Comment> findAll(int aid);
}
package com.mickkong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mickkong.dao.CommentDao;
import com.mickkong.pojo.Comment;
import com.mickkong.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService {
	
	@Autowired
	private CommentDao commentDao;
	
	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}

	@Override
	public String delete(int id) {
		if(commentDao.delete(id) == 1) {
			return "success";
		}
		return "failed";
	}

	@Override
	public String insert(Comment comment) {
		if(commentDao.insert(comment) == 1) {
			return "success";
		}
		return "failed";
	}

	@Override
	public Comment findById(int id) {
		return commentDao.findById(id);
	}

	@Override
	public List<Comment> findAll(int aid) {
		return commentDao.findAll(aid);
	}
}

package com.mickkong.controller;

import java.sql.Timestamp;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import com.mickkong.pojo.Comment;
import com.mickkong.pojo.User;
import com.mickkong.service.impl.CommentServiceImpl;

@Controller
@RequestMapping("/comment")
public class CommentController {

	@Autowired
	private CommentServiceImpl commentService;
	
	public void setCommentService(CommentServiceImpl commentService) {
		this.commentService = commentService;
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String add(HttpServletRequest request,String aid,String content) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Timestamp time = new Timestamp(new Date().getTime());
		Comment comment = new Comment();
		comment.setAid(Integer.parseInt(aid));
		comment.setUser(user);
		comment.setContent(content);
		comment.setTime(time);
		String result = commentService.insert(comment);
		return result;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String delete(String id) {
		String result = commentService.delete(Integer.parseInt(id));
		return result;
	}

	@RequestMapping(value = "/getList", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getList(String aid) {
		Gson gson = new Gson();
		String data = gson.toJson(commentService.findAll(Integer.parseInt(aid)));
		return data;
	}
}

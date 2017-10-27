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
import org.springframework.web.servlet.ModelAndView;
import com.google.gson.Gson;
import com.mickkong.pojo.Article;
import com.mickkong.pojo.User;
import com.mickkong.service.impl.ArticleServiceImpl;

@Controller
@RequestMapping("/article")
public class ArticleController {

	@Autowired
	private ArticleServiceImpl articleServiceImpl;

	public void setArticleService(ArticleServiceImpl articleServiceImpl) {
		this.articleServiceImpl = articleServiceImpl;
	}

	@RequestMapping(value = "/publish", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public ModelAndView add(HttpServletRequest request, String title, String content) {
		ModelAndView view = new ModelAndView("article");
		HttpSession session = request.getSession();
		Timestamp time = new Timestamp(new Date().getTime());
		Article article = new Article();
		User user = (User) session.getAttribute("user");
		article.setAuthor(user);
		article.setTitle(title);
		article.setContent(content);
		article.setCreatetime(time);
		article.setUpdatetime(time);
		article.setReadcount(0);
		String result = articleServiceImpl.insert(article);
		if (result.equals("success")) {
			view.addObject("msg", "发布成功！");
		} else {
			view.addObject("msg", "发布失败");
		}
		return view;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String delete(String id) {
		String result = articleServiceImpl.delete(Integer.parseInt(id));
		return result;
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public ModelAndView update(HttpServletRequest request, String id, String title, String content) {
		ModelAndView view = new ModelAndView("article");
		Article article = articleServiceImpl.findById(Integer.parseInt(id));
		article.setTitle(title);
		article.setContent(content);
		if(articleServiceImpl.update(article).equals("success")) {
			view.addObject("msg", "更新成功！");
		}
		view.addObject("msg", "更新失败！");
		return view;
	}

	@RequestMapping(value = "/findAll", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String findAll() {
		Gson gson = new Gson();
		String data = gson.toJson(articleServiceImpl.findAll());
		return data;
	}

	@RequestMapping(value = "/findByName", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String findByName(String title) {
		Gson gson = new Gson();
		String data = gson.toJson(articleServiceImpl.findByName(title));
		return data;
	}

	@RequestMapping(value = "/findByUid", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String findByUid(String uid) {
		Gson gson = new Gson();
		String data = gson.toJson(articleServiceImpl.findByUid(uid));
		return data;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
	public ModelAndView edit(int aid) {
		ModelAndView view = new ModelAndView("articleEdit");
		view.addObject("article", articleServiceImpl.findById(aid));
		return view;
	}
	
	@RequestMapping(value = "/view", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
	public ModelAndView view(int aid) {
		ModelAndView view = new ModelAndView("articleDetail");
		Article article = articleServiceImpl.findById(aid);
		article.setReadcount(article.getReadcount() + 1);
		articleServiceImpl.update(article);
		view.addObject("article", article);
		return view;
	}

}

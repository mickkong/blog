package com.mickkong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mickkong.service.ArticleService;
import com.mickkong.dao.ArticleDao;
import com.mickkong.pojo.Article;

@Service
public class ArticleServiceImpl implements ArticleService {
	
	@Autowired
	private ArticleDao articleDao;
	
	public void setArticleDao(ArticleDao articleDao) {
		this.articleDao = articleDao;
	}

	@Override
	public String delete(int id) {
		if(articleDao.delete(id) == 1) {
			return "success";
		}
		return "failed";
	}

	@Override
	public String insert(Article article) {
		if(articleDao.insert(article) == 1) {
			return "success";
		}
		return "failed";
	}
	
	@Override
	public String update(Article article) {
		if(articleDao.update(article) == 1) {
			return "success";
		}
		return "failed";
	}

	@Override
	public Article findById(int id) {
		return articleDao.findById(id);
	}

	@Override
	public List<Article> findByName(String name) {
		return articleDao.findByName(name);
	}

	@Override
	public List<Article> findAll() {
		return articleDao.findAll();
	}

	@Override
	public List<Article> findByUid(String uid) {
		return articleDao.findByUid(uid);
	}

}

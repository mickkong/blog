package com.mickkong.service;

import java.util.List;

import com.mickkong.pojo.Article;

public interface ArticleService {
	String delete(int id);

	String insert(Article article);

	Article findById(int id);

	String update(Article article);

	List<Article> findAll();

	List<Article> findByName(String name);

	List<Article> findByUid(String uid);
}
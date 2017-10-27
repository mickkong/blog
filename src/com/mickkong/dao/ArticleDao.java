package com.mickkong.dao;
import java.util.List;

import com.mickkong.pojo.Article;

public interface ArticleDao {
	int delete(int id);

    int insert(Article article);

    Article findById(int id);
    
    List<Article> findByName(String name);

    int update(Article article);
    
    List<Article> findAll();
    
    List<Article> findByUid(String uid);
}
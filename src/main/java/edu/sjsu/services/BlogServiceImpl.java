package edu.sjsu.services;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import edu.sjsu.models.Blog;
import edu.sjsu.models.BlogDao;

public class BlogServiceImpl implements BlogService {

	@Autowired
	BlogDao blogDao;

	@Override
	public Blog create(Blog blog) {
		blogDao.save(blog);
		return blog;
	}

	@Override
	public Blog findBlogById(long id) {
		Blog blog = blogDao.findOne(id);
		return blog;
	}

	@Override
	public ArrayList<Blog> blogsUploadedByUserId(long userid) {
		ArrayList<Blog> blogs = blogDao.blogsUploadedByUserId(userid);
		return blogs;
	}

	@Override
	public ArrayList<Blog> getLatestBlogs() {
		ArrayList<Blog> latestBlog = blogDao.getLatestBlogs();
		return latestBlog;
	}

}

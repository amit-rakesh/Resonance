package edu.sjsu.services;

import java.util.ArrayList;

import edu.sjsu.models.Blog;

public interface BlogService {
	
	public Blog create(Blog blog);
	public Blog findBlogById(long id);
	public ArrayList<Blog> blogsUploadedByUserId(long userid);
	public ArrayList<Blog> getLatestBlogs();

}

package edu.sjsu.controllers;

import java.util.ArrayList;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.sjsu.models.Blog;
import edu.sjsu.services.BlogService;

@Controller
// @EnableAutoConfiguration
@ComponentScan
@Component("BlogController")
@RequestMapping("/blog")
public class BlogController {

	@Autowired
	BlogService blogService;

	@RequestMapping(method = RequestMethod.GET)
	public String getBlog(@ModelAttribute("blog") Blog blog, BindingResult result, Model model,
			HttpServletRequest request, HttpServlet response) {
		ArrayList<Blog> latestBlog = blogService.getLatestBlogs();
		model.addAttribute(latestBlog);
		return "blog";
	}

	@RequestMapping(value = "/{userid}", method = RequestMethod.GET)
	public String getBlogByUser(@PathVariable("userid") long userid, BindingResult result, HttpServletRequest request,
			HttpServlet response, Model model) {
		ArrayList<Blog> blog = blogService.blogsUploadedByUserId(userid);
		model.addAttribute(blog);
		return null;
	}
}

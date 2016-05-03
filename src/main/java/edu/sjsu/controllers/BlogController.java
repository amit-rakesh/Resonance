package edu.sjsu.controllers;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

import edu.sjsu.helpers.CookieManager;
import edu.sjsu.models.Blog;
import edu.sjsu.models.User;
import edu.sjsu.services.BlogService;

@Controller
// @EnableAutoConfiguration
@ComponentScan
@Component("BlogController")
@RequestMapping("/blog")
public class BlogController {

	@Autowired
	BlogService blogService;
	
	@Autowired
	CookieManager cookieManger;

	@RequestMapping(method = RequestMethod.GET)
	public String getBlog(@ModelAttribute("blog") Blog blog, BindingResult result, Model model,
			HttpServletRequest request, HttpServletResponse response) {
		ArrayList<Blog> latestBlog = blogService.getLatestBlogs();
		model.addAttribute(latestBlog);
		return "blog";
	}

	@RequestMapping(value = "/{userid}", method = RequestMethod.GET)
	public String getBlogByUser(@PathVariable(value = "userid") long userid, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		ArrayList<Blog> blog = blogService.blogsUploadedByUserId(userid);
		for(Blog b : blog){
			System.out.println("" + b.getBlogTitle() + "....." + b.getUploadedByUserId() + "..." + b.getBlogContent()+ "..." + b.getDate()+ "..." + b.getDate().toString());
		}
		model.addAttribute("blog", blog);
		return "blog";
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String getCreateBlog(@ModelAttribute("blog") Blog blog, BindingResult result, HttpServletRequest request,
			HttpServletResponse response, Model model, Locale locale) {
		
		model.addAttribute("blog", new Blog());
		return "uploadBlog";
		
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String createBlog(@ModelAttribute("blog") Blog blog, BindingResult result, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		User user = cookieManger.getCurrentUser();
		//long unixTime = System.currentTimeMillis() / 1000L;
		//System.out.println(unixTime);
		Blog blogOb;
		blogOb = new Blog(blog.getBlogTitle(), user.getUserid(), Calendar.getInstance().getTime(), blog.getBlogContent());
		System.out.println("in create -->" + Calendar.getInstance().getTime() + "..." + Calendar.getInstance().getTime().toString());
		blogService.create(blogOb);
		return "redirect:/blog/" + user.getUserid();
	}
}

package edu.sjsu.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.NoSuchRequestHandlingMethodException;
import org.springframework.web.servlet.mvc.support.DefaultHandlerExceptionResolver;

import edu.sjsu.exceptions.ResourceNotFoundException;
import edu.sjsu.helpers.BadRequestException;
import edu.sjsu.models.User;

@ControllerAdvice
public class ExceptionHandlerController{

	@ExceptionHandler(BadRequestException.class)
	public String handleBadRequestException(Throwable th, Model model) {

		String error = th.getMessage();
		model.addAttribute("error", error);
		model.addAttribute(new User());
		return "Login1";
	}
	
	@ExceptionHandler(NoSuchRequestHandlingMethodException.class)
	public String handleNoSuchMethodtFoundException(NoSuchRequestHandlingMethodException ex){
		return "error/notfound";
	}
	
	@ExceptionHandler(ResourceNotFoundException.class)
	public String handleResourceNotFoundException(ResourceNotFoundException ex){
		return "error/notfound";
	}

}

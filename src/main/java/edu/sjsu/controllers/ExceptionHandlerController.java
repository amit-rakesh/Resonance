package edu.sjsu.controllers;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import edu.sjsu.helpers.BadRequestException;
import edu.sjsu.models.User;

@ControllerAdvice
public class ExceptionHandlerController {

	@ExceptionHandler(BadRequestException.class)
	public String handleBadRequestException(Model model) {

		String error = "Please verify username or password";
		model.addAttribute("error", error);
		model.addAttribute(new User());
		return "login";
	}

}

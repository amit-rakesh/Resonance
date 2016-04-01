package edu.sjsu.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import edu.sjsu.models.User;
import edu.sjsu.services.UserService;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

@RestController
@ComponentScan
@Component("UserController")
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/signup", method = RequestMethod.POST, produces = "application/json")
	public void createUser(@Valid @RequestBody User user, BindingResult result, HttpServletResponse response) {

		System.out.println("Name : " + user.getName());

		User userob = null;

		try {
			userob = new User(user.getName(), user.getEmail(), "", user.getCountry(), user.getState(), "", false);

		} catch (Exception e) {

			System.out.println("Exception");

		}

		userService.create(userob);

	}
}

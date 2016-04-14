package edu.sjsu.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import edu.sjsu.helpers.BadRequestException;
import edu.sjsu.helpers.CookieManager;
import edu.sjsu.helpers.EmailNotification;
import edu.sjsu.helpers.Utility;
import edu.sjsu.models.Song;
import edu.sjsu.models.User;
import edu.sjsu.services.UserService;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

@Controller
@ComponentScan
@Component("UserController")
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private CookieManager cookieManager;

	@Autowired
	private UserService userService;

	@Autowired
	EmailNotification emailNotification;

	@RequestMapping(value = "/signup", method = RequestMethod.POST, produces = "application/json")
	public ModelAndView createUser(@Valid @ModelAttribute("user") User user, BindingResult result,
			HttpServletResponse response) {

		System.out.println("In controller");
		System.out.println("Name : " + user.getName());

		User userob = null;

		// this call validated that email is not already in use
		userService.isEmailAvailable(user.getEmail());

		String tokenString = Utility.verificationTokenGenerator(user.getEmail());
		String encryptPass = Utility.passwordEncrypter(user.getPassword());

		try {
			userob = new User(user.getName(), user.getEmail(), encryptPass, user.getCountry(), user.getState(),
					tokenString, false, null);

		} catch (Exception e) {

			System.out.println("Exception");

		}

		userService.create(userob);
		emailNotification.sendEmailonSignUp(user.getEmail(), user.getName(), tokenString);
		userob.setPassword(null);
		userob.setToken(null);
		// return new ResponseEntity<User>(userob, HttpStatus.CREATED);
		return new ModelAndView("login");
	}

	@RequestMapping(value = "/verify/{email}/{token}", method = RequestMethod.GET, produces = "application/json")
	public String verifyUser(@PathVariable(value = "email") String email, @PathVariable(value = "token") String token) {

		User user = userService.getUserByEmail(email);
		System.out.println("Email: " + email);
		System.out.println("Email: " + user.getEmail());
		if (user.getToken().equals(token)) {
			user.setVerified(true);
			userService.create(user);
			user.setPassword(null);
			user.setToken(null);
			return "Email Account verified";
		} else {
			throw new BadRequestException("Incorrect user");
		}
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String validateUser(@Valid @ModelAttribute("user") User tmpUser, BindingResult result,
			HttpServletResponse response, Model model) {

		System.out.println("Email : " + tmpUser.getEmail());
		User user = userService.getUserByEmail(tmpUser.getEmail());
		String savedPass = user.getPassword();
		String enteredPass = Utility.passwordEncrypter(tmpUser.getPassword());

		if (!user.isVerified()) {

			throw new BadRequestException("Please verify your email address");
		}

		// compare given password with the actual password
		if (savedPass != null) {
			if (savedPass.equals(enteredPass)) {

				// generate a session id
				Integer sessionToken = Utility.sessionTokenGenerator();

				user.setSessionid(sessionToken.longValue());

				// update the user with sessionid
				User userWithSession = userService.create(user);

				if (userWithSession != null) {
					userWithSession.setPassword(null);
					userWithSession.setToken(null);
					Cookie cookie1 = new Cookie("resonance", userWithSession.toString());
					cookie1.setMaxAge(30000); // 8.5 hrs expiry
					cookie1.setPath("/");
					response.addCookie(cookie1);
				}
				user.setPassword(null);
				return "redirect:/user/" + userWithSession.getUserid();
			} else {
				throw new BadRequestException("Incorrect Password");
			}
		} else {
			throw new BadRequestException("User not found.");
		}

	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String showUserDashboard(@PathVariable long id, Model model) {
		User user = userService.findUserById(id);
		model.addAttribute(user);
		model.addAttribute(new Song());
		return "dashboard";

	}

	/******** Logout ********/

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	// @ResponseBody
	private String logout(HttpServletRequest request, HttpServletResponse response) {
		Cookie cookie1 = new Cookie("resonance", null);
		cookie1.setPath("/");
		cookie1.setMaxAge(0);
		response.addCookie(cookie1);
		return "home";
	}

	/*********** edit profile **********/

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public void uploadPicture(@ModelAttribute("user") User user, BindingResult result, HttpServletRequest request,
			@RequestParam("file") MultipartFile file,	HttpServletResponse response) {
		System.out.println(user.getUserid() +"------"+ user.getName());
		//long id  = user.getUserid();
		
		User userOb = cookieManager.getCurrentUser();
		try {
			userOb.setUserPicture(file.getBytes());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		userService.create(userOb);
		
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String showUploadForm(Model model){
		model.addAttribute(new User());
		return "upload";
	}
	

}

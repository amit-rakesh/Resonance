package edu.sjsu.helpers;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import edu.sjsu.models.User;
import edu.sjsu.services.UserService;
import edu.sjsu.services.UserServiceImpl;

@Component
public class CookieManager {

	private User userOb;

	@Autowired
	private UserService userService;

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private HttpServletResponse response;

	private Cookie[] cookies;

	public CookieManager() {

	}

	ObjectMapper mapper = new ObjectMapper();

	long userid = 0L;

	public User getCurrentUser(){

		cookies = request.getCookies();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				System.out.println(" key: " + cookies[i].getName() + ", value: " + cookies[i].getValue());
				if (cookies[i].getName().equals("resonance")) {
					User cookieUserObj = null;
					try {
						cookieUserObj = mapper.readValue(cookies[i].getValue(), User.class);
					} catch (JsonParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (JsonMappingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

					if (cookieUserObj != null) {
						userid = cookieUserObj.getUserid();
					}

					System.out.println("userid: " + userid);
				}
			}
		}
		userOb = userService.findUserById(userid);
		return userOb;
	}
}

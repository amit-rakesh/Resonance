package edu.sjsu.controllers;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import edu.sjsu.helpers.CookieManager;
import edu.sjsu.models.User;
import edu.sjsu.services.UserService;

@Controller
@ComponentScan
@Component("ImageController")
@RequestMapping("/image")
public class ImageController {
	
	@Autowired
	private CookieManager cookieManager;

	@RequestMapping(method = RequestMethod.GET)
	public String getImage(HttpServletRequest request, HttpServletResponse response, Model model) {
		User userOb = cookieManager.getCurrentUser();
		byte[] userImage = userOb.getUserPicture();

		byte[] encodeBase64 = Base64.encodeBase64(userImage);
		String base64Encoded = "";
		try {
			base64Encoded = new String(encodeBase64, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("userimage", base64Encoded);
		return "image";
	}
}

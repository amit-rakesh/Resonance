package edu.sjsu.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import edu.sjsu.models.User;
import edu.sjsu.models.UserDao;

public class LoginInterceptor implements HandlerInterceptor {

	@Autowired
	UserDao userDao;

	@Override
	public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o)
			throws Exception {
		Cookie[] cookies = httpServletRequest.getCookies();
		boolean loggedin = false;
		ObjectMapper mapper = new ObjectMapper();
		int i;
		long userid = 0L;
		long sessionid = 0L;
		if (cookies != null) {
			for (i = 0; i < cookies.length; i++) {
				System.out.println(" key: " + cookies[i].getName() + ", value: " + cookies[i].getValue());
				if (cookies[i].getName().equals("tagit")) {
					User cookieUserObj = mapper.readValue(cookies[i].getValue(), User.class);

					userid = cookieUserObj.getUserid();
					sessionid = cookieUserObj.getSessionid();
					System.out.println("userid: " + userid + " ,sessionid: " + sessionid);
				}

			}

			if (userid == 0L || sessionid == 0L) {
				httpServletResponse.sendError(400, "Invalid session. Please Login again.");
				return false;
			}
			User loggedInUser = userDao.getUserByUseridAndSessionid(userid, sessionid);
			if (loggedInUser != null)
				loggedin = true;

		}
		return loggedin;
	}

	@Override
	public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o,
			ModelAndView modelAndView) throws Exception {

	}

	@Override
	public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,
			Object o, Exception e) throws Exception {

	}
}

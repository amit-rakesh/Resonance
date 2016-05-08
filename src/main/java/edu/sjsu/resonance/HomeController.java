package edu.sjsu.resonance;

import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.multiaction.NoSuchRequestHandlingMethodException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.sjsu.helpers.CookieManager;
import edu.sjsu.helpers.FitBitApi;
import edu.sjsu.helpers.FitBitConfig;
import edu.sjsu.models.Song;
import edu.sjsu.models.User;
import edu.sjsu.models.UserFitBitConfigDao;
import edu.sjsu.recommendation.DataWriter;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private UserFitBitConfigDao userFitBitDao;
	
	@Autowired
	private CookieManager currentUser;
	
	@Autowired
	private FitBitConfig fitbitConfig;
	
	@Autowired
	private FitBitApi fitbitApi;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);
		model.addAttribute("user", new User());

		return "signup";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);
		model.addAttribute("user", new User());

		return "login";
	}
	
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String dashboard(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("song", new Song() );
		
		return "dashboard";
	}
	
	@RequestMapping(value = "/*", method = RequestMethod.GET )
	public void handleAtLast(HttpServletRequest request) throws NoSuchRequestHandlingMethodException {
		throw new NoSuchRequestHandlingMethodException(request);
	}
	
	@RequestMapping(value = "/fitbit", method = RequestMethod.GET )
	public String showFitBit(Model model){
		return "fitbitStart";
	}
	
	@RequestMapping(value = "/fitbit", method = RequestMethod.POST )
	public String startFitBit(RedirectAttributes redirectAttributes, Model model) throws URISyntaxException{
		
		URI uri = new URI("http://localhost:8080/resonance/callback");
		
		redirectAttributes.addAttribute("response_type", "code");
		redirectAttributes.addAttribute("xxxx", "xxxxx");
		redirectAttributes.addFlashAttribute("redirect_uri", uri);
		redirectAttributes.addAttribute("scope", "profile heartrate");
		redirectAttributes.addAttribute("prompt", "consent");
		return "redirect:https://www.fitbit.com/oauth2/authorize";
	}
	
	@RequestMapping(value = "/callback", method = RequestMethod.GET )
	public String fitbitCallback(@RequestParam("code") String code, HttpServletRequest request, Model model) throws UnsupportedEncodingException{
				
		Map<String, String> map = request.getParameterMap();
		String str = request.getQueryString();
		System.out.println("query String: " + str);
		System.out.println("Parameters Map: " + map.toString());
		System.out.println("authorization code: " + code);
	
		fitbitConfig.getAccessToken(code);
		return "fitbitStart";	
	}
	
	@RequestMapping(value = "/heartbeat/{songid}", method = RequestMethod.GET)
	@ResponseBody
	public String getHeartBeatData(@PathVariable("songid") long songid, HttpServletRequest request, HttpServletResponse response){
		long userId = currentUser.getCurrentUser().getUserid();
		boolean fileWriteDone = false;
		String body = fitbitApi.getHeartBeat();
		if(body !=null){
			DataWriter writer = new DataWriter();
			fileWriteDone =	writer.processHeartBeatData(userId, songid, body);
		}
		if(fileWriteDone)
			return "sucess";
		return "fail";
	}
}

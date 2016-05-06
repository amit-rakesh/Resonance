package edu.sjsu.resonance;

import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.text.DateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.multiaction.NoSuchRequestHandlingMethodException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.sjsu.exceptions.ResourceNotFoundException;
import edu.sjsu.helpers.CookieManager;
import edu.sjsu.helpers.FitBitApi;
import edu.sjsu.helpers.FitBitConfig;
import edu.sjsu.models.Song;
import edu.sjsu.models.User;
import edu.sjsu.models.UserFitBitConfig;
import edu.sjsu.models.UserFitBitConfigDao;

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
		redirectAttributes.addAttribute("client_id", "227LXW");
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
		/*String client = "227LXW:c78815c756aefe00cb7373dea8cfbe74";
		String base64EncodedString = Base64.getEncoder().encodeToString(client.getBytes("utf-8"));
		System.out.println("Base 64.encoded string: " + base64EncodedString);
		
		RestTemplate rest = new RestTemplate();
		MultiValueMap<String, String> headers = new LinkedMultiValueMap<String, String>();
		headers.add("Authorization", "Basic " + base64EncodedString);
		headers.add("Content-Type", "application/x-www-form-urlencoded");
		
		MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
		body.add("code", code);
		body.add("grant_type", "authorization_code");
		body.add("redirect_uri", "http://localhost:8080/resonance/callback");
		
		HttpEntity<MultiValueMap<String, String>> requestData = new HttpEntity<MultiValueMap<String, String>>(
	            body, headers);
		
		UserFitBitConfig response = null;
		try{
			response = rest.postForObject("https://api.fitbit.com/oauth2/token", requestData, UserFitBitConfig.class);
		System.out.println(response);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		response.setApplicationUserId(currentUser.getCurrentUser().getUserid());
		UserFitBitConfig fitbitObj = userFitBitDao.save(response);*/
			
		return "fitbitStart";	
	}
	
	@RequestMapping(value = "/heartbeat", method = RequestMethod.POST)
	public void getHeartBeatData(){
		fitbitApi.getHeartBeat();
	}
}

package edu.sjsu.controllers;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.amazonaws.util.json.JSONArray;
import com.amazonaws.util.json.JSONObject;

import edu.sjsu.helpers.BadRequestException;
import edu.sjsu.helpers.CookieManager;
import edu.sjsu.helpers.DistanceCalculator;
import edu.sjsu.helpers.EmailNotification;
import edu.sjsu.helpers.GetLocation;
import edu.sjsu.helpers.ServerLocation;
import edu.sjsu.helpers.Utility;
import edu.sjsu.models.Event;
import edu.sjsu.models.Follow;
import edu.sjsu.models.FollowDao;
import edu.sjsu.models.Rating;
import edu.sjsu.models.Song;
import edu.sjsu.models.User;
import edu.sjsu.services.RatingService;
import edu.sjsu.services.SongService;
import edu.sjsu.services.UserService;

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

	@Autowired
	private SongService songService;
	
	@Autowired
	private FollowDao followDao;
	
	@Autowired
	private RatingService ratingService;
	
	private HashMap<Long,String> songidToSongTitleMap = new HashMap<Long,String>();
	
	private HashMap<Long,String> songidToSongUrlMap = new HashMap<Long,String>();
	
	private HashMap<Long,User> peopleIfollow = new HashMap<Long,User>();
	
	private HashMap<Long,String> useridTouserNameMap = new HashMap<Long,String>();
	
	//private HashMap<Long,User> useridTouserObjMap = new HashMap<Long,User>();
	
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
return new ModelAndView("Login1");
		
		
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
				
				ArrayList<Follow> iFollow = userService.usersIFollow(user.getUserid());
				System.out.println("Number of people i follow :" + iFollow.size());		
					peopleIfollow.clear();
				for(int i=0;i<iFollow.size();i++){
			
					peopleIfollow.put(iFollow.get(i).getUser2Id(), null);
					//peopleIFollow.add(userService.getUserById(iFollow.get(i).getUser2Id()));
					
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
		
		User userOb = cookieManager.getCurrentUser();
		byte[] userImage = userOb.getUserPicture();

		byte[] encodeBase64 = Base64.encodeBase64(userImage);
		
		
		String base64Encoded = "";
		if(encodeBase64 != null){

		try {
			base64Encoded = new String(encodeBase64, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		}
		model.addAttribute("userimage", base64Encoded);
		
		
		return "dashboard";

	}
	
	@RequestMapping(value="/getDashboard", method = RequestMethod.GET)
	private String getDashboard(Model model){
		User user = cookieManager.getCurrentUser();
		model.addAttribute("user", user);
		
		byte[] userImage = user.getUserPicture();

		byte[] encodeBase64 = Base64.encodeBase64(userImage);
		String base64Encoded = "";

		
		if(encodeBase64 !=null){
		try {
			base64Encoded = new String(encodeBase64, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		}
		model.addAttribute("userimage", base64Encoded);
		
		
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
		return "HomePage1";
	}
	
	//User follow
	@RequestMapping(value = "/follow/{user2}", method = RequestMethod.POST)
	@ResponseBody
	public String followUser(@PathVariable(value = "user2") long user2Id, Model model) {
		
		long user1Id = cookieManager.getCurrentUser().getUserid();
		System.out.println("User1 : "+user1Id);
		System.out.println("User2 : "+user2Id);
		System.out.println(peopleIfollow.size());	
		peopleIfollow.put(user2Id, null);
		System.out.println(peopleIfollow.size());
		Follow followObj = new Follow(user1Id,user2Id);
		userService.addFollower(followObj);
		return "Hello";
	}
	
	//User unFollow
		@RequestMapping(value = "/unfollow/{user2}", method = RequestMethod.POST)
		@ResponseBody
		public String unFollowUser(@PathVariable(value = "user2") long user2Id, Model model) {
			
			long user1Id = cookieManager.getCurrentUser().getUserid();
			System.out.println("User1 : "+user1Id);
			System.out.println("User2 : "+user2Id);
			
			
			ArrayList<Follow> followObj = followDao.getFollowRecord(user1Id, user2Id);
			peopleIfollow.remove(user2Id);
			userService.removeFollower(followObj);
			
			return "Hello";
		}
	
	@RequestMapping(value = "/{id}/myFollowers", method = RequestMethod.GET )
	public String peopleFollowingMe(@PathVariable long id, Model model) {
		
		ArrayList<Follow> myFollowers = userService.userFollowingMe(id);

		ArrayList<User> peopleFollowingMe = new ArrayList<User>();
		
		for(int i=0;i<myFollowers.size();i++){
			peopleFollowingMe.add(userService.getUserById(myFollowers.get(i).getUser1Id()));
			
		}
		
		
		
		model.addAttribute("users", peopleFollowingMe );
		return "Myfriends";

	}
	
	@RequestMapping(value = "/myFriends", method = RequestMethod.GET )
	public String getMyFriends( Model model) {
		
		User userOb = cookieManager.getCurrentUser();
		ArrayList<Follow> myFollowers = userService.userFollowingMe(userOb.getUserid());

		ArrayList<User> peopleFollowingMe = new ArrayList<User>();
		
		for(int i=0;i<myFollowers.size();i++){
			peopleFollowingMe.add(userService.getUserById(myFollowers.get(i).getUser1Id()));
			
		}
		
		model.addAttribute("users", peopleFollowingMe );
		
		
		ArrayList<Follow> iFollow = userService.usersIFollow(userOb.getUserid());

		ArrayList<User> peopleIFollow = new ArrayList<User>();
		
		for(int i=0;i<iFollow.size();i++){
			peopleIFollow.add(userService.getUserById(iFollow.get(i).getUser2Id()));
			
		}
		
		System.out.println("Hello Harkirat : ");
		
		for(int i=0;i<peopleFollowingMe.size();i++){
			System.out.println(peopleFollowingMe.get(i).getEmail());
			
		}
		
		System.out.println("Hello Harkirat : ");
		for(int i=0;i<peopleIFollow.size();i++){
			System.out.println(peopleIFollow.get(i).getEmail());
			
		}
		model.addAttribute("usersIFollow", peopleIFollow );
		
		
		return "Myfriends";

	}
	


	/*********** edit profile **********/

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String uploadPicture(@ModelAttribute("user") User user, BindingResult result, HttpServletRequest request,
			@RequestParam("file") MultipartFile file,	HttpServletResponse response, Model model) {
		System.out.println(user.getUserid() +"------"+ user.getName());
		//long id  = user.getUserid();
		
		User userOb = cookieManager.getCurrentUser();
		try {
			if(!file.isEmpty()){
				System.out.println("Harkirat how r u");
			userOb.setUserPicture(file.getBytes());
			}
			if(user.getName()!=null){
			userOb.setName(user.getName());
			}
			if(user.getEmail()!=null){
			userOb.setEmail(user.getEmail());
			}
			if(user.getState()!=null){
			userOb.setState(user.getState());
			}
			if(user.getCountry()!=null){
			userOb.setCountry(user.getCountry());
			}
			if(user.getAge()!=null){
			userOb.setAge(user.getAge());
			}
			if(user.getSex()!=null){
			userOb.setSex(user.getSex());
			}
			
			System.out.println(""+ userOb.getName()+"" +userOb.getEmail()+""+userOb.getState()+""+userOb.getCountry()+""+userOb.getAge()+""+userOb.getSex());
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		userService.create(userOb);
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
		return "dashboard";
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String showUploadForm(Model model){
		model.addAttribute(new User());
		return "upload";
	}
	/*  Edit Information Page */
	@RequestMapping(value = "/editInformation", method = RequestMethod.GET)
	public String showEditForm(Model model){
		
		User user= cookieManager.getCurrentUser();
		
		byte[] userImage = user.getUserPicture();

		byte[] encodeBase64 = Base64.encodeBase64(userImage);
		String base64Encoded = "";

		if(encodeBase64 !=null){
		try {
			base64Encoded = new String(encodeBase64, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		}
		model.addAttribute("userimage", base64Encoded);
		model.addAttribute("user", user );
		return "editInfo";
	}
	

	//search
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String fetchAllData( Model model) {
		
		ArrayList<Song> songs = songService.getAllSongs();
		
		ArrayList<User> users = userService.getAllUsers();
		System.out.println(songs.size());
		for(int i = 0; i<songs.size();i++){
			
			songidToSongTitleMap.put(songs.get(i).getSongId(), songs.get(i).getSongTitle());
			songidToSongUrlMap.put(songs.get(i).getSongId(), songs.get(i).getPlayingUrl());
		}
		
		
		for(int i = 0; i<users.size();i++){
			
			useridTouserNameMap.put(users.get(i).getUserid(), users.get(i).getName());
		}
		System.out.println("Size : "+songidToSongTitleMap.size());
		return "search";
	}

	@RequestMapping(value = "/getSearchResults", method = RequestMethod.GET ,produces = "application/json")
	public ResponseEntity<String> searchSong(@RequestParam("data") String originalData, Model model) {
	System.out.println("original :" + originalData);	
		String data = originalData.toLowerCase();
		System.out.println("data :" + data);
		JSONArray a = new JSONArray();
		for(long key : songidToSongTitleMap.keySet()){
			
			
		
			if(songidToSongTitleMap.get(key).toLowerCase().contains(data))
			{
				System.out.println("yes");
				//String returnObj = "title :" + allSongs.get(key);
				JSONObject o = new JSONObject();
				System.out.println(songidToSongTitleMap.get(key));
				try{
					o.put("title", songidToSongTitleMap.get(key));
					o.put("url", songidToSongUrlMap.get(key));
			
					
					a.put(o);
				}catch(Exception e){
				
				}
				
			//return allSongs.get(data);
			}
		
			
		}
		System.out.println(a.toString());
		return new ResponseEntity<String>(a.toString(),HttpStatus.OK);
	} 
	
	@RequestMapping(value = "/getSearchResultUsers", method = RequestMethod.GET ,produces = "application/json")
	public ResponseEntity<String> searchUser(@RequestParam("data") String originalData, Model model) {
		
		System.out.println("original :" + originalData);	
		String data = originalData.toLowerCase();
		System.out.println("data :" + data);
		JSONArray a = new JSONArray();
		
		for(long userId : useridTouserNameMap.keySet()){
			if(useridTouserNameMap.get(userId).toLowerCase().contains(data)){
				System.out.println("yes");
				
				JSONObject o = new JSONObject();
				
				try{
					o.put("id", userId);
					o.put("name", useridTouserNameMap.get(userId));
			
					
					a.put(o);
				}catch(Exception e){
				
				}
			}
		}
		
		System.out.println(a.toString());	
		return new ResponseEntity<String>(a.toString(),HttpStatus.OK);
	} 
	
	
	@RequestMapping(value = "/otherUser/{id}", method = RequestMethod.GET)
	public String showOtherUserDashboard(@PathVariable long id, Model model) {
		
		User currentUser=cookieManager.getCurrentUser();
		long currentUserId = currentUser.getUserid();
		if(id==currentUserId){
			byte[] userImage = currentUser.getUserPicture();

			byte[] encodeBase64 = Base64.encodeBase64(userImage);
			String base64Encoded = "";
			try {
				base64Encoded = new String(encodeBase64, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			model.addAttribute("userimage", base64Encoded);
			model.addAttribute(currentUser);
			return "dashboard";
		}
		User user = userService.findUserById(id);
		boolean isFriend = peopleIfollow.containsKey(id);
		System.out.println(isFriend);
		ArrayList<Song> uploadedByMe = songService.songsUploadedByMe(id); 
		model.addAttribute("isFriend",isFriend);
		model.addAttribute(user);
		model.addAttribute("songList",uploadedByMe);
		return "otherUserProfile";

	}
	
	
	@RequestMapping(value = "/editInfo", method = RequestMethod.GET)
	public String dashboard(Locale locale, Model model) {
		
		User user= cookieManager.getCurrentUser();
		model.addAttribute("user", user );
		
		return "editinfo";
	}
	
	@RequestMapping(value = "/createEvent", method = RequestMethod.GET)
	public String getCreateEventPage( Model model) {
		
		
		return "createEvent";
	}
	
	@RequestMapping(value = "/createEvent", method = RequestMethod.POST)
	public ResponseEntity<String> createEvent(@RequestParam("data") String originalData, Model model) {
		
		JSONObject jsonObj;
		String title="";
		String address="";
		double latitude=0;
		double longitude=0;
		System.out.println("create Event : "+originalData);
		try{
			jsonObj = new JSONObject(originalData);
			System.out.println(jsonObj.get("title"));
			
			title = jsonObj.get("title").toString();
			address = jsonObj.get("address").toString();
			latitude = Double.parseDouble(jsonObj.get("latitude").toString());
			longitude = Double.parseDouble(jsonObj.get("longitude").toString());
			System.out.println(latitude);
			
		}catch(Exception e){
			
		}
		
		User user= cookieManager.getCurrentUser();
		
		Event event = new Event(title,user.getUserid(),longitude,latitude,address);
		
		userService.createEvent(event);
		
		return new ResponseEntity<String>("Hello", HttpStatus.CREATED);
		
		
	}
	
	
	@RequestMapping(value = "/getNearEvents", method = RequestMethod.GET)
	public String getNearEvents(Locale locale, Model model) {
		
		ArrayList<Event> allEvents = userService.getAllEvents();
		for(Event e:allEvents){
			System.out.println(e.getEventTitle());
		}
		String ip ="";
		try{
			
		URL whatismyip = new URL("http://checkip.amazonaws.com");
		BufferedReader in = new BufferedReader(new InputStreamReader(
		                whatismyip.openStream()));

		ip = in.readLine(); //you get the IP as a String
		System.out.println(ip);
		
		}catch(Exception e){
			
		}
		
		GetLocation obj = new GetLocation();
		ServerLocation location = obj.getLocation(ip);
		System.out.println(location);
	
		double latitude=Double.parseDouble(location.getLatitude());
		double longitude=Double.parseDouble(location.getLongitude());
	
		ArrayList<Event> eventsNearMe =new ArrayList<Event>();
		int minDis = 50;
		for(Event e:allEvents){
			double distance = DistanceCalculator.distance(latitude, longitude, e.getLatitude(), e.getLongitute(), "M");
			System.out.println(distance);
			if(distance<minDis){
				eventsNearMe.add(e);
			}
		}
		
		model.addAttribute("events", eventsNearMe );
		return "EventsNearMe";
		
	}	

	@RequestMapping(value = "/getTrending", method = RequestMethod.GET)
	public String getTrending( Model model) {
		
		ArrayList<Song> songs = popSongs();
		ArrayList<User> users = userService.getTrendingUsers();
		model.addAttribute("users",users);
		model.addAttribute("songs",songs);
		return "Trending";
	}
	
	public ArrayList<Song> popSongs(){
		ArrayList<Rating> list = ratingService.getRatingForAllSongs();
		
		HashMap<Long,Integer> numberOfUserRatedThesongsMap = new HashMap<Long,Integer>();
		HashMap<Long,Integer> sumOfAllRatingsForThesongsMap = new HashMap<Long,Integer>();
		
		for(Rating r: list){
			if(numberOfUserRatedThesongsMap.containsKey(r.getSongId())){
				numberOfUserRatedThesongsMap.put(r.getSongId(), (numberOfUserRatedThesongsMap.get(r.getSongId())+1));
				sumOfAllRatingsForThesongsMap.put(r.getSongId(), (sumOfAllRatingsForThesongsMap.get(r.getSongId())+r.getRating()));
			}
			else{
				numberOfUserRatedThesongsMap.put(r.getSongId(), 1);
				sumOfAllRatingsForThesongsMap.put(r.getSongId(), r.getRating());
			}
					
		}
		
		HashMap<Long,Double> finalRatingForSongs = new HashMap<Long,Double>();
		for(long k : numberOfUserRatedThesongsMap.keySet()){
			double avgRating = (double)sumOfAllRatingsForThesongsMap.get(k)/numberOfUserRatedThesongsMap.get(k);
			finalRatingForSongs.put(k, avgRating);
			System.out.println(k+" : "+avgRating);
		}
		
		ArrayList<Song> popularSongs= new ArrayList<Song>();
		int i=0;
		while(i<5 && !finalRatingForSongs.isEmpty()){
			double maxValueInMap=(Collections.max(finalRatingForSongs.values()));  // This will return max value in the Hashmap
			
			Iterator<Map.Entry<Long,Double>> iter = finalRatingForSongs.entrySet().iterator();
			while (iter.hasNext()) {
				 Map.Entry<Long,Double> entry = iter.next();
				 if(i>=5)
	                	break;
		        	
		        	if (entry.getValue()==maxValueInMap) {
		                System.out.println(entry.getKey());     // Print the key with max value
		                popularSongs.add(songService.findSongById(entry.getKey()));
		                i++;
		                iter.remove();
		                System.out.println("removed");
		            }
				}
			
			
		}
		
		System.out.println("Pop songs list : "+popularSongs.size());

		return popularSongs;
	}

}


   

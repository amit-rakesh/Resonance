package edu.sjsu.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import edu.sjsu.helpers.BadRequestException;
import edu.sjsu.helpers.CookieManager;
import edu.sjsu.helpers.S3Connector;
import edu.sjsu.models.Rating;
import edu.sjsu.models.Song;
import edu.sjsu.models.User;
import edu.sjsu.recommendation.RecommendedSongs;
import edu.sjsu.services.RatingService;
import edu.sjsu.services.SongService;
import edu.sjsu.services.UserService;

/**
 * Created by harkirat singh on 3/9/2016.
 */

@Controller
// @EnableAutoConfiguration
@ComponentScan
@Component("SongController")
@RequestMapping("/song")
public class SongController {

	@Autowired
	CookieManager UserCookie;

	@Autowired
	private SongService songService;

	@Autowired
	private UserService userService;

	@Autowired
	private S3Connector s3Connector;

	@Autowired
	private CookieManager cookieManager;

	@Autowired
	private RecommendedSongs rSongs;

	@Autowired
	private RatingService ratingService;
	
	
	
	
	//private HashMap<Long, Rating> rating = new HashMap<Long, Rating>();
	private HashMap<Long, Integer> userRating = new HashMap<Long, Integer>();

	// =================================================
	// Upload a new song
	// =================================================
	@RequestMapping(value = "/upload", method = RequestMethod.POST, produces = "application/json")
	public ModelAndView createSong(@Valid @ModelAttribute("song") Song song, BindingResult result,
			HttpServletResponse response) {

		// System.out.println("UserID : " + song.getUploadedByUserId());
		System.out.println("Path : " + song.getSongPath());

		if (song.getSongTitle() == null)
			throw new BadRequestException("Song title required.");

		if (song.getSongPath() == null)
			throw new BadRequestException("Path is required.");

		Song songObj = null;

		long unixTime = System.currentTimeMillis() / 1000L;
		System.out.println(unixTime);

		User currentUser;

		currentUser = UserCookie.getCurrentUser();
		long userId = currentUser.getUserid();
		System.out.println("ID" + currentUser.getUserid());

		try {
			songObj = new Song(song.getSongTitle(), userId, song.getSongPath(), unixTime);
			System.out.println("Harkirat : " + song.getSongId());
			System.out.println("USERID" + song.getUploadedByUserId());
		} catch (Exception e) {

		}

		System.out.println("Harkirat : " + songObj.getSongPath());
		songService.create(songObj);
		String key = songObj.getSongTitle() + songObj.getSongId();
		String url = s3Connector.uploadFile(key, songObj.getSongPath());
		songObj.setPlayingUrl(url);
		songService.create(songObj);
		return new ModelAndView("uploadSong");
	}

	@RequestMapping(value = "/getUploadSong", method = RequestMethod.GET)
	public String getUploadSong(Model model) {
		model.addAttribute(new Song());
		return "uploadSong";
	}

	// =================================================
	// Get Latest 10 songs
	// =================================================
	@RequestMapping(value = "/get10LatestSongs", method = RequestMethod.GET)
	public String get10LatestSongs(Model model) {

		User userOb = cookieManager.getCurrentUser();
		System.out.println(userOb.getEmail());
		ArrayList<Song> latestsongs = songService.getLatestSongs();
		
		ArrayList<Song> recommendedSongs = rSongs.getRecommendedSongs(userOb.getUserid(), 3);

		for (Song song : recommendedSongs) {
			System.out.println(song.getSongId());
		}
		ArrayList<Song> uploadedByMe = songService.songsUploadedByMe(userOb.getUserid());
		System.out.println(uploadedByMe.size());
		model.addAttribute("songs", latestsongs);
		model.addAttribute("mysongs", uploadedByMe);
		model.addAttribute("recommendedsongs", recommendedSongs);
		generateRatingHashMap();

		return "latestSongs";

	}

	@RequestMapping(value = "/rating/{songid}/{rating}", method = RequestMethod.POST)
	@ResponseBody
	public String setSongRating(@PathVariable(value = "songid") long songId,  @PathVariable(value = "rating") int rating,
			 HttpServletRequest request, HttpServletResponse response) {
		System.out.println("incontroller");
		User currentUser = cookieManager.getCurrentUser();
		System.out.println(currentUser.getUserid());
		Rating ratingOb = new Rating(songId, currentUser.getUserid(), rating);
		try {
			ratingService.create(ratingOb);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Success";
	}

	@RequestMapping(value = "/rating/{songid}", method = RequestMethod.GET)
	@ResponseBody
	public String getSongRating(@PathVariable("songid") long songId, HttpServletRequest request,
			HttpServletResponse response) {

		//long currentUserId = currentUser.getUserid();
		//ArrayList<Rating> rating = ratingService.getRatingByUserId(currentUserId);
		
		
		if(userRating.containsKey(songId)){
		Integer songRating =  userRating.get(songId);
		String responseString = "" + songId + songRating;
		System.out.println(responseString);
		return responseString;
		}
		else
			return "0";
	}
	
	@RequestMapping(value = "/rating", method = RequestMethod.GET)
	public String showRating(){
		return "rating";
	}
	
	public void generateRatingHashMap(){
		User currentUser = cookieManager.getCurrentUser();
		ArrayList<Rating> rating = ratingService.getRatingByUserId(currentUser.getUserid());
		for(Rating r : rating){
			userRating.put(r.getSongId(), r.getRating());
		}
	}

}

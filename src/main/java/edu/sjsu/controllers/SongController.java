package edu.sjsu.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.sjsu.helpers.BadRequestException;
import edu.sjsu.helpers.S3Connector;
import edu.sjsu.models.Song;
import edu.sjsu.services.SongService;
import edu.sjsu.services.UserService;

import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

/**
 * Created by harkirat singh on 3/9/2016.
 */

@RestController
//@EnableAutoConfiguration
@ComponentScan
@Component("SongController")
@RequestMapping("/song")
public class SongController {

    @Autowired
    private SongService songService;

    @Autowired
    private UserService userService;

    @Autowired
    private S3Connector s3Connector;
    //=================================================
    //          Upload a new song
    //=================================================
    @RequestMapping(value = "/upload", method = RequestMethod.POST, produces = "application/json")
    public ModelAndView createSong(@Valid @ModelAttribute("song") Song song, BindingResult result, HttpServletResponse response) {

        System.out.println("UserID : "+ song.getUploadedByUserId());
        System.out.println("Path : "+ song.getSongPath());
        
        if (song.getSongTitle() == null )
            throw new BadRequestException("Song title required.");
        
        if (song.getUploadedByUserId()==null)
            throw new BadRequestException("User Id is required.");
        if (song.getSongPath()==null)
            throw new BadRequestException("Path is required.");


        if(userService.getUserById(Long.parseLong(song.getUploadedByUserId()))==null){
            throw new BadRequestException("Invalid user");
        }
        Song songObj = null;

        long unixTime = System.currentTimeMillis() / 1000L;
   	 	System.out.println(unixTime); 
   	 	
        try {
            songObj = new Song(song.getSongTitle(),song.getUploadedByUserId(),song.getSongPath(),unixTime);
            System.out.println("Harkirat : "+song.getSongId());
        } catch (Exception e) {
           
        }

        System.out.println("Harkirat : "+songObj.getSongPath());
        songService.create(songObj);
        String key= songObj.getSongTitle()+songObj.getSongId();
        s3Connector.uploadFile(key,songObj.getSongPath());
        return new ModelAndView("dashboard");
    }
    
    
    //=================================================
    //          Upload a new song
    //=================================================
    @RequestMapping(value = "/get10LatestSongs", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<ArrayList<Song>>  get10LatestSongs() {

    	ArrayList<Song> latestsongs = songService.getLatestSongs();
    	
 
    	return new ResponseEntity<ArrayList<Song>>(latestsongs, HttpStatus.OK);
    	
    }
}
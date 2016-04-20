package edu.sjsu.services;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import edu.sjsu.models.Song;
import edu.sjsu.models.SongDao;
import edu.sjsu.models.UserDao;

/**
 * Created by harkirat singh on 3/9/2016.
 */
public class SongServiceImpl implements SongService{

    @Autowired
    SongDao songDao;

    @Override
    public Song create(Song song) {

        songDao.save(song);
        return song;
    }
    
    public ArrayList<Song> getLatestSongs(){
    	ArrayList<Song> latestsong = songDao.getLatestSongs();
    	return latestsong;
    }
    
    public ArrayList<Song> songsUploadedByMe(long id){
    	
    	ArrayList<Song> uploadedByMe = songDao.songsUploadedByMe(id);
    	return uploadedByMe;
    }
    
    @Override
    public ArrayList<Song> getAllSongs(){
    	
    	ArrayList<Song> songs = songDao.getAllSongs();
    	
    	System.out.println(songs.size());
    	return songs;
    }

}

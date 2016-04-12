package edu.sjsu.services;

import java.util.ArrayList;

import edu.sjsu.models.Song;

public interface SongService {

    public Song create(Song song);
    public ArrayList<Song> getLatestSongs();
}
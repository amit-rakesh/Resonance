package edu.sjsu.models;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by harkirat singh on 3/9/2016.
 */
public interface SongDao extends CrudRepository<Song, Long> {


	@Query(value="SELECT * FROM songs Order By  date DESC LIMIT 0, 10",nativeQuery = true)
    ArrayList<Song> getLatestSongs();
	
	@Query(value="SELECT * FROM songs where userid=?1",nativeQuery = true)
    ArrayList<Song> songsUploadedByMe(long id);
	
	@Query(value = "select * from songs", nativeQuery = true)
	ArrayList<Song> getAllSongs();
}

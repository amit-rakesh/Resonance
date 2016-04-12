package edu.sjsu.models;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by harkirat singh on 3/9/2016.
 */
public interface SongDao extends CrudRepository<Song, Long> {


	@Query(value="SELECT * FROM songs Order By  date DESC LIMIT 0, 3",nativeQuery = true)
    ArrayList<Song> getLatestSongs();
}

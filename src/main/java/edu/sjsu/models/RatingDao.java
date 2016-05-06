package edu.sjsu.models;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;


public interface RatingDao extends CrudRepository<Rating, Long> {
	
	@Query(value="SELECT * FROM rating where userid=?1",nativeQuery = true)
    ArrayList<Rating> ratingsGivenByMe(long userid);
	
	@Query(value="SELECT * FROM rating ",nativeQuery = true)
    ArrayList<Rating> getRagingForAllSongs();
}

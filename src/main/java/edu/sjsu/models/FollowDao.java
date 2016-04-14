package edu.sjsu.models;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface FollowDao extends CrudRepository<Follow, Long> {
	
	@Query(value = "SELECT * FROM follow u  WHERE  u.user2=?1", nativeQuery = true)
	public ArrayList<Follow> getUsersFollowingMe(long id);
	
	@Query(value = "SELECT * FROM follow u  WHERE  u.user1=?1", nativeQuery = true)
	public ArrayList<Follow> getUsersIFollow(long id);

}

package edu.sjsu.models;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface FollowDao extends CrudRepository<Follow, Long> {
	
	@Query(value = "SELECT * FROM follow u  WHERE  u.user2=?1", nativeQuery = true)
	public ArrayList<Follow> getUsersFollowingMe(long id);
	
	@Query(value = "SELECT * FROM follow u  WHERE  u.user1=?1", nativeQuery = true)
	public ArrayList<Follow> getUsersIFollow(long id);
	
	@Query(value = "SELECT * FROM follow u  WHERE  u.user1=?1 and u.user2=?2", nativeQuery = true)
	public ArrayList<Follow> getFollowRecord(long id1, long id2);
	
	@Query(value = "SELECT user2 FROM follow group by user2 order by count(user1) desc", nativeQuery = true)
	public ArrayList<Integer> getMostFollowedUsers();

}

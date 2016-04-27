package edu.sjsu.models;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface BlogDao extends CrudRepository<Blog, Long> {
		
	@Query(value="SELECT * FROM blogs where userid=?1",nativeQuery = true)
    ArrayList<Blog> blogsUploadedByUserId(long userid);
	
	@Query(value="SELECT * FROM blogs Order By  date DESC LIMIT 0, 10",nativeQuery = true)
    ArrayList<Blog> getLatestBlogs();
}

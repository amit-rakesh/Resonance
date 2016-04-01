package edu.sjsu.models;

import java.util.ArrayList;
import org.springframework.data.jpa.repository.Query;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

public interface UserDao extends CrudRepository<User, Long> {
	
    @Query(value="SELECT * FROM users u  WHERE  u.email=?1",nativeQuery = true)
    User getUserByEmail(String email);

}

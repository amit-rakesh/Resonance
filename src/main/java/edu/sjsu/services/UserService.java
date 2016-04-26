package edu.sjsu.services;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

import edu.sjsu.models.Follow;
import edu.sjsu.models.User;

public interface UserService {

	public User create(User user);

	public void isEmailAvailable(String email);

	public User getUserById(long userid);

	public User getUserByEmail(String email);

	public User findUserById(long id);
	
	public void addFollower(Follow follow);
	
	public void removeFollower(ArrayList<Follow> follow);

	public ArrayList<Follow> userFollowingMe(long id);
	
	public ArrayList<Follow> usersIFollow(long id);
	
	public ArrayList<User> searchUsers(String searchString);
	
	public ArrayList<User> getAllUsers();
}

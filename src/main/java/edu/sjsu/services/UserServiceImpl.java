package edu.sjsu.services;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.sjsu.helpers.BadRequestException;
import edu.sjsu.models.Follow;
import edu.sjsu.models.FollowDao;
import edu.sjsu.models.User;
import edu.sjsu.models.UserDao;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;
	
	@Autowired
	FollowDao followDao;

	@Override
	public User create(User user) {

		userDao.save(user);

		return user;
	}

	@Override
	public void isEmailAvailable(String email) {

		User user = userDao.getUserByEmail(email);

		if (user != null) {
			throw new BadRequestException("Email already in use");
		}
	}

	@Override
	public User getUserByEmail(String email) {

		User user = userDao.getUserByEmail(email);
		if (user == null) {
			throw new BadRequestException("Email not registered");
		} else {
			return user;
		}
	}

	@Override
	public User getUserById(long userid) {
		User user = userDao.findOne(userid);
		return user;
	}

	@Override
	public User findUserById(long id) {
		User user = userDao.findOne(id);
		return user;
	}
	
	@Override
	public void addFollower(Follow follow){
		followDao.save(follow);
	}

	@Override
	public ArrayList<Follow> userFollowingMe(long id)
	{
		ArrayList<Follow> myFollowers = followDao.getUsersFollowingMe(id);
		
		
		return myFollowers;
	}
	
	@Override
	public ArrayList<Follow> usersIFollow(long id){
		
		ArrayList<Follow> iFollow = followDao.getUsersIFollow(id);
		
		
		return iFollow;
	}
	
	@Override
	public ArrayList<User> searchUsers(String searchString){
		ArrayList<User> searchResultUsers = userDao.SearchUserName(searchString);
		System.out.println("Count of results : "+searchResultUsers.size());
		return searchResultUsers;
	}
}

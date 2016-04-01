package edu.sjsu.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.sjsu.models.User;
import edu.sjsu.models.UserDao;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;

	@Override
	public User create(User user) {

		System.out.println("In create");
		userDao.save(user);

		System.out.println("In create after save");
		return user;
	}
}

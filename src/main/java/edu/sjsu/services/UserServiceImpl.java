package edu.sjsu.services;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.sjsu.helpers.BadRequestException;
import edu.sjsu.models.User;
import edu.sjsu.models.UserDao;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;

	@Override
	public User create(User user) {

		
		userDao.save(user);

		
		return user;
	}
	
	
    @Override
    public void isEmailAvailable(String email){
    	
        User user = userDao.getUserByEmail(email);
        
        if(user!=null){
            throw new BadRequestException("Email already in use");
        }
    }
    
    @Override
    public User getUserByEmail(String email){

    	 	
    	User user = userDao.getUserByEmail(email);
        if(user==null){
            throw new BadRequestException("Email not registered");
        }
        else{
            return user;
        }
    }
    
    @Override
    public User getUserById(long userid) {
        User user = userDao.findOne(userid);
        return user;
    }

}

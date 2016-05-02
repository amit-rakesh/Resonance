package edu.sjsu.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import edu.sjsu.models.Rating;
import edu.sjsu.models.RatingDao;

public class RatingServiceImpl implements RatingService{
	
	@Autowired
	private RatingDao ratingDao;
	
	@Override
	public Rating create(Rating rating) {
		ratingDao.save(rating);
		return rating;
	}

	@Override
	public Rating findRatingById(long id) {
		return ratingDao.findOne(id);
	}

	@Override
	public ArrayList<Rating> getRatingByUserId(long userid) {
		ArrayList<Rating> ratings = ratingDao.ratingsGivenByMe(userid);
		return ratings;
	}

}

package edu.sjsu.services;

import java.util.ArrayList;
import java.util.List;

import edu.sjsu.models.Rating;

public interface RatingService {
	
	public Rating create(Rating rating);
	public Rating findRatingById(long id);
	public ArrayList<Rating> getRatingByUserId(long userid);

}

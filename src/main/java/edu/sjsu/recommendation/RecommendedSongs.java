package edu.sjsu.recommendation;

import java.util.ArrayList;
import java.util.List;

import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.springframework.beans.factory.annotation.Autowired;

import edu.sjsu.models.Song;
import edu.sjsu.services.SongService;

public class RecommendedSongs {
	
	@Autowired
	private SongService songService;
	
	public ArrayList<Song> songList;
	public List<RecommendedItem> recommendedItem;
	
	public ArrayList<Song> getRecommendedSongs(long userid, int numOfRecommendation){
		RecommendationEngine rc = new RecommendationEngine();
		recommendedItem = rc.getUserBasedRecommendation(userid, numOfRecommendation);
		for(RecommendedItem ri : recommendedItem){
			long songId = ri.getItemID();
			songList.add(songService.findSongById(songId));
		}
		
		return songList;
		
	}

}

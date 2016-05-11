package edu.sjsu.recommendation;

import java.util.ArrayList;
import java.util.List;

import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import edu.sjsu.models.Song;
import edu.sjsu.services.SongService;

@Component
public class RecommendedSongs {
	
	@Autowired
	private SongService songService;
	
	
	public List<RecommendedItem> recommendedItem;
	
	public ArrayList<Song> getRecommendedSongs(long userid, int numOfRecommendation){
		ArrayList<Song> songList = new ArrayList<Song>();
		RecommendationEngine rc = new RecommendationEngine();
		recommendedItem = rc.getUserBasedRecommendation(userid, numOfRecommendation);
		if(recommendedItem != null){
		for(RecommendedItem ri : recommendedItem){
			long songId = ri.getItemID();
			Song tempSong = songService.findSongById(songId);
			System.out.println(tempSong.getSongTitle());
			songList.add(tempSong);
		}
		}
		
		else{
			Song tempSong = songService.findSongById(23);
			System.out.println(tempSong.getSongTitle());
			songList.add(tempSong);
		}
		
		return songList;
		
	}

}

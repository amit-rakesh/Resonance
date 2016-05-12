package edu.sjsu.recommendation;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.impl.model.GenericBooleanPrefDataModel;
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.NearestNUserNeighborhood;
import org.apache.mahout.cf.taste.impl.neighborhood.ThresholdUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity;
import org.apache.mahout.cf.taste.impl.similarity.TanimotoCoefficientSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.UserBasedRecommender;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;
import org.springframework.core.io.FileSystemResource;

public class RecommendationEngine {

	public List<RecommendedItem> getUserBasedRecommendation(long userid, int numOfRecommendation) {
		List<RecommendedItem> recommendations = null;
		DataModel model = null;
		try {
			model = new FileDataModel(


					new File("H:/harkirat/Study/sem4/Project-3-31/Resonance-1/Data.csv"));


		} catch (IOException e) {
			
			e.printStackTrace();
		}

		UserSimilarity similarity = null;
		try {
			similarity = new PearsonCorrelationSimilarity(model);
		} catch (TasteException e) {
			
			e.printStackTrace();
		}

		UserNeighborhood neighborhood = new ThresholdUserNeighborhood(0.1, similarity, model);

		UserBasedRecommender recommender = new GenericUserBasedRecommender(model, neighborhood, similarity);

		try {
			recommendations = recommender.recommend(userid, numOfRecommendation);
		} catch (TasteException e) {
			
			e.printStackTrace();
		}
		if(recommendations!=null){
		for (RecommendedItem recommendation : recommendations) {
			System.out.println(recommendation);
		}
		}

		return recommendations;
	}
	
	public List<RecommendedItem> getUserBasedFitBitRecommendation(long userId, int numOfRecommendation){
		List<RecommendedItem> recommendations = null;
		try {
			//enterData();
			FileSystemResource resource = new FileSystemResource("C:/Users/Amit/Desktop/CMPE_Courses/CMPE 295B/Master_Project/Resonance/Data1.csv");
			DataModel model = new GenericBooleanPrefDataModel( GenericBooleanPrefDataModel.toDataMap(new FileDataModel(resource.getFile())));
			
			UserSimilarity similarity = new TanimotoCoefficientSimilarity(model);
			UserNeighborhood neighborhood = new NearestNUserNeighborhood(10, similarity, model);
			UserBasedRecommender recommender = new GenericUserBasedRecommender(model, neighborhood, similarity);
			recommendations = recommender.recommend(userId, numOfRecommendation);
			
		} catch (IOException e) {
			
			e.printStackTrace();
		} catch (TasteException e) {
			
			e.printStackTrace();
		}
		return recommendations;
		
	}

}

package edu.sjsu.helpers;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.hadoop.yarn.webapp.WebApp.HTTP;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import edu.sjsu.models.UserFitBitConfigDao;

@Component
public class FitBitApi {

	@Autowired
	private UserFitBitConfigDao userFitbitDao;

	@Autowired
	private FitBitConfig fitbitUserConfig;

	RestTemplate rest = new RestTemplate();

	public String getHeartBeat() {
		final long ONE_MINUTE_IN_MILLIS=60000;
		String body = null;
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		String startTime = sdf.format(new Date());
		System.out.println(startTime);
		Calendar date = Calendar.getInstance();
		long t= date.getTimeInMillis();
		Date afterAddingFiveMins=new Date(t + (5 * ONE_MINUTE_IN_MILLIS));
		String endTime = sdf.format(afterAddingFiveMins);
		System.out.println(endTime);
		
		MultiValueMap<String, String> headers = new LinkedMultiValueMap<String, String>();
		headers.add("Authorization", "Bearer " + fitbitUserConfig.getUserAccessToken());
		HttpEntity<?> requestEntity = new HttpEntity(headers);
		ResponseEntity<String> entity = null;
		try {
			entity = rest.exchange(
					"https://api.fitbit.com/1/user/-/activities/heart/date/today/1d/1min/time/" + "23:45" + "/" + "23:50"+ ".json",
					HttpMethod.GET, requestEntity, String.class);
			
		} catch (HttpClientErrorException ce) {
			if (ce.getStatusCode().equals(HttpStatus.UNAUTHORIZED)) {
			String	errorBody = ce.getResponseBodyAsString();
				System.out.println("Exception Body: \n " + errorBody);
				ObjectMapper mapper = new ObjectMapper();

				JsonNode rootNode = null;
				try {
					rootNode = mapper.readTree(errorBody);
					System.out.println("rootNode: " + rootNode);
				} catch (Exception e) {
					e.printStackTrace();
				}
				System.out.println(rootNode.has("errors"));
				if (rootNode.has("errors")) {
					JsonNode errors = rootNode.path("errors");
					for (JsonNode jn : errors) {
						String errorType = jn.path("errorType").asText();
						System.out.println("error type : " + errorType);
						if (errorType.equals("expired_token")) {
							fitbitUserConfig.refreshAccessToken();
							getHeartBeat();
						}
					}
				}

			} else {
				ce.printStackTrace();
			}
		}
		
		if(entity !=null){
			HttpStatus status = entity.getStatusCode();
			System.out.println(status.name());
			System.out.println(status.is2xxSuccessful());
			body = entity.getBody();
			System.out.println("entity body: " + body);
			
		}
		
		return body;
	}
	
}

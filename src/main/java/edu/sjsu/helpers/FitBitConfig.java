package edu.sjsu.helpers;

import java.io.UnsupportedEncodingException;
import org.apache.commons.codec.binary.Base64;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import edu.sjsu.models.UserFitBitConfig;
import edu.sjsu.models.UserFitBitConfigDao;

@Component
public class FitBitConfig {

	private static final String AUTHORIZE_URL = "https://www.fitbit.com/oauth2/authorize";
	private static final String ACCESS_TOKEN_URL = "https://api.fitbit.com/oauth2/token";
	private static final String REFRESH_TOKEN_URL = "https://api.fitbit.com/oauth2/token";

	private static final String CLIENT_KEY = "xxxx";
	private static final String CLIENT_SECRET = "xxxxxxxxxxxx";

	private UserFitBitConfig fitbitObj;

	@Autowired
	private CookieManager currentUser;

	@Autowired
	private UserFitBitConfigDao userFitBitConfigDao;

	public void getAccessToken(String code) throws UnsupportedEncodingException {

		String base64EncodedString = Base64.encodeBase64String((CLIENT_KEY + ":" + CLIENT_SECRET).getBytes("utf-8"));

		RestTemplate rest = new RestTemplate();
		MultiValueMap<String, String> headers = new LinkedMultiValueMap<String, String>();
		headers.add("Authorization", "Basic " + base64EncodedString);
		headers.add("Content-Type", "application/x-www-form-urlencoded");

		MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
		body.add("code", code);
		body.add("grant_type", "authorization_code");
		body.add("redirect_uri", "http://localhost:8080/resonance/callback");

		HttpEntity<MultiValueMap<String, String>> requestData = new HttpEntity<MultiValueMap<String, String>>(body,
				headers);

		UserFitBitConfig response = null;
		try {
			response = rest.postForObject(ACCESS_TOKEN_URL, requestData, UserFitBitConfig.class);
		} catch (Exception e) {
			e.printStackTrace();
		}

		response.setApplicationUserId(currentUser.getCurrentUser().getUserid());
		fitbitObj = userFitBitConfigDao.save(response);

	}

	public String getUserAccessToken() {
		if (fitbitObj == null)
			fitbitObj = userFitBitConfigDao.findOne(currentUser.getCurrentUser().getUserid());
		return fitbitObj.getAccess_token();
	}

	public String getUserRefreshToken() {
		if (fitbitObj == null)
			fitbitObj = userFitBitConfigDao.findOne(currentUser.getCurrentUser().getUserid());
		return fitbitObj.getRefresh_token();
	}

	public void refreshAccessToken() {

		String base64EncodedString = null;
		try {
			base64EncodedString = Base64.encodeBase64String((CLIENT_KEY + ":" + CLIENT_SECRET).getBytes("utf-8"));
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		RestTemplate rest = new RestTemplate();

		MultiValueMap<String, String> headers = new LinkedMultiValueMap<String, String>();
		headers.add("Authorization", "Basic " + base64EncodedString);
		headers.add("Content-Type", "application/x-www-form-urlencoded");

		MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
		body.add("grant_type", "refresh_token");
		body.add("refresh_token", getUserRefreshToken());

		HttpEntity<MultiValueMap<String, String>> requestData = new HttpEntity<MultiValueMap<String, String>>(body,
				headers);

		UserFitBitConfig response = null;
		try {
			response = rest.postForObject(REFRESH_TOKEN_URL, requestData, UserFitBitConfig.class);
		} catch (Exception e) {
			e.printStackTrace();
		}

		response.setApplicationUserId(currentUser.getCurrentUser().getUserid());
		fitbitObj = userFitBitConfigDao.save(response);
	}
}

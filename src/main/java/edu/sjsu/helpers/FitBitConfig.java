package edu.sjsu.helpers;

import com.github.scribejava.core.builder.api.DefaultApi20;
import com.github.scribejava.core.model.OAuthConfig;

public class FitBitConfig extends DefaultApi20{
	
	private static final String AUTHORIZE_URL = "https://www.fitbit.com/oauth2/authorize";

	@Override
	public String getAccessTokenEndpoint() {
		
		return "https://api.fitbit.com/oauth2/token";
	}

	@Override
	public String getAuthorizationUrl(OAuthConfig arg0) {
	
		return AUTHORIZE_URL;
	}

}

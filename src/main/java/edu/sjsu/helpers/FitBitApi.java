package edu.sjsu.helpers;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.oauth.OAuth20Service;

public class FitBitApi {

	FitBitConfig fitBitConfig = new FitBitConfig();
	
	final OAuth20Service service = new ServiceBuilder().apiKey("227LXW").apiSecret("c78815c756aefe00cb7373dea8cfbe74")
			.callback("http://localhost:8080/resonance/callback").scope("profile").scope("heartrate").debug()
			.build(fitBitConfig);

	String authorize = service.getAuthorizationUrl();
	
	
	public void printurl(){
		System.out.println(authorize);
	}
}

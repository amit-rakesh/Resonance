package edu.sjsu.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@Entity
@JsonIgnoreProperties(ignoreUnknown = true)
@Table(name = "fitbit")
public class UserFitBitConfig {

	@JsonProperty
	@Id
	@Column(name = "userId")
	private long applicationUserId;

	@JsonProperty
	@Column(name = "fitbitUserId")
	private String user_id;

	@JsonProperty
	@Column(name = "accessToken")
	private String access_token;

	@JsonProperty
	@Column(name = "refreshToken")
	private String refresh_token;

	@JsonProperty
	@Column(name = "tokenType")
	private String token_type;

	@JsonProperty
	@Column(name = "expiresin")
	private long expires_in;

	public UserFitBitConfig() {

	}

	public UserFitBitConfig(@JsonProperty long applicationUserId, @JsonProperty String user_id,
			@JsonProperty String access_token, @JsonProperty String refresh_token, @JsonProperty String token_type,
			@JsonProperty long expires_in) {
		this.applicationUserId = applicationUserId;
		this.user_id = user_id;
		this.access_token = access_token;
		this.refresh_token = refresh_token;
		this.token_type = token_type;
		this.expires_in = expires_in;
	}

	public UserFitBitConfig(@JsonProperty String user_id, @JsonProperty String access_token,
			@JsonProperty String refresh_token, @JsonProperty String token_type, @JsonProperty long expires_in) {
		super();
		this.user_id = user_id;
		this.access_token = access_token;
		this.refresh_token = refresh_token;
		this.token_type = token_type;
		this.expires_in = expires_in;
	}

	public long getApplicationUserId() {
		return applicationUserId;
	}

	public void setApplicationUserId(long applicationUserId) {
		this.applicationUserId = applicationUserId;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getAccess_token() {
		return access_token;
	}

	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}

	public String getRefresh_token() {
		return refresh_token;
	}

	public void setRefresh_token(String refresh_token) {
		this.refresh_token = refresh_token;
	}

	public String getToken_type() {
		return token_type;
	}

	public void setToken_type(String token_type) {
		this.token_type = token_type;
	}

	public long getExpires_in() {
		return expires_in;
	}

	public void setExpires_in(long expires_in) {
		this.expires_in = expires_in;
	}
	
	

}

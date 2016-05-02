package edu.sjsu.models;

import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import static javax.persistence.FetchType.LAZY;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Entity
@Table(name = "users")
public class User {

	@Id
	@JsonProperty
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "userid")
	private long userid;

	// The user's name
	@NotNull
	@JsonProperty
	@Column(name = "name")
	private String name;

	// The user's email
	@NotNull
	@JsonProperty
	@Column(name = "email")
	private String email;

	@NotNull
	@JsonProperty
	@Column(name = "password")
	private String password;

	@NotNull
	@JsonProperty
	@Column(name = "country")
	private String country;

	@NotNull
	@JsonProperty
	@Column(name = "state")
	private String state;

	@JsonProperty
	@Column(name = "sessionid")
	private Long sessionid;

	@JsonProperty
	@Column(name = "token")
	private String token;

	@JsonProperty
	@Column(name = "verified")
	private Boolean verified;
	
	
	@Basic(fetch=LAZY)
	@Column(name = "UserPicture")
	private byte[] userPicture;

	@JsonProperty
	@Column(name = "age")
	private Integer age;
	
	@JsonProperty
	@Column(name = "sex")
	private String sex;
	
	
	// Constructors
	public User() {
		
	}

	public User(long userid) {
		this.userid = userid;
	}

	public User(@JsonProperty String name, @JsonProperty String email) {
		this.email = email;
		this.name = name;
	}

	public User(@JsonProperty String name, @JsonProperty String email, @JsonProperty String password,
			@JsonProperty String country, @JsonProperty String state, @JsonProperty String token,
			@JsonProperty boolean verified, @JsonProperty byte[] userPicture) {
		this.name = name;
		this.email = email;
		this.password = password;
		this.country = country;
		this.state = state;
		this.token = token;
		this.verified = verified;
		this.userPicture = userPicture;
	}
	
	public User(@JsonProperty String name, @JsonProperty String email, @JsonProperty String password,
			@JsonProperty String country, @JsonProperty String state, @JsonProperty String token,
			@JsonProperty boolean verified, @JsonProperty byte[] userPicture,@JsonProperty int age, @JsonProperty String sex) {
		this.name = name;
		this.email = email;
		this.password = password;
		this.country = country;
		this.state = state;
		this.token = token;
		this.verified = verified;
		this.userPicture = userPicture;
		this.age=age;
		this.sex=sex;
	}

	// setters and getters
	@Id
	@Column(name = "userid", unique = true, nullable = false)
	public long getUserid() {
		return userid;
	}

	public void setUserid(long userid) {
		this.userid = userid;
	}

	@Column(name = "name", unique = false, nullable = false)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "email", unique = true, nullable = false)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public String getCountry() {
		return country;
	}

	public String getState() {
		return state;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Long getSessionid() {
		return sessionid;
	}

	public void setSessionid(Long sessionid) {
		this.sessionid = sessionid;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public void setVerified(Boolean verified) {
		this.verified = verified;
	}

	public String getToken() {
		return token;
	}

	public Boolean isVerified() {
		return verified;
	}
	
	public byte[] getUserPicture() {
		return userPicture;
	}

	public void setUserPicture(byte[] userPicture) {
		this.userPicture = userPicture;
	}

	
	@Column(name = "age", unique = false, nullable = true)
	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	@Column(name = "sex", unique = false, nullable = true)
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
	
	

	@Override
	public String toString() {
		return "{" + " \"userid\": " + "\"" + userid + "\"" + ", \"name\": " + "\"" + name + "\"" + ", \"email\": "
				+ "\"" + email + "\"" + ", \"country\": " + "\"" + country + "\"" + ", \"state\": " + "\"" + state
				+ "\"" + ", \"sessionid\": " + "\"" + sessionid + "\"" + '}';
	}

}

package edu.sjsu.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonProperty;

@Entity
@Table(name = "rating")
public class Rating {
	
	@Id
    @JsonProperty
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ratingid")
    private long ratingId;
	
	@JsonProperty
	@Column(name = "songid")
    private long songid;
	
	@JsonProperty
    @Column(name = "userid")
    private long userid;
	
	@JsonProperty
    @Column(name = "rating")
    private int rating;
	
	public Rating(){
		
	}

	public Rating(@JsonProperty long songid, @JsonProperty long userid, @JsonProperty int rating) {
		this.songid = songid;
		this.userid = userid;
		this.rating = rating;
	}

	public long getRatingId() {
		return ratingId;
	}
	
	@Id
    @Column(name = "ratingid", unique = true, nullable = false)
	public void setRatingId(long ratingId) {
		this.ratingId = ratingId;
	}

	public long getSongId() {
		return songid;
	}

	public void setSongId(long songid) {
		this.songid = songid;
	}

	public long getUser() {
		return userid;
	}

	public void setUser(long userid) {
		this.userid = userid;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	
	

}

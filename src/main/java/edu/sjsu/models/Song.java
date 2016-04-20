package edu.sjsu.models;

import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

/**
 * Created by harkirat singh on 3/8/2016.
 */

@Entity
@Table(name = "songs")
public class Song {



    @Id
    @JsonProperty
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "songid")
    private long songId;


    @NotNull
    @JsonProperty
    @Column(name = "title")
    private String songTitle;



    @NotNull
    @JsonProperty
    @Column(name = "userid")
    private String uploadedByUserId;
    
    @NotNull
    @JsonProperty
    @Column(name = "path")
    private String songPath;

    
   
    @JsonProperty
    @Column(name = "date")
    private Long date;
    
    @JsonProperty
    @Column(name = "playingUrl")
    private String playingUrl;

    
    public Song() {
    }

    public Song(long songId) {
        this.songId=songId;
    }

    public Song(@JsonProperty String songTitle, @JsonProperty String uploadedByUserId) {
        this.songTitle = songTitle;
       
        this.uploadedByUserId=uploadedByUserId;
    }

    public Song(@JsonProperty String songTitle, @JsonProperty String uploadedByUserId,@JsonProperty String songPath) {
        this.songTitle = songTitle;
        this.songPath=songPath;
        this.uploadedByUserId=uploadedByUserId;
    }
    
    public Song(@JsonProperty String songTitle, @JsonProperty String uploadedByUserId,@JsonProperty String songPath, @JsonProperty long date) {
        this.songTitle = songTitle;
        this.songPath=songPath;
        this.uploadedByUserId=uploadedByUserId;
        this.date=date;
    }

    public long getDate() {
		return date;
	}

    @Column(name = "date", unique = false, nullable = true)
	public void setDate(long date) {
		this.date = date;
	}

	public long getSongId() {
        return songId;
    }

    public String getSongTitle() {
        return songTitle;
    }

  
    public String getUploadedByUserId() {
        return uploadedByUserId;
    }

    @Id
    @Column(name = "songid", unique = true, nullable = false)
    public void setSongId(long songId) {
        this.songId = songId;
    }

    @Column(name = "title", unique = false, nullable = false)
    public void setSongTitle(String songTitle) {
        this.songTitle = songTitle;
    }

  
    

    public String getSongPath() {
		return songPath;
	}

    @Column(name = "path", unique = false, nullable = false)
	public void setSongPath(String songPath) {
		this.songPath = songPath;
	}

	@Column(name = "userid", unique = false, nullable = false)
    public void setUploadedByUserId(String uploadedByUserId) {
        this.uploadedByUserId = uploadedByUserId;
    }

	public String getPlayingUrl() {
		return playingUrl;
	}

	@Column(name = "playingUrl", unique = false, nullable = true)
	public void setPlayingUrl(String playingUrl) {
		this.playingUrl = playingUrl;
	}
	
	
}


package edu.sjsu.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonProperty;

@Entity
@Table(name = "events")
public class Event {
	
	@Id
	@JsonProperty
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "eventid")
	private long eventId;

	@JsonProperty
	@Column(name = "eventtitile")
	private String eventTitle;

	@JsonProperty
	@Column(name = "userid")
	private Long createdByUserId;
	
	@JsonProperty
	@Column(name = "longitute")
	private Double longitute;
	
	@JsonProperty
	@Column(name = "latitude")
	private Double latitude;
	
	@JsonProperty
	@Column(name = "address")
	private String address;
	
	

	public Event(@JsonProperty String eventTitle, @JsonProperty Long createdByUserId, @JsonProperty Double longitute, @JsonProperty Double latitude, @JsonProperty String address) {
		super();
		this.eventTitle = eventTitle;
		this.createdByUserId = createdByUserId;
		this.longitute = longitute;
		this.latitude = latitude;
		this.address = address;
	}

	public long getEventId() {
		return eventId;
	}

	@Id
    @Column(name = "eventid", unique = true, nullable = false)
	public void setEventId(long eventId) {
		this.eventId = eventId;
	}

	public String getEventTitle() {
		return eventTitle;
	}

	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}

	public Long getCreatedByUserId() {
		return createdByUserId;
	}

	public void setCreatedByUserId(Long createdByUserId) {
		this.createdByUserId = createdByUserId;
	}

	public Double getLongitute() {
		return longitute;
	}

	public void setLongitute(Double longitute) {
		this.longitute = longitute;
	}

	public Double getLatitude() {
		return latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	

}

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
@Table(name = "blogs")
public class Blog {

	@Id
	@JsonProperty
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "blogid")
	private long blogId;

	@NotNull
	@JsonProperty
	@Column(name = "title")
	private String blogTitle;

	@NotNull
	@JsonProperty
	@Column(name = "userid")
	private Long uploadedByUserId;

	@JsonProperty
	@Column(name = "date")
	private Long date;

	@Column(name = "blog", columnDefinition = "TEXT")
	private String blogContent;

	public Blog() {

	}

	public Blog(@JsonProperty String blogTitle, @JsonProperty Long uploadedByUserId, @JsonProperty long date,
			@JsonProperty String blogContent) {
		this.blogTitle = blogTitle;
		this.uploadedByUserId = uploadedByUserId;
		this.date = date;
		this.blogContent = blogContent;
	}

	public long getBlogId() {
		return blogId;
	}
	
	@Id
    @Column(name = "songid", unique = true, nullable = false)
	public void setBlogId(long blogId) {
		this.blogId = blogId;
	}

	public String getBlogTitle() {
		return blogTitle;
	}

	public void setBlogTitle(String blogTitle) {
		this.blogTitle = blogTitle;
	}

	public Long getUploadedByUserId() {
		return uploadedByUserId;
	}

	public void setUploadedByUserId(Long uploadedByUserId) {
		this.uploadedByUserId = uploadedByUserId;
	}

	public Long getDate() {
		return date;
	}

	public void setDate(Long date) {
		this.date = date;
	}

	public String getBlogContent() {
		return blogContent;
	}

	public void setBlogContent(String blogContent) {
		this.blogContent = blogContent;
	}

}

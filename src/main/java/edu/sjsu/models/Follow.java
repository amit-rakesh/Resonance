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
@Table(name = "follow")
public class Follow {
	
	    @Id
	    @JsonProperty
	    @GeneratedValue(strategy = GenerationType.AUTO)
	    @Column(name = "followid")
	    private long followId;
	    
	    @NotNull
	    @JsonProperty
	    @Column(name = "user1")
	    private long user1Id;
	    
	    @NotNull
	    @JsonProperty
	    @Column(name = "user2")
	    private long user2Id;

	    public Follow(){
	    	
	    }
	    
		public Follow(@JsonProperty long user1Id, @JsonProperty long user2Id) {
			super();
			this.user1Id = user1Id;
			this.user2Id = user2Id;
		}


		public long getFollowId() {
			return followId;
		}

		
		@Id
	    @Column(name = "followid", unique = true, nullable = false)
		public void setFollowId(long followId) {
			this.followId = followId;
		}

		public long getUser1Id() {
			return user1Id;
		}

	
	    @Column(name = "user1", unique = false, nullable = false)
		public void setUser1Id(long user1Id) {
			this.user1Id = user1Id;
		}

		public long getUser2Id() {
			return user2Id;
		}

		
	    @Column(name = "user2", unique = false, nullable = false)
		public void setUser2Id(long user2Id) {
			this.user2Id = user2Id;
		}
	    
	    

}

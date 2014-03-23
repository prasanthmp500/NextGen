package org.springframework.nextgen.model;

import java.io.Serializable;
import java.util.List;

public class Questionnaire implements Serializable {


	private String userProfile;
	
	private List<Question> feedback;
	
	private String additionalComments;

	
	public Questionnaire(String userProfile, List<Question> feedback, String additionalComments) {
		super();
		this.userProfile = userProfile;
		this.userProfile = userProfile;
		this.feedback = feedback;
		this.additionalComments = additionalComments;
	}

	
	public List<Question> getFeedback() {
		return feedback;
	}
	
	public void setFeedback(List<Question> feedback) {
		this.feedback = feedback;
	}
	
	public String getAdditionalComments() {
		return additionalComments;
	}
	
	public void setAdditionalComments(String additionalComments) {
		this.additionalComments = additionalComments;
	}

	
	public String getUserProfile() {
		return userProfile;
	}
	

	public void setUserProfile(String userProfile) {
		this.userProfile = userProfile;
	}
}

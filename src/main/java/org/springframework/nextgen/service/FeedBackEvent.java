package org.springframework.nextgen.service;

import org.springframework.context.ApplicationEvent;
import org.springframework.nextgen.model.Questionnaire;

public class FeedBackEvent extends ApplicationEvent {

	private static final long serialVersionUID = 1L;
	
	public FeedBackEvent(Object source) {
		super(source);

	}
	

}

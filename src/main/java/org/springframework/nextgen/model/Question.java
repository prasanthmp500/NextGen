package org.springframework.nextgen.model;

public class Question { 

	private String question;
	
	private String value;

	private int order;
	
	
	public Question(String question, String value, int order) {
		super();
		this.question = question;
		this.value = value;
		this.order = order;
	}
	
	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public int getOrder() {
		return order;
	}

	public void setOrder(int order) {
		this.order = order;
	}
	
}

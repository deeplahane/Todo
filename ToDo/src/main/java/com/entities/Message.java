package com.entities;

public class Message {
	
	private String content;
	private String cssClass;
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCssClass() {
		return cssClass;
	}
	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}
	
	public Message() {
		super();
	}
	public Message(String content, String cssClass) {
		super();
		this.content = content;
		this.cssClass = cssClass;
	}
	
}

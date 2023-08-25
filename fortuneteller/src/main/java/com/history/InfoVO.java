package com.history;

import java.sql.Timestamp;

public class InfoVO {
	
	private int num;
	private String id;
	private Timestamp regdate;
	private String image;
	private String testName;
	private String testPage;
	
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getTestName() {
		return testName;
	}
	public void setTestName(String testName) {
		this.testName = testName;
	}
	public String getTestPage() {
		return testPage;
	}
	public void setTestPage(String testPage) {
		this.testPage = testPage;
	}
	
	
	
	
	
	
	
	
}

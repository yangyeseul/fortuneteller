package com.constellation;

import java.sql.Timestamp;

public class ConstellationVO {
	
	private int constellMonth;
	private int constellDay;
	private String constellName;
	private String testContent;
	private String color;
	private String item;
	private String name;
	
	//private int readcount;
	private Timestamp regdate;
	private String id;
	private int num;
	private String img;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getConstellMonth() {
		return constellMonth;
	}
	public void setConstellMonth(int constellMonth) {
		this.constellMonth = constellMonth;
	}
	public int getConstellDay() {
		return constellDay;
	}
	public void setConstellDay(int constellDay) {
		this.constellDay = constellDay;
	}
	public String getConstellName() {
		return constellName;
	}
	public void setConstellName(String constellName) {
		this.constellName = constellName;
	}
	public String getTestContent() {
		return testContent;
	}
	public void setTestContent(String testContent) {
		this.testContent = testContent;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	
	
	//
	/*
	 * public int getReadcount() { return readcount; } public void setReadcount(int
	 * readcount) { this.readcount = readcount; }
	 */
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	
	
	
	
	
	
	
}

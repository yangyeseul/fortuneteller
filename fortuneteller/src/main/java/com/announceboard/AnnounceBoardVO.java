package com.announceboard;

import java.sql.Date;

public class AnnounceBoardVO {
	private int nt_num;
	private String nt_writer;
	private String nt_subject;
	private int nt_readcount;
	private Date nt_regdate;
	private Date nt_adjudate;
	private String nt_content;
	public int getNt_num() {
		return nt_num;
	}
	public void setNt_num(int nt_num) {
		this.nt_num = nt_num;
	}
	public String getNt_writer() {
		return nt_writer;
	}
	public void setNt_writer(String nt_writer) {
		this.nt_writer = nt_writer;
	}
	public String getNt_subject() {
		return nt_subject;
	}
	public void setNt_subject(String nt_subject) {
		this.nt_subject = nt_subject;
	}
	public int getNt_readcount() {
		return nt_readcount;
	}
	public void setNt_readcount(int nt_readcount) {
		this.nt_readcount = nt_readcount;
	}
	public Date getNt_regdate() {
		return nt_regdate;
	}
	public void setNt_regdate(Date nt_regdate) {
		this.nt_regdate = nt_regdate;
	}
	public Date getNt_adjudate() {
		return nt_adjudate;
	}
	public void setNt_adjudate(Date nt_adjudate) {
		this.nt_adjudate = nt_adjudate;
	}
	public String getNt_content() {
		return nt_content;
	}
	public void setNt_content(String nt_content) {
		this.nt_content = nt_content;
	}

	
	
}

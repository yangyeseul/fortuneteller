package com.qnaboard.comment;

import java.sql.Date;

public class QnaCommentVO {
	private int com_num;
	private String com_writer;
	private String com_content;
	private Date com_regdate;
	private int com_step;
	private int com_depth;
	private int com_ref;
	public int getCom_num() {
		return com_num;
	}
	public void setCom_num(int com_num) {
		this.com_num = com_num;
	}
	public String getCom_writer() {
		return com_writer;
	}
	public void setCom_writer(String com_writer) {
		this.com_writer = com_writer;
	}
	public String getCom_content() {
		return com_content;
	}
	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}
	public Date getCom_regdate() {
		return com_regdate;
	}
	public void setCom_regdate(Date com_regdate) {
		this.com_regdate = com_regdate;
	}
	public int getCom_step() {
		return com_step;
	}
	public void setCom_step(int com_step) {
		this.com_step = com_step;
	}
	public int getCom_depth() {
		return com_depth;
	}
	public void setCom_depth(int com_depth) {
		this.com_depth = com_depth;
	}
	public int getCom_ref() {
		return com_ref;
	}
	public void setCom_ref(int com_ref) {
		this.com_ref = com_ref;
	}
	
	
}

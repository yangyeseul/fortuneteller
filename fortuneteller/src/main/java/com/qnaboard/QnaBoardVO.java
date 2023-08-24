package com.qnaboard;

import java.sql.Date;

public class QnaBoardVO {
	private int qa_num;
	private String qa_writer;
	private String qa_subject;
	private int qa_readcount;
	private int qa_ref;
	private int qa_step;
	private int qa_depth;
	private Date qa_regdate;
	private String qa_content;
	
	public int getQa_num() {
		return qa_num;
	}
	public void setQa_num(int qa_num) {
		this.qa_num = qa_num;
	}
	public String getQa_writer() {
		return qa_writer;
	}
	public void setQa_writer(String qa_writer) {
		this.qa_writer = qa_writer;
	}
	public String getQa_subject() {
		return qa_subject;
	}
	public void setQa_subject(String qa_subject) {
		this.qa_subject = qa_subject;
	}
	public int getQa_readcount() {
		return qa_readcount;
	}
	public void setQa_readcount(int qa_readcount) {
		this.qa_readcount = qa_readcount;
	}
	public int getQa_ref() {
		return qa_ref;
	}
	public void setQa_ref(int qa_ref) {
		this.qa_ref = qa_ref;
	}
	public int getQa_step() {
		return qa_step;
	}
	public void setQa_step(int qa_step) {
		this.qa_step = qa_step;
	}
	public int getQa_depth() {
		return qa_depth;
	}
	public void setQa_depth(int qa_depth) {
		this.qa_depth = qa_depth;
	}
	public Date getQa_regdate() {
		return qa_regdate;
	}
	public void setQa_regdate(Date qa_regdate) {
		this.qa_regdate = qa_regdate;
	}
	public String getQa_content() {
		return qa_content;
	}
	public void setQa_content(String qa_content) {
		this.qa_content = qa_content;
	}
	
}

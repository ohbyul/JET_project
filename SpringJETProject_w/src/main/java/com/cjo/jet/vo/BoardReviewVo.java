package com.cjo.jet.vo;

import java.util.Date;

public class BoardReviewVo {
	private int jet_board_review_no;
	private int jet_member_no;
	private String jet_board_review_title;
	private String jet_board_review_content;
	private int jet_board_review_readcount;
	private Date jet_board_review_writedate;
	private int jet_board_review_category_no;
	public BoardReviewVo() {
		super();
	}
	public BoardReviewVo(int jet_board_review_no, int jet_member_no, String jet_board_review_title,
			String jet_board_review_content, int jet_board_review_readcount, Date jet_board_review_writedate,
			int jet_board_review_category_no) {
		super();
		this.jet_board_review_no = jet_board_review_no;
		this.jet_member_no = jet_member_no;
		this.jet_board_review_title = jet_board_review_title;
		this.jet_board_review_content = jet_board_review_content;
		this.jet_board_review_readcount = jet_board_review_readcount;
		this.jet_board_review_writedate = jet_board_review_writedate;
		this.jet_board_review_category_no = jet_board_review_category_no;
	}
	public int getJet_board_review_no() {
		return jet_board_review_no;
	}
	public void setJet_board_review_no(int jet_board_review_no) {
		this.jet_board_review_no = jet_board_review_no;
	}
	public int getJet_member_no() {
		return jet_member_no;
	}
	public void setJet_member_no(int jet_member_no) {
		this.jet_member_no = jet_member_no;
	}
	public String getJet_board_review_title() {
		return jet_board_review_title;
	}
	public void setJet_board_review_title(String jet_board_review_title) {
		this.jet_board_review_title = jet_board_review_title;
	}
	public String getJet_board_review_content() {
		return jet_board_review_content;
	}
	public void setJet_board_review_content(String jet_board_review_content) {
		this.jet_board_review_content = jet_board_review_content;
	}
	public int getJet_board_review_readcount() {
		return jet_board_review_readcount;
	}
	public void setJet_board_review_readcount(int jet_board_review_readcount) {
		this.jet_board_review_readcount = jet_board_review_readcount;
	}
	public Date getJet_board_review_writedate() {
		return jet_board_review_writedate;
	}
	public void setJet_board_review_writedate(Date jet_board_review_writedate) {
		this.jet_board_review_writedate = jet_board_review_writedate;
	}
	public int getJet_board_review_category_no() {
		return jet_board_review_category_no;
	}
	public void setJet_board_review_category_no(int jet_board_review_category_no) {
		this.jet_board_review_category_no = jet_board_review_category_no;
	}
	
	
}

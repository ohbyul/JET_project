package com.cjo.jet.vo;

import java.util.Date;

public class ReviewCommentVo {
	private int jet_board_review_comment_no;
	private int jet_member_no;
	private int jet_board_review_reple_no;
	private String jet_board_review_comment_title;
	private Date jet_board_review_comment_date;
	public ReviewCommentVo() {
		super();
	}
	public ReviewCommentVo(int jet_board_review_comment_no, int jet_member_no, int jet_board_review_reple_no,
			String jet_board_review_comment_title, Date jet_board_review_comment_date) {
		super();
		this.jet_board_review_comment_no = jet_board_review_comment_no;
		this.jet_member_no = jet_member_no;
		this.jet_board_review_reple_no = jet_board_review_reple_no;
		this.jet_board_review_comment_title = jet_board_review_comment_title;
		this.jet_board_review_comment_date = jet_board_review_comment_date;
	}
	public int getJet_board_review_comment_no() {
		return jet_board_review_comment_no;
	}
	public void setJet_board_review_comment_no(int jet_board_review_comment_no) {
		this.jet_board_review_comment_no = jet_board_review_comment_no;
	}
	public int getJet_member_no() {
		return jet_member_no;
	}
	public void setJet_member_no(int jet_member_no) {
		this.jet_member_no = jet_member_no;
	}
	public int getJet_board_review_reple_no() {
		return jet_board_review_reple_no;
	}
	public void setJet_board_review_reple_no(int jet_board_review_reple_no) {
		this.jet_board_review_reple_no = jet_board_review_reple_no;
	}
	public String getJet_board_review_comment_title() {
		return jet_board_review_comment_title;
	}
	public void setJet_board_review_comment_title(String jet_board_review_comment_title) {
		this.jet_board_review_comment_title = jet_board_review_comment_title;
	}
	public Date getJet_board_review_comment_date() {
		return jet_board_review_comment_date;
	}
	public void setJet_board_review_comment_date(Date jet_board_review_comment_date) {
		this.jet_board_review_comment_date = jet_board_review_comment_date;
	}
	
}

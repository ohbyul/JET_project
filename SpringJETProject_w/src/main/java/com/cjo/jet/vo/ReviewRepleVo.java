package com.cjo.jet.vo;

import java.util.Date;

public class ReviewRepleVo {
	private int jet_board_review_reple_no;
	private int jet_member_no;
	private int jet_board_review_no;
	private String jet_board_review_reple_content;
	private Date jet_board_review_reple_date;
	public ReviewRepleVo() {
		super();
	}
	public ReviewRepleVo(int jet_board_review_reple_no, int jet_member_no, int jet_board_review_no,
			String jet_board_review_reple_content, Date jet_board_review_reple_date) {
		super();
		this.jet_board_review_reple_no = jet_board_review_reple_no;
		this.jet_member_no = jet_member_no;
		this.jet_board_review_no = jet_board_review_no;
		this.jet_board_review_reple_content = jet_board_review_reple_content;
		this.jet_board_review_reple_date = jet_board_review_reple_date;
	}
	public int getJet_board_review_reple_no() {
		return jet_board_review_reple_no;
	}
	public void setJet_board_review_reple_no(int jet_board_review_reple_no) {
		this.jet_board_review_reple_no = jet_board_review_reple_no;
	}
	public int getJet_member_no() {
		return jet_member_no;
	}
	public void setJet_member_no(int jet_member_no) {
		this.jet_member_no = jet_member_no;
	}
	public int getJet_board_review_no() {
		return jet_board_review_no;
	}
	public void setJet_board_review_no(int jet_board_review_no) {
		this.jet_board_review_no = jet_board_review_no;
	}
	public String getJet_board_review_reple_content() {
		return jet_board_review_reple_content;
	}
	public void setJet_board_review_reple_content(String jet_board_review_reple_content) {
		this.jet_board_review_reple_content = jet_board_review_reple_content;
	}
	public Date getJet_board_review_reple_date() {
		return jet_board_review_reple_date;
	}
	public void setJet_board_review_reple_date(Date jet_board_review_reple_date) {
		this.jet_board_review_reple_date = jet_board_review_reple_date;
	}
	
}


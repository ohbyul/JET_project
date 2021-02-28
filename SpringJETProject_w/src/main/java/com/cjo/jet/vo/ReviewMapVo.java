package com.cjo.jet.vo;

public class ReviewMapVo {
	private int jet_board_review_map_no;
	private int jet_member_no;
	private int jet_board_review_no;
	private int jet_board_review_map_latitude;
	private int jet_board_review_map_longitude;
	public ReviewMapVo() {
		super();
	}
	public ReviewMapVo(int jet_board_review_map_no, int jet_member_no, int jet_board_review_no,
			int jet_board_review_map_latitude, int jet_board_review_map_longitude) {
		super();
		this.jet_board_review_map_no = jet_board_review_map_no;
		this.jet_member_no = jet_member_no;
		this.jet_board_review_no = jet_board_review_no;
		this.jet_board_review_map_latitude = jet_board_review_map_latitude;
		this.jet_board_review_map_longitude = jet_board_review_map_longitude;
	}
	public int getJet_board_review_map_no() {
		return jet_board_review_map_no;
	}
	public void setJet_board_review_map_no(int jet_board_review_map_no) {
		this.jet_board_review_map_no = jet_board_review_map_no;
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
	public int getJet_board_review_map_latitude() {
		return jet_board_review_map_latitude;
	}
	public void setJet_board_review_map_latitude(int jet_board_review_map_latitude) {
		this.jet_board_review_map_latitude = jet_board_review_map_latitude;
	}
	public int getJet_board_review_map_longitude() {
		return jet_board_review_map_longitude;
	}
	public void setJet_board_review_map_longitude(int jet_board_review_map_longitude) {
		this.jet_board_review_map_longitude = jet_board_review_map_longitude;
	}
	
}

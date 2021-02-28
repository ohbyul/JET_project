package com.cjo.jet.vo;

public class PartyRatingVo {

	private int jet_party_rating_no;
	private int jet_board_party_no;
	private int jet_member_no;
	private String jet_party_rating_value;
	public PartyRatingVo() {
		super();
	}
	public PartyRatingVo(int jet_party_rating_no, int jet_board_party_no, int jet_member_no,
			String jet_party_rating_value) {
		super();
		this.jet_party_rating_no = jet_party_rating_no;
		this.jet_board_party_no = jet_board_party_no;
		this.jet_member_no = jet_member_no;
		this.jet_party_rating_value = jet_party_rating_value;
	}
	public int getJet_party_rating_no() {
		return jet_party_rating_no;
	}
	public void setJet_party_rating_no(int jet_party_rating_no) {
		this.jet_party_rating_no = jet_party_rating_no;
	}
	public int getJet_board_party_no() {
		return jet_board_party_no;
	}
	public void setJet_board_party_no(int jet_board_party_no) {
		this.jet_board_party_no = jet_board_party_no;
	}
	public int getJet_member_no() {
		return jet_member_no;
	}
	public void setJet_member_no(int jet_member_no) {
		this.jet_member_no = jet_member_no;
	}
	public String getJet_party_rating_value() {
		return jet_party_rating_value;
	}
	public void setJet_party_rating_value(String jet_party_rating_value) {
		this.jet_party_rating_value = jet_party_rating_value;
	}
	
	
	
	
}

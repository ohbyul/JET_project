package com.cjo.jet.vo;

import java.util.Date;

public class PartySingoVo {

	private int jet_board_party_singo_no;
	private int jet_board_party_no;
	private int jet_member_no;
	private String jet_board_party_singo_reason;
	private Date jet_board_party_singo_date;
	public PartySingoVo() {
		super();
	}
	public PartySingoVo(int jet_board_party_singo_no, int jet_board_party_no, int jet_member_no,
			String jet_board_party_singo_reason, Date jet_board_party_singo_date) {
		super();
		this.jet_board_party_singo_no = jet_board_party_singo_no;
		this.jet_board_party_no = jet_board_party_no;
		this.jet_member_no = jet_member_no;
		this.jet_board_party_singo_reason = jet_board_party_singo_reason;
		this.jet_board_party_singo_date = jet_board_party_singo_date;
	}
	public int getJet_board_party_singo_no() {
		return jet_board_party_singo_no;
	}
	public void setJet_board_party_singo_no(int jet_board_party_singo_no) {
		this.jet_board_party_singo_no = jet_board_party_singo_no;
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
	public String getJet_board_party_singo_reason() {
		return jet_board_party_singo_reason;
	}
	public void setJet_board_party_singo_reason(String jet_board_party_singo_reason) {
		this.jet_board_party_singo_reason = jet_board_party_singo_reason;
	}
	public Date getJet_board_party_singo_date() {
		return jet_board_party_singo_date;
	}
	public void setJet_board_party_singo_date(Date jet_board_party_singo_date) {
		this.jet_board_party_singo_date = jet_board_party_singo_date;
	}
	
	
	
	
	
}

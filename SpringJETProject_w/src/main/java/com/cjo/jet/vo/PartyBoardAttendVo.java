package com.cjo.jet.vo;

import java.util.Date;

public class PartyBoardAttendVo {

	private int jet_party_attend_no;
	private int jet_board_party_no;
	private int jet_member_no;
	private String jet_party_attend_content;
    private int jet_party_attend_state_no;
    private Date jet_party_attend_writedate;
	public PartyBoardAttendVo() {
		super();
	}
	public PartyBoardAttendVo(int jet_party_attend_no, int jet_board_party_no, int jet_member_no,
			String jet_party_attend_content, int jet_party_attend_state_no, Date jet_party_attend_writedate) {
		super();
		this.jet_party_attend_no = jet_party_attend_no;
		this.jet_board_party_no = jet_board_party_no;
		this.jet_member_no = jet_member_no;
		this.jet_party_attend_content = jet_party_attend_content;
		this.jet_party_attend_state_no = jet_party_attend_state_no;
		this.jet_party_attend_writedate = jet_party_attend_writedate;
	}
	public int getJet_party_attend_no() {
		return jet_party_attend_no;
	}
	public void setJet_party_attend_no(int jet_party_attend_no) {
		this.jet_party_attend_no = jet_party_attend_no;
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
	public String getJet_party_attend_content() {
		return jet_party_attend_content;
	}
	public void setJet_party_attend_content(String jet_party_attend_content) {
		this.jet_party_attend_content = jet_party_attend_content;
	}
	public int getJet_party_attend_state_no() {
		return jet_party_attend_state_no;
	}
	public void setJet_party_attend_state_no(int jet_party_attend_state_no) {
		this.jet_party_attend_state_no = jet_party_attend_state_no;
	}
	public Date getJet_party_attend_writedate() {
		return jet_party_attend_writedate;
	}
	public void setJet_party_attend_writedate(Date jet_party_attend_writedate) {
		this.jet_party_attend_writedate = jet_party_attend_writedate;
	}
    
    
    
	
}

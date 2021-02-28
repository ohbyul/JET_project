package com.cjo.jet.vo;

import java.util.Date;

public class PartyChatVo {

	private int jet_party_chat_no;
	private int jet_member_no;
	private int jet_board_party_no;
	private String jet_party_chat_content;
    private Date jet_party_chat_writedate;
	public PartyChatVo() {
		super();
	}
	public PartyChatVo(int jet_party_chat_no, int jet_member_no, int jet_board_party_no, String jet_party_chat_content,
			Date jet_party_chat_writedate) {
		super();
		this.jet_party_chat_no = jet_party_chat_no;
		this.jet_member_no = jet_member_no;
		this.jet_board_party_no = jet_board_party_no;
		this.jet_party_chat_content = jet_party_chat_content;
		this.jet_party_chat_writedate = jet_party_chat_writedate;
	}
	public int getJet_party_chat_no() {
		return jet_party_chat_no;
	}
	public void setJet_party_chat_no(int jet_party_chat_no) {
		this.jet_party_chat_no = jet_party_chat_no;
	}
	public int getJet_member_no() {
		return jet_member_no;
	}
	public void setJet_member_no(int jet_member_no) {
		this.jet_member_no = jet_member_no;
	}
	public int getJet_board_party_no() {
		return jet_board_party_no;
	}
	public void setJet_board_party_no(int jet_board_party_no) {
		this.jet_board_party_no = jet_board_party_no;
	}
	public String getJet_party_chat_content() {
		return jet_party_chat_content;
	}
	public void setJet_party_chat_content(String jet_party_chat_content) {
		this.jet_party_chat_content = jet_party_chat_content;
	}
	public Date getJet_party_chat_writedate() {
		return jet_party_chat_writedate;
	}
	public void setJet_party_chat_writedate(Date jet_party_chat_writedate) {
		this.jet_party_chat_writedate = jet_party_chat_writedate;
	}
	
	

}

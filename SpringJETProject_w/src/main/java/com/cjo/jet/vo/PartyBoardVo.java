package com.cjo.jet.vo;

import java.util.Date;

public class PartyBoardVo {

	private int jet_board_party_no;
	private int jet_member_no;
	private int jet_board_travelplan_no;
	private String jet_board_party_title;
	private String jet_board_party_content;
    private int jet_board_party_readcount;
    private int jet_board_party_headcount;
    private int jet_board_party_fixcount;
    private Date jet_board_party_startgather;
    private Date jet_board_party_endgather;
    private Date jet_board_party_tsday;
    private Date jet_board_party_writedate;
	public PartyBoardVo() {
		super();
	}
	public PartyBoardVo(int jet_board_party_no, int jet_member_no, int jet_board_travelplan_no,
			String jet_board_party_title, String jet_board_party_content, int jet_board_party_readcount,
			int jet_board_party_headcount, int jet_board_party_fixcount, Date jet_board_party_startgather,
			Date jet_board_party_endgather, Date jet_board_party_tsday, Date jet_board_party_writedate) {
		super();
		this.jet_board_party_no = jet_board_party_no;
		this.jet_member_no = jet_member_no;
		this.jet_board_travelplan_no = jet_board_travelplan_no;
		this.jet_board_party_title = jet_board_party_title;
		this.jet_board_party_content = jet_board_party_content;
		this.jet_board_party_readcount = jet_board_party_readcount;
		this.jet_board_party_headcount = jet_board_party_headcount;
		this.jet_board_party_fixcount = jet_board_party_fixcount;
		this.jet_board_party_startgather = jet_board_party_startgather;
		this.jet_board_party_endgather = jet_board_party_endgather;
		this.jet_board_party_tsday = jet_board_party_tsday;
		this.jet_board_party_writedate = jet_board_party_writedate;
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
	public int getJet_board_travelplan_no() {
		return jet_board_travelplan_no;
	}
	public void setJet_board_travelplan_no(int jet_board_travelplan_no) {
		this.jet_board_travelplan_no = jet_board_travelplan_no;
	}
	public String getJet_board_party_title() {
		return jet_board_party_title;
	}
	public void setJet_board_party_title(String jet_board_party_title) {
		this.jet_board_party_title = jet_board_party_title;
	}
	public String getJet_board_party_content() {
		return jet_board_party_content;
	}
	public void setJet_board_party_content(String jet_board_party_content) {
		this.jet_board_party_content = jet_board_party_content;
	}
	public int getJet_board_party_readcount() {
		return jet_board_party_readcount;
	}
	public void setJet_board_party_readcount(int jet_board_party_readcount) {
		this.jet_board_party_readcount = jet_board_party_readcount;
	}
	public int getJet_board_party_headcount() {
		return jet_board_party_headcount;
	}
	public void setJet_board_party_headcount(int jet_board_party_headcount) {
		this.jet_board_party_headcount = jet_board_party_headcount;
	}
	public int getJet_board_party_fixcount() {
		return jet_board_party_fixcount;
	}
	public void setJet_board_party_fixcount(int jet_board_party_fixcount) {
		this.jet_board_party_fixcount = jet_board_party_fixcount;
	}
	public Date getJet_board_party_startgather() {
		return jet_board_party_startgather;
	}
	public void setJet_board_party_startgather(Date jet_board_party_startgather) {
		this.jet_board_party_startgather = jet_board_party_startgather;
	}
	public Date getJet_board_party_endgather() {
		return jet_board_party_endgather;
	}
	public void setJet_board_party_endgather(Date jet_board_party_endgather) {
		this.jet_board_party_endgather = jet_board_party_endgather;
	}
	public Date getJet_board_party_tsday() {
		return jet_board_party_tsday;
	}
	public void setJet_board_party_tsday(Date jet_board_party_tsday) {
		this.jet_board_party_tsday = jet_board_party_tsday;
	}
	public Date getJet_board_party_writedate() {
		return jet_board_party_writedate;
	}
	public void setJet_board_party_writedate(Date jet_board_party_writedate) {
		this.jet_board_party_writedate = jet_board_party_writedate;
	}

    
}

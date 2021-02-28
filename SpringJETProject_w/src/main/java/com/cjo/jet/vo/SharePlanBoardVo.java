package com.cjo.jet.vo;

import java.util.Date;

public class SharePlanBoardVo {
	private int jet_board_shareplan_no;
	private int jet_member_no;
	private int jet_board_travelplan_no;
	private String jet_board_shareplan_title;
	private String jet_board_shareplan_content;
	private int jet_board_shareplan_readcount;
	private Date jet_board_shareplan_writedate;
	private int jet_board_shareplan_category;
	public SharePlanBoardVo() {
		super();
	}
	public SharePlanBoardVo(int jet_board_shareplan_no, int jet_member_no, int jet_board_travelplan_no,
			String jet_board_shareplan_title, String jet_board_shareplan_content, int jet_board_shareplan_readcount,
			Date jet_board_shareplan_writedate, int jet_board_shareplan_category) {
		super();
		this.jet_board_shareplan_no = jet_board_shareplan_no;
		this.jet_member_no = jet_member_no;
		this.jet_board_travelplan_no = jet_board_travelplan_no;
		this.jet_board_shareplan_title = jet_board_shareplan_title;
		this.jet_board_shareplan_content = jet_board_shareplan_content;
		this.jet_board_shareplan_readcount = jet_board_shareplan_readcount;
		this.jet_board_shareplan_writedate = jet_board_shareplan_writedate;
		this.jet_board_shareplan_category = jet_board_shareplan_category;
	}
	public int getJet_board_shareplan_no() {
		return jet_board_shareplan_no;
	}
	public void setJet_board_shareplan_no(int jet_board_shareplan_no) {
		this.jet_board_shareplan_no = jet_board_shareplan_no;
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
	public String getJet_board_shareplan_title() {
		return jet_board_shareplan_title;
	}
	public void setJet_board_shareplan_title(String jet_board_shareplan_title) {
		this.jet_board_shareplan_title = jet_board_shareplan_title;
	}
	public String getJet_board_shareplan_content() {
		return jet_board_shareplan_content;
	}
	public void setJet_board_shareplan_content(String jet_board_shareplan_content) {
		this.jet_board_shareplan_content = jet_board_shareplan_content;
	}
	public int getJet_board_shareplan_readcount() {
		return jet_board_shareplan_readcount;
	}
	public void setJet_board_shareplan_readcount(int jet_board_shareplan_readcount) {
		this.jet_board_shareplan_readcount = jet_board_shareplan_readcount;
	}
	public Date getJet_board_shareplan_writedate() {
		return jet_board_shareplan_writedate;
	}
	public void setJet_board_shareplan_writedate(Date jet_board_shareplan_writedate) {
		this.jet_board_shareplan_writedate = jet_board_shareplan_writedate;
	}
	public int getJet_board_shareplan_category() {
		return jet_board_shareplan_category;
	}
	public void setJet_board_shareplan_category(int jet_board_shareplan_category) {
		this.jet_board_shareplan_category = jet_board_shareplan_category;
	}
	
}

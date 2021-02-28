package com.cjo.jet.vo;

import java.util.Date;

public class KnowhowBoardVo {
	private int jet_board_knowhow_no;
	private int jet_member_no;
	private String jet_board_knowhow_title;
	private String jet_board_knowhow_content;
	private int jet_board_knowhow_readcount;
	private Date jet_board_knowhow_writedate;
	private int jet_board_knowhow_category_no;
	
	public KnowhowBoardVo() {
		super();
	}
	
	public KnowhowBoardVo(int jet_board_knowhow_no, int jet_member_no, String jet_board_knowhow_title,
			String jet_board_knowhow_content, int jet_board_knowhow_readcount, Date jet_board_knowhow_writedate,
			int jet_board_knowhow_category_no) {
		super();
		this.jet_board_knowhow_no = jet_board_knowhow_no;
		this.jet_member_no = jet_member_no;
		this.jet_board_knowhow_title = jet_board_knowhow_title;
		this.jet_board_knowhow_content = jet_board_knowhow_content;
		this.jet_board_knowhow_readcount = jet_board_knowhow_readcount;
		this.jet_board_knowhow_writedate = jet_board_knowhow_writedate;
		this.jet_board_knowhow_category_no = jet_board_knowhow_category_no;
	}
	
	public int getJet_board_knowhow_no() {
		return jet_board_knowhow_no;
	}
	public void setJet_board_knowhow_no(int jet_board_knowhow_no) {
		this.jet_board_knowhow_no = jet_board_knowhow_no;
	}
	public int getJet_member_no() {
		return jet_member_no;
	}
	public void setJet_member_no(int jet_member_no) {
		this.jet_member_no = jet_member_no;
	}
	public String getJet_board_knowhow_title() {
		return jet_board_knowhow_title;
	}
	public void setJet_board_knowhow_title(String jet_board_knowhow_title) {
		this.jet_board_knowhow_title = jet_board_knowhow_title;
	}
	public String getJet_board_knowhow_content() {
		return jet_board_knowhow_content;
	}
	public void setJet_board_knowhow_content(String jet_board_knowhow_content) {
		this.jet_board_knowhow_content = jet_board_knowhow_content;
	}
	public int getJet_board_knowhow_readcount() {
		return jet_board_knowhow_readcount;
	}
	public void setJet_board_knowhow_readcount(int jet_board_knowhow_readcount) {
		this.jet_board_knowhow_readcount = jet_board_knowhow_readcount;
	}
	public Date getJet_board_knowhow_writedate() {
		return jet_board_knowhow_writedate;
	}
	public void setJet_board_knowhow_writedate(Date jet_board_knowhow_writedate) {
		this.jet_board_knowhow_writedate = jet_board_knowhow_writedate;
	}
	public int getJet_board_knowhow_category_no() {
		return jet_board_knowhow_category_no;
	}
	public void setJet_board_knowhow_category_no(int jet_board_knowhow_category_no) {
		this.jet_board_knowhow_category_no = jet_board_knowhow_category_no;
	}	
}
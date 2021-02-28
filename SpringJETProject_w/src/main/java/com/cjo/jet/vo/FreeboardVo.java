package com.cjo.jet.vo;

import java.util.Date;

public class FreeboardVo {
	private int jet_board_free_no;
	private int jet_member_no;
	private String jet_board_free_title;
	private String jet_board_free_content;
	private int jet_board_free_readcount;
	private Date jet_board_free_writedate;
	private int jet_board_free_category_no;
	
	public FreeboardVo() {
		super();
	}

	public FreeboardVo(int jet_board_free_no, int jet_member_no, String jet_board_free_title,
			String jet_board_free_content, int jet_board_free_readcount, Date jet_board_free_writedate,
			int jet_board_free_category_no) {
		super();
		this.jet_board_free_no = jet_board_free_no;
		this.jet_member_no = jet_member_no;
		this.jet_board_free_title = jet_board_free_title;
		this.jet_board_free_content = jet_board_free_content;
		this.jet_board_free_readcount = jet_board_free_readcount;
		this.jet_board_free_writedate = jet_board_free_writedate;
		this.jet_board_free_category_no = jet_board_free_category_no;
	}

	public int getJet_board_free_no() {
		return jet_board_free_no;
	}

	public void setJet_board_free_no(int jet_board_free_no) {
		this.jet_board_free_no = jet_board_free_no;
	}

	public int getJet_member_no() {
		return jet_member_no;
	}

	public void setJet_member_no(int jet_member_no) {
		this.jet_member_no = jet_member_no;
	}

	public String getJet_board_free_title() {
		return jet_board_free_title;
	}

	public void setJet_board_free_title(String jet_board_free_title) {
		this.jet_board_free_title = jet_board_free_title;
	}

	public String getJet_board_free_content() {
		return jet_board_free_content;
	}

	public void setJet_board_free_content(String jet_board_free_content) {
		this.jet_board_free_content = jet_board_free_content;
	}

	public int getJet_board_free_readcount() {
		return jet_board_free_readcount;
	}

	public void setJet_board_free_readcount(int jet_board_free_readcount) {
		this.jet_board_free_readcount = jet_board_free_readcount;
	}

	public Date getJet_board_free_writedate() {
		return jet_board_free_writedate;
	}

	public void setJet_board_free_writedate(Date jet_board_free_writedate) {
		this.jet_board_free_writedate = jet_board_free_writedate;
	}

	public int getJet_board_free_category_no() {
		return jet_board_free_category_no;
	}

	public void setJet_board_free_category_no(int jet_board_free_category_no) {
		this.jet_board_free_category_no = jet_board_free_category_no;
	}
	
	
	
}
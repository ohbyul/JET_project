package com.cjo.jet.vo;

import java.util.Date;

public class CsBoardVo {
	private int jet_board_m_cs_no;
	private int jet_member_no;
	private String jet_board_m_cs_title;
	private String jet_board_m_cs_content;
	private int jet_board_m_cs_readcount;
	private String jet_board_m_cs_customeremail;
	private Date jet_board_m_cs_writedate;
	private int jet_board_m_cs_category_no;
	public CsBoardVo() {
		super();
	}
	public CsBoardVo(int jet_board_m_cs_no, int jet_member_no, String jet_board_m_cs_title,
			String jet_board_m_cs_content, int jet_board_m_cs_readcount, String jet_board_m_cs_customeremail,
			Date jet_board_m_cs_writedate, int jet_board_m_cs_category_no) {
		super();
		this.jet_board_m_cs_no = jet_board_m_cs_no;
		this.jet_member_no = jet_member_no;
		this.jet_board_m_cs_title = jet_board_m_cs_title;
		this.jet_board_m_cs_content = jet_board_m_cs_content;
		this.jet_board_m_cs_readcount = jet_board_m_cs_readcount;
		this.jet_board_m_cs_customeremail = jet_board_m_cs_customeremail;
		this.jet_board_m_cs_writedate = jet_board_m_cs_writedate;
		this.jet_board_m_cs_category_no = jet_board_m_cs_category_no;
	}
	public int getJet_board_m_cs_no() {
		return jet_board_m_cs_no;
	}
	public void setJet_board_m_cs_no(int jet_board_m_cs_no) {
		this.jet_board_m_cs_no = jet_board_m_cs_no;
	}
	public int getJet_member_no() {
		return jet_member_no;
	}
	public void setJet_member_no(int jet_member_no) {
		this.jet_member_no = jet_member_no;
	}
	public String getJet_board_m_cs_title() {
		return jet_board_m_cs_title;
	}
	public void setJet_board_m_cs_title(String jet_board_m_cs_title) {
		this.jet_board_m_cs_title = jet_board_m_cs_title;
	}
	public String getJet_board_m_cs_content() {
		return jet_board_m_cs_content;
	}
	public void setJet_board_m_cs_content(String jet_board_m_cs_content) {
		this.jet_board_m_cs_content = jet_board_m_cs_content;
	}
	public int getJet_board_m_cs_readcount() {
		return jet_board_m_cs_readcount;
	}
	public void setJet_board_m_cs_readcount(int jet_board_m_cs_readcount) {
		this.jet_board_m_cs_readcount = jet_board_m_cs_readcount;
	}
	public String getJet_board_m_cs_customeremail() {
		return jet_board_m_cs_customeremail;
	}
	public void setJet_board_m_cs_customeremail(String jet_board_m_cs_customeremail) {
		this.jet_board_m_cs_customeremail = jet_board_m_cs_customeremail;
	}
	public Date getJet_board_m_cs_writedate() {
		return jet_board_m_cs_writedate;
	}
	public void setJet_board_m_cs_writedate(Date jet_board_m_cs_writedate) {
		this.jet_board_m_cs_writedate = jet_board_m_cs_writedate;
	}
	public int getJet_board_m_cs_category_no() {
		return jet_board_m_cs_category_no;
	}
	public void setJet_board_m_cs_category_no(int jet_board_m_cs_category_no) {
		this.jet_board_m_cs_category_no = jet_board_m_cs_category_no;
	}
	
	
}
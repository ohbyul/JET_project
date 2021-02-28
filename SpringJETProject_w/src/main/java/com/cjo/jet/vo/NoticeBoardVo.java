package com.cjo.jet.vo;

import java.util.Date;

public class NoticeBoardVo {

    private int jet_board_notice_no;
    private int jet_member_no;
    private String jet_board_notice_title;
    private String jet_board_notice_content;
    private int jet_board_notice_readcount;
    private Date jet_board_notice_writedate;
	public NoticeBoardVo() {
		super();
	}
	public NoticeBoardVo(int jet_board_notice_no, int jet_member_no, String jet_board_notice_title,
			String jet_board_notice_content, int jet_board_notice_readcount, Date jet_board_notice_writedate) {
		super();
		this.jet_board_notice_no = jet_board_notice_no;
		this.jet_member_no = jet_member_no;
		this.jet_board_notice_title = jet_board_notice_title;
		this.jet_board_notice_content = jet_board_notice_content;
		this.jet_board_notice_readcount = jet_board_notice_readcount;
		this.jet_board_notice_writedate = jet_board_notice_writedate;
	}
	public int getJet_board_notice_no() {
		return jet_board_notice_no;
	}
	public void setJet_board_notice_no(int jet_board_notice_no) {
		this.jet_board_notice_no = jet_board_notice_no;
	}
	public int getJet_member_no() {
		return jet_member_no;
	}
	public void setJet_member_no(int jet_member_no) {
		this.jet_member_no = jet_member_no;
	}
	public String getJet_board_notice_title() {
		return jet_board_notice_title;
	}
	public void setJet_board_notice_title(String jet_board_notice_title) {
		this.jet_board_notice_title = jet_board_notice_title;
	}
	public String getJet_board_notice_content() {
		return jet_board_notice_content;
	}
	public void setJet_board_notice_content(String jet_board_notice_content) {
		this.jet_board_notice_content = jet_board_notice_content;
	}
	public int getJet_board_notice_readcount() {
		return jet_board_notice_readcount;
	}
	public void setJet_board_notice_readcount(int jet_board_notice_readcount) {
		this.jet_board_notice_readcount = jet_board_notice_readcount;
	}
	public Date getJet_board_notice_writedate() {
		return jet_board_notice_writedate;
	}
	public void setJet_board_notice_writedate(Date jet_board_notice_writedate) {
		this.jet_board_notice_writedate = jet_board_notice_writedate;
	}




}

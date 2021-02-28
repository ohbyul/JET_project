package com.cjo.jet.vo;

import java.util.Date;

public class NoticeRepleVo {

	private int jet_notice_reple_no;
	private int jet_board_notice_no;
	private int jet_member_no;
	private String jet_notice_reple_content;
	private Date jet_notice_reple_writedate;
	public NoticeRepleVo() {
		super();
	}
	public NoticeRepleVo(int jet_notice_reple_no, int jet_board_notice_no, int jet_member_no,
			String jet_notice_reple_content, Date jet_notice_reple_writedate) {
		super();
		this.jet_notice_reple_no = jet_notice_reple_no;
		this.jet_board_notice_no = jet_board_notice_no;
		this.jet_member_no = jet_member_no;
		this.jet_notice_reple_content = jet_notice_reple_content;
		this.jet_notice_reple_writedate = jet_notice_reple_writedate;
	}
	public int getJet_notice_reple_no() {
		return jet_notice_reple_no;
	}
	public void setJet_notice_reple_no(int jet_notice_reple_no) {
		this.jet_notice_reple_no = jet_notice_reple_no;
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
	public String getJet_notice_reple_content() {
		return jet_notice_reple_content;
	}
	public void setJet_notice_reple_content(String jet_notice_reple_content) {
		this.jet_notice_reple_content = jet_notice_reple_content;
	}
	public Date getJet_notice_reple_writedate() {
		return jet_notice_reple_writedate;
	}
	public void setJet_notice_reple_writedate(Date jet_notice_reple_writedate) {
		this.jet_notice_reple_writedate = jet_notice_reple_writedate;
	}
	
	
}

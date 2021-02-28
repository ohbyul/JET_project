package com.cjo.jet.vo;

import java.util.Date;

public class FreeboardReportVo {
	
	private int jet_board_free_report_no;
	private int jet_board_free_no;
	private int jet_member_no;
	private String jet_board_free_report_reason;
	private Date jet_board_free_report_date;
	
	public FreeboardReportVo() {
		super();
	}

	public FreeboardReportVo(int jet_board_free_report_no, int jet_board_free_no, int jet_member_no,
			String jet_board_free_report_reason, Date jet_board_free_report_date) {
		super();
		this.jet_board_free_report_no = jet_board_free_report_no;
		this.jet_board_free_no = jet_board_free_no;
		this.jet_member_no = jet_member_no;
		this.jet_board_free_report_reason = jet_board_free_report_reason;
		this.jet_board_free_report_date = jet_board_free_report_date;
	}

	public int getJet_board_free_report_no() {
		return jet_board_free_report_no;
	}

	public void setJet_board_free_report_no(int jet_board_free_report_no) {
		this.jet_board_free_report_no = jet_board_free_report_no;
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

	public String getJet_board_free_report_reason() {
		return jet_board_free_report_reason;
	}

	public void setJet_board_free_report_reason(String jet_board_free_report_reason) {
		this.jet_board_free_report_reason = jet_board_free_report_reason;
	}

	public Date getJet_board_free_report_date() {
		return jet_board_free_report_date;
	}

	public void setJet_board_free_report_date(Date jet_board_free_report_date) {
		this.jet_board_free_report_date = jet_board_free_report_date;
	}
	
	

}

package com.cjo.jet.vo;

import java.util.Date;

public class SharePlanReportVo {
	private int JET_board_share_report_no;
	private int jet_board_shareplan_no;
	private int jet_member_no;
	private String jet_board_share_report_reason;
	private Date jet_board_share_report_date;
	public SharePlanReportVo() {
		super();
	}
	public SharePlanReportVo(int jET_board_share_report_no, int jet_board_shareplan_no, int jet_member_no,
			String jet_board_share_report_reason, Date jet_board_share_report_date) {
		super();
		JET_board_share_report_no = jET_board_share_report_no;
		this.jet_board_shareplan_no = jet_board_shareplan_no;
		this.jet_member_no = jet_member_no;
		this.jet_board_share_report_reason = jet_board_share_report_reason;
		this.jet_board_share_report_date = jet_board_share_report_date;
	}
	public int getJET_board_share_report_no() {
		return JET_board_share_report_no;
	}
	public void setJET_board_share_report_no(int jET_board_share_report_no) {
		JET_board_share_report_no = jET_board_share_report_no;
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
	public String getJet_board_share_report_reason() {
		return jet_board_share_report_reason;
	}
	public void setJet_board_share_report_reason(String jet_board_share_report_reason) {
		this.jet_board_share_report_reason = jet_board_share_report_reason;
	}
	public Date getJet_board_share_report_date() {
		return jet_board_share_report_date;
	}
	public void setJet_board_share_report_date(Date jet_board_share_report_date) {
		this.jet_board_share_report_date = jet_board_share_report_date;
	}
	
}

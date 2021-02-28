package com.cjo.jet.vo;

import java.util.Date;

public class MemberStatusVo {
	private int jet_member_status_no;
	private int jet_member_no;
	private String jet_member_status_active;
	private int jet_stopstate_period_no;
	private int jet_stopstate_reason_no;
	private Date jet_member_status_updateday;
	public MemberStatusVo() {
		super();
	}
	public MemberStatusVo(int jet_member_status_no, int jet_member_no, String jet_member_status_active,
			int jet_stopstate_period_no, int jet_stopstate_reason_no, Date jet_member_status_updateday) {
		super();
		this.jet_member_status_no = jet_member_status_no;
		this.jet_member_no = jet_member_no;
		this.jet_member_status_active = jet_member_status_active;
		this.jet_stopstate_period_no = jet_stopstate_period_no;
		this.jet_stopstate_reason_no = jet_stopstate_reason_no;
		this.jet_member_status_updateday = jet_member_status_updateday;
	}
	public int getJet_member_status_no() {
		return jet_member_status_no;
	}
	public void setJet_member_status_no(int jet_member_status_no) {
		this.jet_member_status_no = jet_member_status_no;
	}
	public int getJet_member_no() {
		return jet_member_no;
	}
	public void setJet_member_no(int jet_member_no) {
		this.jet_member_no = jet_member_no;
	}
	public String getJet_member_status_active() {
		return jet_member_status_active;
	}
	public void setJet_member_status_active(String jet_member_status_active) {
		this.jet_member_status_active = jet_member_status_active;
	}
	public int getJet_stopstate_period_no() {
		return jet_stopstate_period_no;
	}
	public void setJet_stopstate_period_no(int jet_stopstate_period_no) {
		this.jet_stopstate_period_no = jet_stopstate_period_no;
	}
	public int getJet_stopstate_reason_no() {
		return jet_stopstate_reason_no;
	}
	public void setJet_stopstate_reason_no(int jet_stopstate_reason_no) {
		this.jet_stopstate_reason_no = jet_stopstate_reason_no;
	}
	public Date getJet_member_status_updateday() {
		return jet_member_status_updateday;
	}
	public void setJet_member_status_updateday(Date jet_member_status_updateday) {
		this.jet_member_status_updateday = jet_member_status_updateday;
	}
	
	
}

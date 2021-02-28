package com.cjo.jet.vo;

public class MemberStopReasonVo {
	private int jet_stopstate_reason_no;
	private int jet_stopstate_reason_detail;
	public MemberStopReasonVo() {
		super();
	}
	public MemberStopReasonVo(int jet_stopstate_reason_no, int jet_stopstate_reason_detail) {
		super();
		this.jet_stopstate_reason_no = jet_stopstate_reason_no;
		this.jet_stopstate_reason_detail = jet_stopstate_reason_detail;
	}
	public int getJet_stopstate_reason_no() {
		return jet_stopstate_reason_no;
	}
	public void setJet_stopstate_reason_no(int jet_stopstate_reason_no) {
		this.jet_stopstate_reason_no = jet_stopstate_reason_no;
	}
	public int getJet_stopstate_reason_detail() {
		return jet_stopstate_reason_detail;
	}
	public void setJet_stopstate_reason_detail(int jet_stopstate_reason_detail) {
		this.jet_stopstate_reason_detail = jet_stopstate_reason_detail;
	}
	
}

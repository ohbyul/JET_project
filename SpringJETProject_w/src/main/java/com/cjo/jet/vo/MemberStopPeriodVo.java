package com.cjo.jet.vo;

public class MemberStopPeriodVo {
	private int jet_stopstate_period_no;
	private int jet_stopstate_period_name;
	public MemberStopPeriodVo() {
		super();
	}
	public MemberStopPeriodVo(int jet_stopstate_period_no, int jet_stopstate_period_name) {
		super();
		this.jet_stopstate_period_no = jet_stopstate_period_no;
		this.jet_stopstate_period_name = jet_stopstate_period_name;
	}
	public int getJet_stopstate_period_no() {
		return jet_stopstate_period_no;
	}
	public void setJet_stopstate_period_no(int jet_stopstate_period_no) {
		this.jet_stopstate_period_no = jet_stopstate_period_no;
	}
	public int getJet_stopstate_period_name() {
		return jet_stopstate_period_name;
	}
	public void setJet_stopstate_period_name(int jet_stopstate_period_name) {
		this.jet_stopstate_period_name = jet_stopstate_period_name;
	}
		
}

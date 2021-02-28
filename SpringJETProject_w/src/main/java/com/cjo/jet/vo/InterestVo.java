package com.cjo.jet.vo;

public class InterestVo {
	private int jet_interest_no;
	private int jet_member_no;
	private String jet_interest_name;
	public InterestVo() {
		super();
	}
	public InterestVo(int jet_interest_no, int jet_member_no, String jet_interest_name) {
		super();
		this.jet_interest_no = jet_interest_no;
		this.jet_member_no = jet_member_no;
		this.jet_interest_name = jet_interest_name;
	}
	public int getjet_interest_no() {
		return jet_interest_no;
	}
	public void setjet_interest_no(int jet_interest_no) {
		this.jet_interest_no = jet_interest_no;
	}
	public int getjet_member_no() {
		return jet_member_no;
	}
	public void setjet_member_no(int jet_member_no) {
		this.jet_member_no = jet_member_no;
	}
	public String getjet_interest_name() {
		return jet_interest_name;
	}
	public void setjet_interest_name(String jet_interest_name) {
		this.jet_interest_name = jet_interest_name;
	}
	
	
}
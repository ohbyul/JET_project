package com.cjo.jet.vo;

import java.util.Date;

public class AdminAssignVo {
	
	private int jet_assign_no;	//프라이머리
	private int jet_board_m_cs_no; 	//FK..회원이 문의한글의 번호..	
	private int jet_member_no;	//FK ..배정된 관리자 번호
	private Date jet_assign_date;	//배정 날짜..
	public AdminAssignVo() {
		super();
	}
	public AdminAssignVo(int jet_assign_no, int jet_board_m_cs_no, int jet_member_no, Date jet_assign_date) {
		super();
		this.jet_assign_no = jet_assign_no;
		this.jet_board_m_cs_no = jet_board_m_cs_no;
		this.jet_member_no = jet_member_no;
		this.jet_assign_date = jet_assign_date;
	}
	public int getJet_assign_no() {
		return jet_assign_no;
	}
	public void setJet_assign_no(int jet_assign_no) {
		this.jet_assign_no = jet_assign_no;
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
	public Date getJet_assign_date() {
		return jet_assign_date;
	}
	public void setJet_assign_date(Date jet_assign_date) {
		this.jet_assign_date = jet_assign_date;
	}

	
	
	
}

package com.cjo.jet.vo;

import java.util.Date;

public class MemberVo {
	private int jet_member_no;
	private String jet_member_id;
	private String jet_member_pw;
	private String jet_member_name;
	private String jet_member_nick;
	private String jet_member_sex;
	private String jet_member_phone;
	private String jet_member_kakao;
	private String jet_member_grade;
	private String jet_member_credit;
	private Date jet_member_joindate;
	private Date jet_member_dropoutdate;
	
	public MemberVo() {
		super();
	}

	public MemberVo(int jet_member_no, String jet_member_id, String jet_member_pw, String jet_member_name,
			String jet_member_nick, String jet_member_sex, String jet_member_phone, String jet_member_kakao,
			String jet_member_grade, String jet_member_credit, Date jet_member_joindate, Date jet_member_dropoutdate) {
		super();
		this.jet_member_no = jet_member_no;
		this.jet_member_id = jet_member_id;
		this.jet_member_pw = jet_member_pw;
		this.jet_member_name = jet_member_name;
		this.jet_member_nick = jet_member_nick;
		this.jet_member_sex = jet_member_sex;
		this.jet_member_phone = jet_member_phone;
		this.jet_member_kakao = jet_member_kakao;
		this.jet_member_grade = jet_member_grade;
		this.jet_member_credit = jet_member_credit;
		this.jet_member_joindate = jet_member_joindate;
		this.jet_member_dropoutdate = jet_member_dropoutdate;
	}

	public int getJet_member_no() {
		return jet_member_no;
	}

	public void setJet_member_no(int jet_member_no) {
		this.jet_member_no = jet_member_no;
	}

	public String getJet_member_id() {
		return jet_member_id;
	}

	public void setJet_member_id(String jet_member_id) {
		this.jet_member_id = jet_member_id;
	}

	public String getJet_member_pw() {
		return jet_member_pw;
	}

	public void setJet_member_pw(String jet_member_pw) {
		this.jet_member_pw = jet_member_pw;
	}

	public String getJet_member_name() {
		return jet_member_name;
	}

	public void setJet_member_name(String jet_member_name) {
		this.jet_member_name = jet_member_name;
	}

	public String getJet_member_nick() {
		return jet_member_nick;
	}

	public void setJet_member_nick(String jet_member_nick) {
		this.jet_member_nick = jet_member_nick;
	}

	public String getJet_member_sex() {
		return jet_member_sex;
	}

	public void setJet_member_sex(String jet_member_sex) {
		this.jet_member_sex = jet_member_sex;
	}

	public String getJet_member_phone() {
		return jet_member_phone;
	}

	public void setJet_member_phone(String jet_member_phone) {
		this.jet_member_phone = jet_member_phone;
	}

	public String getJet_member_kakao() {
		return jet_member_kakao;
	}

	public void setJet_member_kakao(String jet_member_kakao) {
		this.jet_member_kakao = jet_member_kakao;
	}

	public String getJet_member_grade() {
		return jet_member_grade;
	}

	public void setJet_member_grade(String jet_member_grade) {
		this.jet_member_grade = jet_member_grade;
	}

	public String getJet_member_credit() {
		return jet_member_credit;
	}

	public void setJet_member_credit(String jet_member_credit) {
		this.jet_member_credit = jet_member_credit;
	}

	public Date getJet_member_joindate() {
		return jet_member_joindate;
	}

	public void setJet_member_joindate(Date jet_member_joindate) {
		this.jet_member_joindate = jet_member_joindate;
	}

	public Date getJet_member_dropoutdate() {
		return jet_member_dropoutdate;
	}

	public void setJet_member_dropoutdate(Date jet_member_dropoutdate) {
		this.jet_member_dropoutdate = jet_member_dropoutdate;
	}
	
	
}

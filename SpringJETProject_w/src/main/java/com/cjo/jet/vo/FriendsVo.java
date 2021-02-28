package com.cjo.jet.vo;

import java.util.Date;

public class FriendsVo {
	private int jet_friends_no;
    private int jet_member_no;
    private int jet_friends_member_no;
    private Date jet_friends_addDate;
	public FriendsVo() {
		super();
	}
	public FriendsVo(int jet_friends_no, int jet_member_no, int jet_friends_member_no, Date jet_friends_addDate) {
		super();
		this.jet_friends_no = jet_friends_no;
		this.jet_member_no = jet_member_no;
		this.jet_friends_member_no = jet_friends_member_no;
		this.jet_friends_addDate = jet_friends_addDate;
	}
	public int getJet_friends_no() {
		return jet_friends_no;
	}
	public void setJet_friends_no(int jet_friends_no) {
		this.jet_friends_no = jet_friends_no;
	}
	public int getJet_member_no() {
		return jet_member_no;
	}
	public void setJet_member_no(int jet_member_no) {
		this.jet_member_no = jet_member_no;
	}
	public int getJet_friends_member_no() {
		return jet_friends_member_no;
	}
	public void setJet_friends_member_no(int jet_friends_member_no) {
		this.jet_friends_member_no = jet_friends_member_no;
	}
	public Date getJet_friends_addDate() {
		return jet_friends_addDate;
	}
	public void setJet_friends_addDate(Date jet_friends_addDate) {
		this.jet_friends_addDate = jet_friends_addDate;
	}
	
}

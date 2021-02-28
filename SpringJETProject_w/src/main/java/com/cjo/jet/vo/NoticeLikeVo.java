package com.cjo.jet.vo;

public class NoticeLikeVo {

	private int jet_board_notice_like_no;
	private int jet_board_notice_no;
	private int jet_member_no;
	public NoticeLikeVo() {
		super();
	}
	public NoticeLikeVo(int jet_board_notice_like_no, int jet_board_notice_no, int jet_member_no) {
		super();
		this.jet_board_notice_like_no = jet_board_notice_like_no;
		this.jet_board_notice_no = jet_board_notice_no;
		this.jet_member_no = jet_member_no;
	}
	public int getJet_board_notice_like_no() {
		return jet_board_notice_like_no;
	}
	public void setJet_board_notice_like_no(int jet_board_notice_like_no) {
		this.jet_board_notice_like_no = jet_board_notice_like_no;
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
	
	

}

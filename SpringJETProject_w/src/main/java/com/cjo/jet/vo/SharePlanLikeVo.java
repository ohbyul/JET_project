package com.cjo.jet.vo;

public class SharePlanLikeVo {
	private int jet_board_shareplan_like_no;
	private int jet_board_shareplan_no;
	private int jet_member_no;
	public SharePlanLikeVo() {
		super();
	}
	public SharePlanLikeVo(int jet_board_shareplan_like_no, int jet_board_shareplan_no, int jet_member_no) {
		super();
		this.jet_board_shareplan_like_no = jet_board_shareplan_like_no;
		this.jet_board_shareplan_no = jet_board_shareplan_no;
		this.jet_member_no = jet_member_no;
	}
	public int getJet_board_shareplan_like_no() {
		return jet_board_shareplan_like_no;
	}
	public void setJet_board_shareplan_like_no(int jet_board_shareplan_like_no) {
		this.jet_board_shareplan_like_no = jet_board_shareplan_like_no;
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
	
}

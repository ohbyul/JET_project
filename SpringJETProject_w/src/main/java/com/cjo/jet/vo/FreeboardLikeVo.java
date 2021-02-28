package com.cjo.jet.vo;

public class FreeboardLikeVo {
	
	private int jet_board_free_like_no;
	private int jet_board_free_no;
	private int jet_member_no;
	
	public FreeboardLikeVo() {
		super();
	}
	public FreeboardLikeVo(int jet_board_free_like_no, int jet_board_free_no, int jet_member_no) {
		super();
		this.jet_board_free_like_no = jet_board_free_like_no;
		this.jet_board_free_no = jet_board_free_no;
		this.jet_member_no = jet_member_no;
	}
	public int getJet_board_free_like_no() {
		return jet_board_free_like_no;
	}
	public void setJet_board_free_like_no(int jet_board_free_like_no) {
		this.jet_board_free_like_no = jet_board_free_like_no;
	}
	public int getJet_board_free_no() {
		return jet_board_free_no;
	}
	public void setJet_board_free_no(int jet_board_free_no) {
		this.jet_board_free_no = jet_board_free_no;
	}
	public int getJet_member_no() {
		return jet_member_no;
	}
	public void setJet_member_no(int jet_member_no) {
		this.jet_member_no = jet_member_no;
	}
	
	
}

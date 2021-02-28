package com.cjo.jet.vo;

public class PickBoardVo {
	private int jet_board_pick_no;
	private int jet_member_no;
	private int jet_board_shareplan_no;
	public PickBoardVo() {
		super();
	}
	public PickBoardVo(int jet_board_pick_no, int jet_member_no, int jet_board_shareplan_no) {
		super();
		this.jet_board_pick_no = jet_board_pick_no;
		this.jet_member_no = jet_member_no;
		this.jet_board_shareplan_no = jet_board_shareplan_no;
	}
	public int getJet_board_pick_no() {
		return jet_board_pick_no;
	}
	public void setJet_board_pick_no(int jet_board_pick_no) {
		this.jet_board_pick_no = jet_board_pick_no;
	}
	public int getJet_member_no() {
		return jet_member_no;
	}
	public void setJet_member_no(int jet_member_no) {
		this.jet_member_no = jet_member_no;
	}
	public int getJet_board_shareplan_no() {
		return jet_board_shareplan_no;
	}
	public void setJet_board_shareplan_no(int jet_board_shareplan_no) {
		this.jet_board_shareplan_no = jet_board_shareplan_no;
	}
	
}

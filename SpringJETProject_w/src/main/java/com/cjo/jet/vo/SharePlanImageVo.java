package com.cjo.jet.vo;

public class SharePlanImageVo {
	private int jet_board_shareplan_image_no;
	private int jet_board_shareplan_no;
	private String jet_board_shareplan_image_link;
	public SharePlanImageVo() {
		super();
	}
	public SharePlanImageVo(int jet_board_shareplan_image_no, int jet_board_shareplan_no,
			String jet_board_shareplan_image_link) {
		super();
		this.jet_board_shareplan_image_no = jet_board_shareplan_image_no;
		this.jet_board_shareplan_no = jet_board_shareplan_no;
		this.jet_board_shareplan_image_link = jet_board_shareplan_image_link;
	}
	public int getJet_board_shareplan_image_no() {
		return jet_board_shareplan_image_no;
	}
	public void setJet_board_shareplan_image_no(int jet_board_shareplan_image_no) {
		this.jet_board_shareplan_image_no = jet_board_shareplan_image_no;
	}
	public int getJet_board_shareplan_no() {
		return jet_board_shareplan_no;
	}
	public void setJet_board_shareplan_no(int jet_board_shareplan_no) {
		this.jet_board_shareplan_no = jet_board_shareplan_no;
	}
	public String getJet_board_shareplan_image_link() {
		return jet_board_shareplan_image_link;
	}
	public void setJet_board_shareplan_image_link(String jet_board_shareplan_image_link) {
		this.jet_board_shareplan_image_link = jet_board_shareplan_image_link;
	}

	
}

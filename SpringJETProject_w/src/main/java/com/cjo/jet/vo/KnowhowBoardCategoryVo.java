package com.cjo.jet.vo;

public class KnowhowBoardCategoryVo {

	private int jet_board_knowhow_category_no;
	String jet_board_knowhow_category_nam;
	
	public KnowhowBoardCategoryVo() {
		super();
	}
	
	public KnowhowBoardCategoryVo(int jet_board_knowhow_category_no, String jet_board_knowhow_category_nam) {
		super();
		this.jet_board_knowhow_category_no = jet_board_knowhow_category_no;
		this.jet_board_knowhow_category_nam = jet_board_knowhow_category_nam;
	}
	
	public int getJet_board_knowhow_category_no() {
		return jet_board_knowhow_category_no;
	}
	public void setJet_board_knowhow_category_no(int jet_board_knowhow_category_no) {
		this.jet_board_knowhow_category_no = jet_board_knowhow_category_no;
	}
	public String getJet_board_knowhow_category_nam() {
		return jet_board_knowhow_category_nam;
	}
	public void setJet_board_knowhow_category_nam(String jet_board_knowhow_category_nam) {
		this.jet_board_knowhow_category_nam = jet_board_knowhow_category_nam;
	}	
}
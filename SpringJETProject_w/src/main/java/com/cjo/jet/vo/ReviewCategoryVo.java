package com.cjo.jet.vo;
//이거 왜만들었을까 고민중
public class ReviewCategoryVo {
	private int jet_board_review_category_no;
	private String jet_board_review_category_name;
	
	public ReviewCategoryVo() {
		super();
	}
	public ReviewCategoryVo(int jet_board_review_category_no, String jet_board_review_category_name) {
		super();
		this.jet_board_review_category_no = jet_board_review_category_no;
		this.jet_board_review_category_name = jet_board_review_category_name;
	}
	public int getJet_board_review_category_no() {
		return jet_board_review_category_no;
	}
	public void setJet_board_review_category_no(int jet_board_review_category_no) {
		this.jet_board_review_category_no = jet_board_review_category_no;
	}
	public String getJet_board_review_category_name() {
		return jet_board_review_category_name;
	}
	public void setJet_board_review_category_name(String jet_board_review_category_name) {
		this.jet_board_review_category_name = jet_board_review_category_name;
	}
	
	
}

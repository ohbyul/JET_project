package com.cjo.jet.vo;

public class PartyBoardImageVo {

	private int jet_board_party_image_no;
	private int jet_board_party_no;
	private String jet_board_party_image_link;
	public PartyBoardImageVo() {
		super();
	}
	public PartyBoardImageVo(int jet_board_party_image_no, int jet_board_party_no, String jet_board_party_image_link) {
		super();
		this.jet_board_party_image_no = jet_board_party_image_no;
		this.jet_board_party_no = jet_board_party_no;
		this.jet_board_party_image_link = jet_board_party_image_link;
	}
	public int getJet_board_party_image_no() {
		return jet_board_party_image_no;
	}
	public void setJet_board_party_image_no(int jet_board_party_image_no) {
		this.jet_board_party_image_no = jet_board_party_image_no;
	}
	public int getJet_board_party_no() {
		return jet_board_party_no;
	}
	public void setJet_board_party_no(int jet_board_party_no) {
		this.jet_board_party_no = jet_board_party_no;
	}
	public String getJet_board_party_image_link() {
		return jet_board_party_image_link;
	}
	public void setJet_board_party_image_link(String jet_board_party_image_link) {
		this.jet_board_party_image_link = jet_board_party_image_link;
	}
	

}

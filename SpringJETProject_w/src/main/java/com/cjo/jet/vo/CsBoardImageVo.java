package com.cjo.jet.vo;

public class CsBoardImageVo {

	private int jet_board_cs_image_no;
	private int jet_board_m_cs_no;
	private String jet_board_cs_image_link;
	public CsBoardImageVo() {
		super();
	}
	public CsBoardImageVo(int jet_board_cs_image_no, int jet_board_m_cs_no, String jet_board_cs_image_link) {
		super();
		this.jet_board_cs_image_no = jet_board_cs_image_no;
		this.jet_board_m_cs_no = jet_board_m_cs_no;
		this.jet_board_cs_image_link = jet_board_cs_image_link;
	}
	public int getJet_board_cs_image_no() {
		return jet_board_cs_image_no;
	}
	public void setJet_board_cs_image_no(int jet_board_cs_image_no) {
		this.jet_board_cs_image_no = jet_board_cs_image_no;
	}
	public int getJet_board_m_cs_no() {
		return jet_board_m_cs_no;
	}
	public void setJet_board_m_cs_no(int jet_board_m_cs_no) {
		this.jet_board_m_cs_no = jet_board_m_cs_no;
	}
	public String getJet_board_cs_image_link() {
		return jet_board_cs_image_link;
	}
	public void setJet_board_cs_image_link(String jet_board_cs_image_link) {
		this.jet_board_cs_image_link = jet_board_cs_image_link;
	}
	
}
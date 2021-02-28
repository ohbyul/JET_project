package com.cjo.jet.vo;

import java.util.Date;

public class KnowhowBoardRepleVo {
	
	private int jet_board_knowhow_reple_no;
	private int jet_member_no;
	private int  jet_board_knowhow_no;
    private String jet_board_knowhow_reple_cont;
    private Date jet_board_knowhow_reple_date;
    
	public KnowhowBoardRepleVo() {
		super();
	}
	
	public KnowhowBoardRepleVo(int jet_board_knowhow_reple_no, int jet_member_no, int jet_board_knowhow_no,
			String jet_board_knowhow_reple_cont, Date jet_board_knowhow_reple_date) {
		super();
		this.jet_board_knowhow_reple_no = jet_board_knowhow_reple_no;
		this.jet_member_no = jet_member_no;
		this.jet_board_knowhow_no = jet_board_knowhow_no;
		this.jet_board_knowhow_reple_cont = jet_board_knowhow_reple_cont;
		this.jet_board_knowhow_reple_date = jet_board_knowhow_reple_date;
	}
	
	public int getJet_board_knowhow_reple_no() {
		return jet_board_knowhow_reple_no;
	}
	public void setJet_board_knowhow_reple_no(int jet_board_knowhow_reple_no) {
		this.jet_board_knowhow_reple_no = jet_board_knowhow_reple_no;
	}
	public int getJet_member_no() {
		return jet_member_no;
	}
	public void setJet_member_no(int jet_member_no) {
		this.jet_member_no = jet_member_no;
	}
	public int getJet_board_knowhow_no() {
		return jet_board_knowhow_no;
	}
	public void setJet_board_knowhow_no(int jet_board_knowhow_no) {
		this.jet_board_knowhow_no = jet_board_knowhow_no;
	}
	public String getJet_board_knowhow_reple_cont() {
		return jet_board_knowhow_reple_cont;
	}
	public void setJet_board_knowhow_reple_cont(String jet_board_knowhow_reple_cont) {
		this.jet_board_knowhow_reple_cont = jet_board_knowhow_reple_cont;
	}
	public Date getJet_board_knowhow_reple_date() {
		return jet_board_knowhow_reple_date;
	}
	public void setJet_board_knowhow_reple_date(Date jet_board_knowhow_reple_date) {
		this.jet_board_knowhow_reple_date = jet_board_knowhow_reple_date;
	}
}
package com.cjo.jet.vo;

import java.util.Date;

public class FreeboardRepleVo {
    private int jet_board_free_reple_no;
    private int jet_board_free_no;
    private int jet_member_no;
    private String jet_board_free_reple_content;
    private Date jet_board_free_reple_writedate;
	
    public FreeboardRepleVo() {
		super();
	}

	public FreeboardRepleVo(int jet_board_free_reple_no, int jet_board_free_no, int jet_member_no,
			String jet_board_free_reple_content, Date jet_board_free_reple_writedate) {
		super();
		this.jet_board_free_reple_no = jet_board_free_reple_no;
		this.jet_board_free_no = jet_board_free_no;
		this.jet_member_no = jet_member_no;
		this.jet_board_free_reple_content = jet_board_free_reple_content;
		this.jet_board_free_reple_writedate = jet_board_free_reple_writedate;
	}

	public int getJet_board_free_reple_no() {
		return jet_board_free_reple_no;
	}

	public void setJet_board_free_reple_no(int jet_board_free_reple_no) {
		this.jet_board_free_reple_no = jet_board_free_reple_no;
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

	public String getJet_board_free_reple_content() {
		return jet_board_free_reple_content;
	}

	public void setJet_board_free_reple_content(String jet_board_free_reple_content) {
		this.jet_board_free_reple_content = jet_board_free_reple_content;
	}

	public Date getJet_board_free_reple_writedate() {
		return jet_board_free_reple_writedate;
	}

	public void setJet_board_free_reple_writedate(Date jet_board_free_reple_writedate) {
		this.jet_board_free_reple_writedate = jet_board_free_reple_writedate;
	}
    
    
}

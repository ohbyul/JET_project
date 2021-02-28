package com.cjo.jet.vo;

import java.util.Date;

public class TravelPlanVo {

   private int jet_board_travelplan_no;
   private int jet_member_no;
   private String jet_board_travelplan_title;
   private String jet_travelplan_sharestatus;
   private Date jet_board_travelplan_writedate;
   public TravelPlanVo() {
      super();
   }
   public TravelPlanVo(int jet_board_travelplan_no, int jet_member_no, String jet_board_travelplan_title,
		String jet_travelplan_sharestatus, Date jet_board_travelplan_writedate) {
	super();
	this.jet_board_travelplan_no = jet_board_travelplan_no;
	this.jet_member_no = jet_member_no;
	this.jet_board_travelplan_title = jet_board_travelplan_title;
	this.jet_travelplan_sharestatus = jet_travelplan_sharestatus;
	this.jet_board_travelplan_writedate = jet_board_travelplan_writedate;
   }
	public int getJet_board_travelplan_no() {
		return jet_board_travelplan_no;
	}
	public void setJet_board_travelplan_no(int jet_board_travelplan_no) {
		this.jet_board_travelplan_no = jet_board_travelplan_no;
	}
	public int getJet_member_no() {
		return jet_member_no;
	}
	public void setJet_member_no(int jet_member_no) {
		this.jet_member_no = jet_member_no;
	}
	public String getJet_board_travelplan_title() {
		return jet_board_travelplan_title;
	}
	public void setJet_board_travelplan_title(String jet_board_travelplan_title) {
		this.jet_board_travelplan_title = jet_board_travelplan_title;
	}
	public String getJet_travelplan_sharestatus() {
		return jet_travelplan_sharestatus;
	}
	public void setJet_travelplan_sharestatus(String jet_travelplan_sharestatus) {
		this.jet_travelplan_sharestatus = jet_travelplan_sharestatus;
	}
	public Date getJet_board_travelplan_writedate() {
		return jet_board_travelplan_writedate;
	}
	public void setJet_board_travelplan_writedate(Date jet_board_travelplan_writedate) {
		this.jet_board_travelplan_writedate = jet_board_travelplan_writedate;
	}
	   
	   
}
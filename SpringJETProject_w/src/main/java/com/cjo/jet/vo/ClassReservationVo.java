package com.cjo.jet.vo;

import java.util.Date;

public class ClassReservationVo {
	
	private int jet_class_reservation_no;
	private int jet_member_no;
    private int jet_class_detail_no;
    private Date jet_class_reservation_date;
    
	public ClassReservationVo() {
		super();
	}
	
	public ClassReservationVo(int jet_class_reservation_no, int jet_member_no, int jet_class_detail_no,
			Date jet_class_reservation_date) {
		super();
		this.jet_class_reservation_no = jet_class_reservation_no;
		this.jet_member_no = jet_member_no;
		this.jet_class_detail_no = jet_class_detail_no;
		this.jet_class_reservation_date = jet_class_reservation_date;
	}
	
	public int getJet_class_reservation_no() {
		return jet_class_reservation_no;
	}
	public void setJet_class_reservation_no(int jet_class_reservation_no) {
		this.jet_class_reservation_no = jet_class_reservation_no;
	}
	public int getJet_member_no() {
		return jet_member_no;
	}
	public void setJet_member_no(int jet_member_no) {
		this.jet_member_no = jet_member_no;
	}
	public int getJet_class_detail_no() {
		return jet_class_detail_no;
	}
	public void setJet_class_detail_no(int jet_class_detail_no) {
		this.jet_class_detail_no = jet_class_detail_no;
	}
	public Date getJet_class_reservation_date() {
		return jet_class_reservation_date;
	}
	public void setJet_class_reservation_date(Date jet_class_reservation_date) {
		this.jet_class_reservation_date = jet_class_reservation_date;
	}
}
package com.cjo.jet.vo;

import java.util.Date;

public class ClassDetailVo {
	
	private int jet_class_detail_no;
	private int jet_class_no;
    private Date jet_class_detail_date;
    
	public ClassDetailVo() {
		super();
	}
	
	public ClassDetailVo(int jet_class_detail_no, int jet_class_no, Date jet_class_detail_date) {
		super();
		this.jet_class_detail_no = jet_class_detail_no;
		this.jet_class_no = jet_class_no;
		this.jet_class_detail_date = jet_class_detail_date;
	}
	
	public int getJet_class_detail_no() {
		return jet_class_detail_no;
	}
	public void setJet_class_detail_no(int jet_class_detail_no) {
		this.jet_class_detail_no = jet_class_detail_no;
	}
	public int getJet_class_no() {
		return jet_class_no;
	}
	public void setJet_class_no(int jet_class_no) {
		this.jet_class_no = jet_class_no;
	}
	public Date getJet_class_detail_date() {
		return jet_class_detail_date;
	}
	public void setJet_class_detail_date(Date jet_class_detail_date) {
		this.jet_class_detail_date = jet_class_detail_date;
	}
}
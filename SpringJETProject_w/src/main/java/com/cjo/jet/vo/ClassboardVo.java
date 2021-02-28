package com.cjo.jet.vo;

import java.util.Date;

public class ClassboardVo {
	
	private int jet_class_no;
	private int jet_member_no;
	private int jet_class_category_no;
	private String jet_class_name;
	private String  jet_class_content;
	private double jet_class_latitude;
	private double jet_class_longitude;
	private int jet_class_price;
	private int jet_class_totaltime;
	private int jet_class_max_headcount;
	private Date jet_class_writedate;
	private String jet_class_address;
	public ClassboardVo() {
		super();
	}
	public ClassboardVo(int jet_class_no, int jet_member_no, int jet_class_category_no, String jet_class_name,
			String jet_class_content, double jet_class_latitude, double jet_class_longitude, int jet_class_price,
			int jet_class_totaltime, int jet_class_max_headcount, Date jet_class_writedate, String jet_class_address) {
		super();
		this.jet_class_no = jet_class_no;
		this.jet_member_no = jet_member_no;
		this.jet_class_category_no = jet_class_category_no;
		this.jet_class_name = jet_class_name;
		this.jet_class_content = jet_class_content;
		this.jet_class_latitude = jet_class_latitude;
		this.jet_class_longitude = jet_class_longitude;
		this.jet_class_price = jet_class_price;
		this.jet_class_totaltime = jet_class_totaltime;
		this.jet_class_max_headcount = jet_class_max_headcount;
		this.jet_class_writedate = jet_class_writedate;
		this.jet_class_address = jet_class_address;
	}
	public int getJet_class_no() {
		return jet_class_no;
	}
	public void setJet_class_no(int jet_class_no) {
		this.jet_class_no = jet_class_no;
	}
	public int getJet_member_no() {
		return jet_member_no;
	}
	public void setJet_member_no(int jet_member_no) {
		this.jet_member_no = jet_member_no;
	}
	public int getJet_class_category_no() {
		return jet_class_category_no;
	}
	public void setJet_class_category_no(int jet_class_category_no) {
		this.jet_class_category_no = jet_class_category_no;
	}
	public String getJet_class_name() {
		return jet_class_name;
	}
	public void setJet_class_name(String jet_class_name) {
		this.jet_class_name = jet_class_name;
	}
	public String getJet_class_content() {
		return jet_class_content;
	}
	public void setJet_class_content(String jet_class_content) {
		this.jet_class_content = jet_class_content;
	}
	public double getJet_class_latitude() {
		return jet_class_latitude;
	}
	public void setJet_class_latitude(double jet_class_latitude) {
		this.jet_class_latitude = jet_class_latitude;
	}
	public double getJet_class_longitude() {
		return jet_class_longitude;
	}
	public void setJet_class_longitude(double jet_class_longitude) {
		this.jet_class_longitude = jet_class_longitude;
	}
	public int getJet_class_price() {
		return jet_class_price;
	}
	public void setJet_class_price(int jet_class_price) {
		this.jet_class_price = jet_class_price;
	}
	public int getJet_class_totaltime() {
		return jet_class_totaltime;
	}
	public void setJet_class_totaltime(int jet_class_totaltime) {
		this.jet_class_totaltime = jet_class_totaltime;
	}
	public int getJet_class_max_headcount() {
		return jet_class_max_headcount;
	}
	public void setJet_class_max_headcount(int jet_class_max_headcount) {
		this.jet_class_max_headcount = jet_class_max_headcount;
	}
	public Date getJet_class_writedate() {
		return jet_class_writedate;
	}
	public void setJet_class_writedate(Date jet_class_writedate) {
		this.jet_class_writedate = jet_class_writedate;
	}
	public String getJet_class_address() {
		return jet_class_address;
	}
	public void setJet_class_address(String jet_class_address) {
		this.jet_class_address = jet_class_address;
	}
	
	   
}
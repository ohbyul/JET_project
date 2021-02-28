package com.cjo.jet.vo;

public class ClassImageVo {
	
	private int jet_class_image_no;
	private int jet_class_no;
	private String jet_class_image_link;
	
	public ClassImageVo() {
		super();
	}
	
	public ClassImageVo(int jet_class_image_no, int jet_class_no, String jet_class_image_link) {
		super();
		this.jet_class_image_no = jet_class_image_no;
		this.jet_class_no = jet_class_no;
		this.jet_class_image_link = jet_class_image_link;
	}
	
	public int getJet_class_image_no() {
		return jet_class_image_no;
	}
	public void setJet_class_image_no(int jet_class_image_no) {
		this.jet_class_image_no = jet_class_image_no;
	}
	public int getJet_class_no() {
		return jet_class_no;
	}
	public void setJet_class_no(int jet_class_no) {
		this.jet_class_no = jet_class_no;
	}
	public String getJet_class_image_link() {
		return jet_class_image_link;
	}
	public void setJet_class_image_link(String jet_class_image_link) {
		this.jet_class_image_link = jet_class_image_link;
	}
}
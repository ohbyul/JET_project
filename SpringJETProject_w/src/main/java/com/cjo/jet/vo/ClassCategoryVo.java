package com.cjo.jet.vo;

public class ClassCategoryVo {

	private int jet_class_category_no;
    private String jet_class_category_name;
    
	public ClassCategoryVo() {
		super();
	}
	
	public ClassCategoryVo(int jet_class_category_no, String jet_class_category_name) {
		super();
		this.jet_class_category_no = jet_class_category_no;
		this.jet_class_category_name = jet_class_category_name;
	}
	public int getJet_class_category_no() {
		return jet_class_category_no;
	}
	public void setJet_class_category_no(int jet_class_category_no) {
		this.jet_class_category_no = jet_class_category_no;
	}
	public String getJet_class_category_name() {
		return jet_class_category_name;
	}
	public void setJet_class_category_name(String jet_class_category_name) {
		this.jet_class_category_name = jet_class_category_name;
	}
}
package com.cjo.jet.vo;

public class MemberImageVo {

	private int jet_member_image_no;
	private int jet_member_no;
	private String jet_member_image_link;
	
	public MemberImageVo() {
		super();
	}

	public MemberImageVo(int jet_member_image_no, int jet_member_no, String jet_member_image_link) {
		super();
		this.jet_member_image_no = jet_member_image_no;
		this.jet_member_no = jet_member_no;
		this.jet_member_image_link = jet_member_image_link;
	}

	public int getJet_member_image_no() {
		return jet_member_image_no;
	}

	public void setJet_member_image_no(int jet_member_image_no) {
		this.jet_member_image_no = jet_member_image_no;
	}

	public int getJet_member_no() {
		return jet_member_no;
	}

	public void setJet_member_no(int jet_member_no) {
		this.jet_member_no = jet_member_no;
	}

	public String getJet_member_image_link() {
		return jet_member_image_link;
	}

	public void setJet_member_image_link(String jet_member_image_link) {
		this.jet_member_image_link = jet_member_image_link;
	}
	
	
	
}

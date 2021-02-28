package com.cjo.jet.vo;

import java.util.Date;

public class ClassReviewVo {
	
	private int jet_class_review_no;
    private int jet_class_detail_no;
    private int jet_member_no;
    private float jet_class_review_star_rating;
    private String jet_class_review_content;
    private Date jet_class_review_writedate;
	
    public ClassReviewVo() {
		super();
	}

	public ClassReviewVo(int jet_class_review_no, int jet_class_detail_no, int jet_member_no,
			float jet_class_review_star_rating, String jet_class_review_content, Date jet_class_review_writedate) {
		super();
		this.jet_class_review_no = jet_class_review_no;
		this.jet_class_detail_no = jet_class_detail_no;
		this.jet_member_no = jet_member_no;
		this.jet_class_review_star_rating = jet_class_review_star_rating;
		this.jet_class_review_content = jet_class_review_content;
		this.jet_class_review_writedate = jet_class_review_writedate;
	}

	public int getJet_class_review_no() {
		return jet_class_review_no;
	}

	public void setJet_class_review_no(int jet_class_review_no) {
		this.jet_class_review_no = jet_class_review_no;
	}

	public int getJet_class_detail_no() {
		return jet_class_detail_no;
	}

	public void setJet_class_detail_no(int jet_class_detail_no) {
		this.jet_class_detail_no = jet_class_detail_no;
	}

	public int getJet_member_no() {
		return jet_member_no;
	}

	public void setJet_member_no(int jet_member_no) {
		this.jet_member_no = jet_member_no;
	}

	public float getJet_class_review_star_rating() {
		return jet_class_review_star_rating;
	}

	public void setJet_class_review_star_rating(float jet_class_review_star_rating) {
		this.jet_class_review_star_rating = jet_class_review_star_rating;
	}

	public String getJet_class_review_content() {
		return jet_class_review_content;
	}

	public void setJet_class_review_content(String jet_class_review_content) {
		this.jet_class_review_content = jet_class_review_content;
	}

	public Date getJet_class_review_writedate() {
		return jet_class_review_writedate;
	}

	public void setJet_class_review_writedate(Date jet_class_review_writedate) {
		this.jet_class_review_writedate = jet_class_review_writedate;
	}
    
    

    
}
package com.cjo.jet.vo;

public class ClassPickVo {
	
    private int jet_class_pick_no;
    private int jet_member_no;
    private int jet_class_detail_no;
	
    public ClassPickVo() {
		super();
	}

	public ClassPickVo(int jet_class_pick_no, int jet_member_no, int jet_class_detail_no) {
		super();
		this.jet_class_pick_no = jet_class_pick_no;
		this.jet_member_no = jet_member_no;
		this.jet_class_detail_no = jet_class_detail_no;
	}

	public int getJet_class_pick_no() {
		return jet_class_pick_no;
	}

	public void setJet_class_pick_no(int jet_class_pick_no) {
		this.jet_class_pick_no = jet_class_pick_no;
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
	
    

}

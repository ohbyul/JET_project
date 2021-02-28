package com.cjo.jet.vo;

import java.util.Date;

public class SharePlanRepleVo {
   private int jet_shareplan_reple_no;
   private int jet_member_no;
   private int jet_board_shareplan_no;
   private String jet_shareplan_reple_content;
   private Date jet_shareplan_reple_writedate;
   public SharePlanRepleVo() {
      super();
   }
   public SharePlanRepleVo(int jet_shareplan_reple_no, int jet_member_no, int jet_board_shareplan_no,
         String jet_shareplan_reple_content, Date jet_shareplan_reple_writedate) {
      super();
      this.jet_shareplan_reple_no = jet_shareplan_reple_no;
      this.jet_member_no = jet_member_no;
      this.jet_board_shareplan_no = jet_board_shareplan_no;
      this.jet_shareplan_reple_content = jet_shareplan_reple_content;
      this.jet_shareplan_reple_writedate = jet_shareplan_reple_writedate;
   }
   public int getJet_shareplan_reple_no() {
      return jet_shareplan_reple_no;
   }
   public void setJet_shareplan_reple_no(int jet_shareplan_reple_no) {
      this.jet_shareplan_reple_no = jet_shareplan_reple_no;
   }
   public int getJet_member_no() {
      return jet_member_no;
   }
   public void setJet_member_no(int jet_member_no) {
      this.jet_member_no = jet_member_no;
   }
   public int getJet_board_shareplan_no() {
      return jet_board_shareplan_no;
   }
   public void setJet_board_shareplan_no(int jet_board_shareplan_no) {
      this.jet_board_shareplan_no = jet_board_shareplan_no;
   }
   public String getJet_shareplan_reple_content() {
      return jet_shareplan_reple_content;
   }
   public void setJet_shareplan_reple_content(String jet_shareplan_reple_content) {
      this.jet_shareplan_reple_content = jet_shareplan_reple_content;
   }
   public Date getJet_shareplan_reple_writedate() {
      return jet_shareplan_reple_writedate;
   }
   public void setJet_shareplan_reple_writedate(Date jet_shareplan_reple_writedate) {
      this.jet_shareplan_reple_writedate = jet_shareplan_reple_writedate;
   }
   
}
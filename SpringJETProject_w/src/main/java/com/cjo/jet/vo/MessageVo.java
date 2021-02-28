package com.cjo.jet.vo;

import java.util.Date;

public class MessageVo {
		// insert할 값 5개에 대한 vo들
	 	private int jet_message_no; 
	 	private int jet_member_sender;
	 	private int jet_member_receiver; 
	 	private String jet_message_title;
	 	private String jet_message_content;
		private Date jet_message_senddate;
		private Date jet_message_opendate;
		public MessageVo() {
			super();
		}
		public MessageVo(int jet_message_no, int jet_member_sender, int jet_member_receiver, String jet_message_title,
				String jet_message_content, Date jet_message_senddate, Date jet_message_opendate) {
			super();
			this.jet_message_no = jet_message_no;
			this.jet_member_sender = jet_member_sender;
			this.jet_member_receiver = jet_member_receiver;
			this.jet_message_title = jet_message_title;
			this.jet_message_content = jet_message_content;
			this.jet_message_senddate = jet_message_senddate;
			this.jet_message_opendate = jet_message_opendate;
		}
		public int getJet_message_no() {
			return jet_message_no;
		}
		public void setJet_message_no(int jet_message_no) {
			this.jet_message_no = jet_message_no;
		}
		public int getJet_member_sender() {
			return jet_member_sender;
		}
		public void setJet_member_sender(int jet_member_sender) {
			this.jet_member_sender = jet_member_sender;
		}
		public int getJet_member_receiver() {
			return jet_member_receiver;
		}
		public void setJet_member_receiver(int jet_member_receiver) {
			this.jet_member_receiver = jet_member_receiver;
		}
		public String getJet_message_title() {
			return jet_message_title;
		}
		public void setJet_message_title(String jet_message_title) {
			this.jet_message_title = jet_message_title;
		}
		public String getJet_message_content() {
			return jet_message_content;
		}
		public void setJet_message_content(String jet_message_content) {
			this.jet_message_content = jet_message_content;
		}
		public Date getJet_message_senddate() {
			return jet_message_senddate;
		}
		public void setJet_message_senddate(Date jet_message_senddate) {
			this.jet_message_senddate = jet_message_senddate;
		}
		public Date getJet_message_opendate() {
			return jet_message_opendate;
		}
		public void setJet_message_opendate(Date jet_message_opendate) {
			this.jet_message_opendate = jet_message_opendate;
		}
		
		
}

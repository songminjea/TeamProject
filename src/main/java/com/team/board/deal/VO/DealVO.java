package com.team.board.deal.VO;

import java.sql.Timestamp;

public class DealVO {
	private int deal_num;
	private String deal_id;
	private String deal_subject;
	private String deal_content;
	private String deal_region;
	private String deal_img;
	private int deal_re_ref;
	private int deal_re_lev;
	private int deal_re_seq;
	private int deal_re_readcount;
	private Timestamp deal_datetime;
	private String deal_ip;
	
	
	public int getDeal_num() {
		return deal_num;
	}
	public void setDeal_num(int deal_num) {
		this.deal_num = deal_num;
	}
	public String getDeal_id() {
		return deal_id;
	}
	public void setDeal_id(String deal_id) {
		this.deal_id = deal_id;
	}
	public String getDeal_subject() {
		return deal_subject;
	}
	public void setDeal_subject(String deal_subject) {
		this.deal_subject = deal_subject;
	}
	public String getDeal_content() {
		return deal_content;
	}
	public void setDeal_content(String deal_content) {
		this.deal_content = deal_content;
	}
	public String getDeal_region() {
		return deal_region;
	}
	public void setDeal_region(String deal_region) {
		this.deal_region = deal_region;
	}
	public String getDeal_img() {
		return deal_img;
	}
	public void setDeal_img(String deal_img) {
		this.deal_img = deal_img;
	}
	public int getDeal_re_ref() {
		return deal_re_ref;
	}
	public void setDeal_re_ref(int deal_re_ref) {
		this.deal_re_ref = deal_re_ref;
	}
	public int getDeal_re_lev() {
		return deal_re_lev;
	}
	public void setDeal_re_lev(int deal_re_lev) {
		this.deal_re_lev = deal_re_lev;
	}
	public int getDeal_re_seq() {
		return deal_re_seq;
	}
	public void setDeal_re_seq(int deal_re_seq) {
		this.deal_re_seq = deal_re_seq;
	}
	public int getDeal_re_readcount() {
		return deal_re_readcount;
	}
	public void setDeal_re_readcount(int deal_re_readcount) {
		this.deal_re_readcount = deal_re_readcount;
	}
	public Timestamp getDeal_datetime() {
		return deal_datetime;
	}
	public void setDeal_datetime(Timestamp deal_datetime) {
		this.deal_datetime = deal_datetime;
	}
	public String getDeal_ip() {
		return deal_ip;
	}
	public void setDeal_ip(String deal_ip) {
		this.deal_ip = deal_ip;
	}
	
	

}

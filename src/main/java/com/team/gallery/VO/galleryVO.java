package com.team.gallery.VO;

import java.sql.Timestamp;

public class galleryVO {
	
	private int gb_Num;
	private int gb_Group;
	private String mb_ID;
	private String gb_Subject;
	private String gb_Content;
	private String[] gb_Image;
	private Timestamp gb_Date;
	private String gb_IP;
	private String gb_Privacy;
	private int fileCnt;
	
	
	public int getGb_Num() {
		return gb_Num;
	}
	public void setGb_Num(int gb_Num) {
		this.gb_Num = gb_Num;
	}
	public int getGb_Group() {
		return gb_Group;
	}
	public void setGb_Group(int gb_Group) {
		this.gb_Group = gb_Group;
	}
	public String getMb_ID() {
		return mb_ID;
	}
	public void setMb_ID(String mb_ID) {
		this.mb_ID = mb_ID;
	}
	public String getGb_Subject() {
		return gb_Subject;
	}
	public void setGb_Subject(String gb_Subject) {
		this.gb_Subject = gb_Subject;
	}
	public String getGb_Content() {
		return gb_Content;
	}
	public void setGb_Content(String gb_Content) {
		this.gb_Content = gb_Content;
	}
	public String[] getGb_Image() {
		return gb_Image;
	}
	public void setGb_Image(String[] gb_Image) {
		this.gb_Image = gb_Image;
	}
	public Timestamp getGb_Date() {
		return gb_Date;
	}
	public void setGb_Date(Timestamp gb_Date) {
		this.gb_Date = gb_Date;
	}
	public String getGb_IP() {
		return gb_IP;
	}
	public void setGb_IP(String gb_IP) {
		this.gb_IP = gb_IP;
	}
	public String getGb_Privacy() {
		return gb_Privacy;
	}
	public void setGb_Privacy(String gb_Privacy) {
		this.gb_Privacy = gb_Privacy;
	}
	public int getFileCnt() {
		return fileCnt;
	}
	public void setFileCnt(int fileCnt) {
		this.fileCnt = fileCnt;
	}
	
	
	
	
	
}

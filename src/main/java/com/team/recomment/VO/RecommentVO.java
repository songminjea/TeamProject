package com.team.recomment.VO;

import java.sql.Timestamp;

public class RecommentVO {
	private int CM_Seq;
	private int GB_Num;
	private String MB_ID;
	private String CM_Content;
	private Timestamp CM_Date;
	private String CM_IP;
	private int CM_Lev;
	private int CM_Ref;
	
	//getter,setter 추가
	public int getCM_Seq() {
		return CM_Seq;
	}
	public void setCM_Seq(int cM_Seq) {
		CM_Seq = cM_Seq;
	}
	public int getGB_Num() {
		return GB_Num;
	}
	public void setGB_Num(int gB_Num) {
		GB_Num = gB_Num;
	}
	public String getMB_ID() {
		return MB_ID;
	}
	public void setMB_ID(String mB_ID) {
		MB_ID = mB_ID;
	}
	public String getCM_Content() {
		return CM_Content;
	}
	public void setCM_Content(String cM_Content) {
		CM_Content = cM_Content;
	}
	public Timestamp getCM_Date() {
		return CM_Date;
	}
	public void setCM_Date(Timestamp cM_Date) {
		CM_Date = cM_Date;
	}
	public String getCM_IP() {
		return CM_IP;
	}
	public void setCM_IP(String cM_IP) {
		CM_IP = cM_IP;
	}
	public int getCM_Lev() {
		return CM_Lev;
	}
	public void setCM_Lev(int cM_Lev) {
		CM_Lev = cM_Lev;
	}
	public int getCM_Ref() {
		return CM_Ref;
	}
	public void setCM_Ref(int cM_Ref) {
		CM_Ref = cM_Ref;
	}
	
	
}

package com.test.sts;

import java.sql.Timestamp;

public class LoginDTO {
	private String ID;	
	private String PWD;	
	private String NAME;	
	private String PHONE;	
	private String EMAIL;
	private String PIC;	
	private Timestamp DATE;
	private Timestamp MODDATE;
	private int FOLLOWER;
	private int FOLLOWING;
	private String BIRTH;
	
	
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getPWD() {
		return PWD;
	}
	public void setPWD(String pWD) {
		PWD = pWD;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getPHONE() {
		return PHONE;
	}
	public void setPHONE(String pHONE) {
		PHONE = pHONE;
	}
	public String getEMAIL() {
		return EMAIL;
	}
	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}
	public String getPIC() {
		return PIC;
	}
	public void setPIC(String pIC) {
		PIC = pIC;
	}
	public Timestamp getDATE() {
		return DATE;
	}
	public void setDATE(Timestamp dATE) {
		DATE = dATE;
	}
	public Timestamp getMODDATE() {
		return MODDATE;
	}
	public void setMODDATE(Timestamp mODDATE) {
		MODDATE = mODDATE;
	}
	public int getFOLLOWER() {
		return FOLLOWER;
	}
	public void setFOLLOWER(int fOLLOWER) {
		FOLLOWER = fOLLOWER;
	}
	public int getFOLLOWING() {
		return FOLLOWING;
	}
	public void setFOLLOWING(int fOLLOWING) {
		FOLLOWING = fOLLOWING;
	}
	public String getBIRTH() {
		return BIRTH;
	}
	public void setBIRTH(String bIRTH) {
		BIRTH = bIRTH;
	}	
	
	
}

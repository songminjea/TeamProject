package com.team.chat.VO;

import java.sql.Timestamp;
//채팅방 생성
public class ChatroomVO {

	private int CHATROOM_NO;
	private String CHATROOM_SENDER;
	private String CHATROOM_RECEIVER;
	private Timestamp CHATROOM_MAKETIME;
	private String CHATROOM_SENDCONTENT;
	private boolean CHATROOM_READVAL;
	private boolean CHATROOM_SENDVAL;
	
	//getter, setter 생성
	public int getCHATROOM_NO() {
		return CHATROOM_NO;
	}
	public void setCHATROOM_NO(int cHATROOM_NO) {
		CHATROOM_NO = cHATROOM_NO;
	}
	public String getCHATROOM_SENDER() {
		return CHATROOM_SENDER;
	}
	public void setCHATROOM_SENDER(String cHATROOM_SENDER) {
		CHATROOM_SENDER = cHATROOM_SENDER;
	}
	public String getCHATROOM_RECEIVER() {
		return CHATROOM_RECEIVER;
	}
	public void setCHATROOM_RECEIVER(String cHATROOM_RECEIVER) {
		CHATROOM_RECEIVER = cHATROOM_RECEIVER;
	}
	public Timestamp getCHATROOM_MAKETIME() {
		return CHATROOM_MAKETIME;
	}
	public void setCHATROOM_MAKETIME(Timestamp cHATROOM_MAKETIME) {
		CHATROOM_MAKETIME = cHATROOM_MAKETIME;
	}
	public String getCHATROOM_SENDCONTENT() {
		return CHATROOM_SENDCONTENT;
	}
	public void setCHATROOM_SENDCONTENT(String cHATROOM_SENDCONTENT) {
		CHATROOM_SENDCONTENT = cHATROOM_SENDCONTENT;
	}
	public boolean isCHATROOM_READVAL() {
		return CHATROOM_READVAL;
	}
	public void setCHATROOM_READVAL(boolean cHATROOM_READVAL) {
		CHATROOM_READVAL = cHATROOM_READVAL;
	}
	public boolean isCHATROOM_SENDVAL() {
		return CHATROOM_SENDVAL;
	}
	public void setCHATROOM_SENDVAL(boolean cHATROOM_SENDVAL) {
		CHATROOM_SENDVAL = cHATROOM_SENDVAL;
	}
	
}

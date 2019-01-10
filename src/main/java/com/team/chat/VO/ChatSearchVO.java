package com.team.chat.VO;

//채팅 검색을 위한 메서드
public class ChatSearchVO extends ChatCriteria{
	private String keyword;

	//getter, setter 메서드
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}

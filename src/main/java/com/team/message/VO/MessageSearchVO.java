package com.team.message.VO;

//쪽지 검색을 위한 메서드
public class MessageSearchVO extends MessageCriteria{
	private String searchType;
	private String keyword;
	
	//getter, setter 메서드
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

}

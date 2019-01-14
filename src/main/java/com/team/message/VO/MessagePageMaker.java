package com.team.message.VO;

public class MessagePageMaker {
	
	//페이지당 쪽지 개수
	private int PAGE_SCALE = 10;
	//화면당 페이지 수
	private int BLOCK_SCALE = 10;
	private int curPage = 1; //현재 페이지
	private int prevPage; //이전 페이지
	private int nextPage; //다음 페이지
	private int totPage; //전체 페이지 개수
	private int totBlock; //전체 페이지 블록 개수
	private int curBlock = 1; //현재 페이지 블록
	
	private int countAll; //총 쪽지 수
	
	private int startPage = 1; //시작 페이지
	private int endPage = 1; //끝 페이지
	private int startIndex = 0; //시작 인덱스
	
	
	//생성자
	//레코드 개수, 현재 페이지 번호
	public MessagePageMaker(int countAll, int curPage) {
		setCurPage(curPage);
		setCountAll(countAll);
		//총 페이지 수
		setTotPage(countAll);
		setTotBlock(totPage);
		rangeSetting(curPage);
		setStartIndex(curPage);
	}
		
	//getter, setter
	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getTotPage() {
		return totPage;
	}

	public void setTotPage(int countAll) {
		this.totPage = (int)Math.ceil(countAll*1.0/PAGE_SCALE);
	}

	public int getTotBlock() {
		return totBlock;
	}
	//페이지 블록의 개수 계산
	public void setTotBlock(int totPage) {
		this.totBlock = (int)Math.ceil(totPage*1.0/BLOCK_SCALE);
	}
	
	public void rangeSetting(int curPage) {
		setCurBlock(curPage);
		this.startPage = (curPage - 1)*BLOCK_SCALE+1;
		this.endPage = startPage + BLOCK_SCALE-1;
		if (endPage > totPage) {
			this.endPage = totPage;
		}
		this.prevPage = curPage - 1;
		this.nextPage = curPage + 1;
	}

	public int getCurBlock() {
		return curBlock;
	}

	public void setCurBlock(int curPage) {
		this.curBlock = (int)((curPage-1)/BLOCK_SCALE)+1;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getPAGE_SCALE() {
		return PAGE_SCALE;
	}

	public void setPAGE_SCALE(int pAGE_SCALE) {
		PAGE_SCALE = pAGE_SCALE;
	}

	public int getBLOCK_SCALE() {
		return BLOCK_SCALE;
	}

	public void setBLOCK_SCALE(int bLOCK_SCALE) {
		BLOCK_SCALE = bLOCK_SCALE;
	}

	public int getCountAll() {
		return countAll;
	}

	public void setCountAll(int countAll) {
		this.countAll = countAll;
	}
	
	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int curPage) {
		this.startIndex = (curPage-1)*PAGE_SCALE;
	}
	
}

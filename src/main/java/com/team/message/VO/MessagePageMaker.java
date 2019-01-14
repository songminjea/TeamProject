package com.team.message.VO;

public class MessagePageMaker {
	
	//페이지당 쪽지 개수
	private int PAGE_SCALE = 10;
	//화면당 페이지 수
	private int BLOCK_SCALE = 10;
	private int curPage; //현재 페이지
	private int prevPage; //이전 페이지
	private int nextPage; //다음 페이지
	private int totPage; //전체 페이지 개수
	private int totBlock; //전체 페이지 블록 개수
	private int curBlock; //현재 페이지 블록
	private int prevBlock;
	private int nextBlock;
	
	private int countAll; //총 쪽지 수
	
	private int startPage = 1; //시작 페이지
	private int endPage = 1; //끝 페이지
	
	private int blockBegin;
	private int blockEnd;
	
	//생성자
	//레코드 개수, 현재 페이지 번호
	public MessagePageMaker(int countAll, int curPage) {
		curBlock = 1; //현재 페이지 블록 번호
		this.curPage = curPage;
		setTotPage(countAll);
		setPageRange();
		setTotBlock();
		setBlockRange();
	}

	public void setBlockRange() {
		curBlock = (int)Math.ceil((curPage-1)/BLOCK_SCALE)+1;
		blockBegin = (curBlock-1)*BLOCK_SCALE+1;
		blockEnd = blockBegin+BLOCK_SCALE-1;
		if (blockEnd > totPage) {
			blockEnd = totPage;
		}
		prevPage = (curPage == 1)? 1:(curBlock-1)*BLOCK_SCALE;
		nextPage = curBlock > totBlock ? (curBlock*BLOCK_SCALE) : (curBlock*BLOCK_SCALE)+1;
		if (nextPage >= totPage) {
			nextPage = totPage;
		}
	}
	
	public void setPageRange() {
		startPage = (curPage-1)*PAGE_SCALE+1;
		endPage = startPage + PAGE_SCALE-1;
	}
	
	//getter, setter 메서드
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

	public void setTotPage(int totPage) {
		totPage = (int)Math.ceil(countAll*1.0 / PAGE_SCALE);
	}

	public int getTotBlock() {
		return totBlock;
	}

	public void setTotBlock() {
		totBlock = (int)Math.ceil(totPage / BLOCK_SCALE);
	}

	public int getCurBlock() {
		return curBlock;
	}

	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}

	public int getPrevBlock() {
		return prevBlock;
	}

	public void setPrevBlock(int prevBlock) {
		this.prevBlock = prevBlock;
	}

	public int getNextBlock() {
		return nextBlock;
	}

	public void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
	}

	public int getCountAll() {
		return countAll;
	}

	public void setCountAll(int countAll) {
		this.countAll = countAll;
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

	public int getBlockBegin() {
		return blockBegin;
	}

	public void setBlockBegin(int blockBegin) {
		this.blockBegin = blockBegin;
	}

	public int getBlockEnd() {
		return blockEnd;
	}

	public void setBlockEnd(int blockEnd) {
		this.blockEnd = blockEnd;
	}
	
}

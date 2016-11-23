/*
 * 페이징 처리를 구현하기 위한 클래스
 */
package com.raonis.board.util;

public class Paging {
	private int start=1;
	private int end;
	private int nowPage=1;
	private int nowBlock=0;
	private int recordPerPage=10;//한 페이지당 레코드 수를 초기화
	private int totalPage;
	private int totalBlock;
	private int pagePerBlock=5;//한 블럭당 페이지 수를 초기화( 이전 1 2 3 4 5 다음  모양으로 구성)	
	
	private Search search;
	
	public Paging(){}
	
	//생성자로 페이징에 필요한 2가지 요소를 입력받음
	public Paging(int totalRecord, int nowBlock){
		totalPage=(int)Math.ceil((double)totalRecord/(double)recordPerPage);
		totalBlock=(int)Math.ceil((double)totalPage/(double)pagePerBlock)-1;
		setStartEnd(nowBlock);
	}
	
	//여기서에서의 start는 이전버튼 다음에 오는 숫자를 지정하고 end은 다음버튼 뒤의 숫자를 지정
	public void setStartEnd(int nowBlock){
		start=start+(nowBlock*pagePerBlock);
		end=start+pagePerBlock-1;
		if(end>totalPage){
			end=totalPage;
		}
	}
	
	public void setNowPage(int nowPage){
		this.nowPage=nowPage;
	}
	
	public void setNowBlock(int nowBlock){
		this.nowBlock=nowBlock;
	}
	
	public void setRecordPerPage(int recordPerPage){
		this.recordPerPage=recordPerPage;
	}
	
	
	public int getStart(){
		return start;
	}
	
	public int getEnd(){
		return end;
	}
	
	public int getNowBlock(){
		return nowBlock;
	}
	
	public int getTotalBlock(){
		return totalBlock;
	}

	public int getRecordPerPage(){
		return recordPerPage;
	}
	
	public int getPagePerBlock(){
		return pagePerBlock;
	}
	
	public int getNowPage(){
		return nowPage;
	}
	
	public Search getSearch() {
		return search;
	}
	public void setSearch(Search search) {
		this.search = search;
	}
	
	
	
}

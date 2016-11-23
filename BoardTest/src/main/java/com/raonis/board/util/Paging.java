/*
 * ����¡ ó���� �����ϱ� ���� Ŭ����
 */
package com.raonis.board.util;

public class Paging {
	private int start=1;
	private int end;
	private int nowPage=1;
	private int nowBlock=0;
	private int recordPerPage=10;//�� �������� ���ڵ� ���� �ʱ�ȭ
	private int totalPage;
	private int totalBlock;
	private int pagePerBlock=5;//�� ���� ������ ���� �ʱ�ȭ( ���� 1 2 3 4 5 ����  ������� ����)	
	
	private Search search;
	
	public Paging(){}
	
	//�����ڷ� ����¡�� �ʿ��� 2���� ��Ҹ� �Է¹���
	public Paging(int totalRecord, int nowBlock){
		totalPage=(int)Math.ceil((double)totalRecord/(double)recordPerPage);
		totalBlock=(int)Math.ceil((double)totalPage/(double)pagePerBlock)-1;
		setStartEnd(nowBlock);
	}
	
	//���⼭������ start�� ������ư ������ ���� ���ڸ� �����ϰ� end�� ������ư ���� ���ڸ� ����
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

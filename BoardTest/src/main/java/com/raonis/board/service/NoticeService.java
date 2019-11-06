package com.raonis.board.service;

import java.util.List;

import com.raonis.board.domain.NoticeVO;
import com.raonis.board.util.Search;

public interface NoticeService {
	public void write(NoticeVO vo);
	public void update(NoticeVO vo);
	public int count(Search search);
	public NoticeVO read(int num, String use);
	public void delete(int num);
	public List<NoticeVO> list(int start, int recordPerPage, Search search);
	public void fileDel(int num);
}

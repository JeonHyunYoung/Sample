package com.raonis.board.repository;

import java.util.List;

import com.raonis.board.domain.NoticeVO;
import com.raonis.board.util.Search;

public interface NoticeDao {
	public void write(NoticeVO vo);
	public void update(NoticeVO vo);
	public NoticeVO read(int num);
	public int count(Search search);
	public void addViewCount(int num);
	public void delete(int num);
	public List<NoticeVO> list(int start, int recordPerPage, Search search);
	public void fileDel(int num);
}

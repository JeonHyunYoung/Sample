package com.raonis.board.repository;

import java.util.List;

import com.raonis.board.domain.QnaVO;

public interface QnaDao {
	public void question(QnaVO vo);
	public void answer(QnaVO vo);
	public void update(QnaVO vo);
	public QnaVO read(int num);
	public void addViewCount(int num);
	public void delete(int num);
	public List<QnaVO> list();
}

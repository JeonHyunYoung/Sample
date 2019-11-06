package com.raonis.board.service;

import java.util.List;

import com.raonis.board.domain.QnaVO;


public interface QnaService {
	public void qestion(QnaVO vo);
	public void answer(QnaVO vo);
	public void update(QnaVO vo);
	public QnaVO read(int num, String use);
	public void delete(int num);
	public List<QnaVO> list();
}

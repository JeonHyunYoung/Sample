package com.raonis.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.raonis.board.domain.QnaVO;
import com.raonis.board.repository.QnaDao;

@Service
public class QnaServiceImpl implements QnaService{

	@Autowired
	private QnaDao dao;

	@Override
	public void update(QnaVO vo) {
		dao.update(vo);
	}

	@Override
	public QnaVO read(int num, String use) {
		if(use.equals("read")){
			dao.addViewCount(num);
		}
		return dao.read(num);
	}

	@Override
	public void delete(int num) {
		dao.delete(num);
	}
	@Override
	public List<QnaVO> list() {
		return dao.list();
	}

	@Override
	public void qestion(QnaVO vo) {
		dao.question(vo);
	}

	@Override
	public void answer(QnaVO vo) {
		dao.answer(vo);
	}
	
	
}

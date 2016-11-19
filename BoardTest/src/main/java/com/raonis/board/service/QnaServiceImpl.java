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
	public void write(QnaVO vo, String use) {
		if(use.equals("question")){
			dao.question(vo);
		}
		else {
			dao.answer(vo);
		}
	}

	@Override
	public void update(QnaVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public QnaVO read(int num, String use) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(int num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<QnaVO> list() {
		return dao.list();
	}
	
	
}

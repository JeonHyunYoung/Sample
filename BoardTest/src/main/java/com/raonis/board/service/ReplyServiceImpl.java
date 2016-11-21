package com.raonis.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.raonis.board.domain.ReplyVO;
import com.raonis.board.repository.ReplyDao;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyDao dao;
	
	@Override
	public void write(ReplyVO vo) {
		dao.write(vo);
		dao.addReplyCount(vo.getNum());
	}

	@Override
	public List<ReplyVO> list(int num) {
		return dao.list(num);
	}
	
}

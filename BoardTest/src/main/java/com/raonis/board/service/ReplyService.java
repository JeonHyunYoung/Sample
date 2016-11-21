package com.raonis.board.service;

import java.util.List;

import com.raonis.board.domain.ReplyVO;

public interface ReplyService {
	public void write(ReplyVO vo);
	public List<ReplyVO> list(int num);
}

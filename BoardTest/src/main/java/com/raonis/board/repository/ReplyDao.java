package com.raonis.board.repository;

import java.util.List;

import com.raonis.board.domain.ReplyVO;

public interface ReplyDao {
	public void write(ReplyVO vo);
	public List<ReplyVO> list(int num);
	public void addReplyCount(int num);
}

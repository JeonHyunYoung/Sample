package com.raonis.board.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.raonis.board.domain.ReplyVO;

@Repository
public class ReplyDaoImpl implements ReplyDao{
	
	private static final String NAMESPACE="mappers.replyMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void write(ReplyVO vo) {

		sqlSession.insert(NAMESPACE+".write", vo);
	}

	@Override
	public List<ReplyVO> list(int num) {
		return sqlSession.selectList(NAMESPACE+".list", num);
	}

	@Override
	public void addReplyCount(int num) {
		sqlSession.update(NAMESPACE+".addReplyCount", num);
	}
	
}

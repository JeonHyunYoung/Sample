package com.raonis.board.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.raonis.board.domain.QnaVO;

@Repository
public class QnaDaoImpl implements QnaDao{
	
	private static final String NAMESPACE = "mappers.qnaMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void question(QnaVO vo) {
		sqlSession.insert(NAMESPACE+".question", vo);
	}

	@Override
	public void answer(QnaVO vo) {
		sqlSession.update(NAMESPACE+".pos", vo);
		sqlSession.insert(NAMESPACE+".answer", vo);		
	}
	
	@Override
	public void update(QnaVO vo) {
		sqlSession.update(NAMESPACE+".update", vo);		

	}

	@Override
	public QnaVO read(int num) {
		return sqlSession.selectOne(NAMESPACE+".read", num);
		
	}

	@Override
	public void addViewCount(int num) {
		sqlSession.update(NAMESPACE+".addViewCount", num);
	}

	@Override
	public void delete(int num) {
		sqlSession.delete(NAMESPACE+".delete", num);
	}

	@Override
	public List<QnaVO> list() {
		return sqlSession.selectList(NAMESPACE+".list");
	}


	
}

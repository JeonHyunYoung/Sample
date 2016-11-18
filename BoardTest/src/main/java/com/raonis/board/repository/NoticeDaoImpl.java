package com.raonis.board.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.raonis.board.domain.NoticeVO;
import com.raonis.board.util.Search;

@Repository
public class NoticeDaoImpl implements NoticeDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "mappers.noticeMapper";
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeDaoImpl.class);
	
	@Override
	public void write(NoticeVO vo) {
		sqlSession.insert(NAMESPACE+".write", vo);
	}

	@Override
	public void update(NoticeVO vo) {
		if(vo.getFilename()==null){
			sqlSession.update(NAMESPACE+".update", vo);
		}
		else{
			sqlSession.update(NAMESPACE+".update1", vo);
		}
	}

	@Override
	public NoticeVO read(int num) {
		return sqlSession.selectOne(NAMESPACE+".read", num);
	}

	@Override
	public void delete(int num) {
		sqlSession.delete(NAMESPACE+".delete", num);
	}

	@Override
	public void addViewCount(int num) {
		sqlSession.update(NAMESPACE+".addViewCount", num);
	}

	@Override
	public List<NoticeVO> list() {
		return sqlSession.selectList(NAMESPACE+".list");
	}

	@Override
	public int count(Search search) {
		return (int)sqlSession.selectList(NAMESPACE+".count", search);
	}
	
}

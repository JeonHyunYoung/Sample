package com.raonis.board.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.raonis.board.domain.ClassVO;
import com.raonis.board.util.ClassSearch;

@Repository
public class ClassDao {
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "mappers.classMapper";
	
	public List<ClassVO> list(ClassSearch s){
		return sqlSession.selectList(NAMESPACE+".list", s);
	}
}

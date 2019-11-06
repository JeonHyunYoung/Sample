package com.raonis.board.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.raonis.board.domain.UserVO;

@Repository
public class UserDaoImpl implements UserDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "mappers.userMapper";
	private static final Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);

	public UserVO login(UserVO vo) {
		return sqlSession.selectOne(NAMESPACE+".login", vo);
	}
	
	
}

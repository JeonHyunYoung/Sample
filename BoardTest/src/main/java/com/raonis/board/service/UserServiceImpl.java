package com.raonis.board.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.raonis.board.domain.UserVO;
import com.raonis.board.repository.UserDao;
import com.raonis.board.repository.UserDaoImpl;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserDao dao;
	
	private static final Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);

	@Override
	public UserVO login(UserVO vo) {
		return dao.login(vo);
	}
}

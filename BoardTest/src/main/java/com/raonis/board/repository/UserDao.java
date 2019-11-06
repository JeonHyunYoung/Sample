package com.raonis.board.repository;

import com.raonis.board.domain.UserVO;

public interface UserDao {
	public UserVO login(UserVO vo);
}

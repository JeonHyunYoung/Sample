package com.raonis.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.raonis.board.domain.NoticeVO;
import com.raonis.board.repository.NoticeDao;
import com.raonis.board.util.Search;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	NoticeDao dao;
	
	@Override
	public void write(NoticeVO vo) {
		dao.write(vo);
	}

	@Override
	public void update(NoticeVO vo) {
		dao.update(vo);
	}

	@Override
	public NoticeVO read(int num, String use) {
		NoticeVO vo = dao.read(num);
		if(!use.equals("update")){
			dao.addViewCount(num);
		}
		return vo;
	}

	@Override
	public void delete(int num) {
		dao.delete(num);
	}

	@Override
	public int count(Search search) {
		return dao.count(search);
	}

	@Override
	public List<NoticeVO> list(int start, int recordPerPage, Search search) {
		return dao.list(start, recordPerPage, search);
	}

	@Override
	public void fileDel(int num) {
		dao.fileDel(num);
	}
	
}

package com.raonis.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.raonis.board.domain.ClassVO;
import com.raonis.board.domain.QnaVO;
import com.raonis.board.service.ClassDao;
import com.raonis.board.service.QnaService;
import com.raonis.board.util.ClassSearch;
import com.raonis.board.util.DeleteFile;

@Controller
public class QnaController {
	
	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);
	
	@Autowired
	private QnaService service;
	@Autowired
	private ClassDao dao;
	
	@RequestMapping(value = "/qna/list", method = RequestMethod.GET)
	public void list(Model model) {
		model.addAttribute("list", service.list());
	}
	
	@RequestMapping(value="/qna/write", method = RequestMethod.GET)
	public void write(Model model){
		model.addAttribute("c",dao.listAll());
	}
	
	@RequestMapping(value="/qna/write", method = RequestMethod.POST)
	public String dowrite(Model model, QnaVO vo, int select, HttpSession session){
		vo.setCnum(select);
		vo.setWriter((String)session.getAttribute("id"));
		service.qestion(vo);
		return "redirect:/qna/list";
	}
	
	@RequestMapping(value="/qna/read", method = RequestMethod.GET)
	public void read(Model model, int num){
		model.addAttribute("qna", service.read(num, "read")); 
	}
	
	@RequestMapping(value="/qna/find", method = RequestMethod.GET)
	public void find(Model model){
		
	}
	
	@ResponseBody
	@RequestMapping(value="/qna/search", method = RequestMethod.POST)
	public ResponseEntity<List<ClassVO>> search(Model model, @RequestBody ClassSearch s){
		ResponseEntity<List<ClassVO>> entity=null;
		try{
			entity=new ResponseEntity<List<ClassVO>>(dao.list(s), HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<List<ClassVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/qna/answer", method = RequestMethod.GET)
	public void answer(Model model, QnaVO vo){
		model.addAttribute("qna", vo);
	}
	
	@RequestMapping(value="/qna/answer", method = RequestMethod.POST)
	public String doanswer(Model model, QnaVO vo, HttpSession session){
		System.out.println(service.read(vo.getNum(), "other").getPos());
		vo.setPos(service.read(vo.getNum(), "other").getPos());
		vo.setDepth(service.read(vo.getNum(), "other").getDepth()+1);
		vo.setWriter((String)session.getAttribute("id"));
		
		service.answer(vo);
		
		return "redirect:/qna/list";
	}
	
	

}

package com.raonis.board.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.raonis.board.domain.ReplyVO;
import com.raonis.board.service.ReplyService;

@RestController
public class ReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@Autowired
	private ReplyService service;
	
	@RequestMapping(value="/reply/write", method=RequestMethod.POST)
	public ResponseEntity<String> write(@RequestBody ReplyVO vo){

		ResponseEntity<String> entity=null;
		try{
			service.write(vo);
			entity=new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="reply/all/{num}")
	public ResponseEntity<List<ReplyVO>> list(@PathVariable("num") int num){
		
		ResponseEntity<List<ReplyVO>> entity=null;
		try{
			entity=new ResponseEntity<>(service.list(num), HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}

}

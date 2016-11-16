package com.raonis.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.raonis.board.domain.UserVO;
import com.raonis.board.repository.UserDaoImpl;
import com.raonis.board.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	
	@Autowired
	UserService service;

	@RequestMapping(value = "/notice/list", method = RequestMethod.GET)
	public void list(Model model) {
		
	}
	
	@RequestMapping(value = "/notice/write", method = RequestMethod.GET)
	public void write(Model model) {
		
	}
	
	@RequestMapping(value = "/notice/write", method = RequestMethod.POST)
	public void dowrite(Model model) {
		
	}
}

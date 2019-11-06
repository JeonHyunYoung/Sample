package com.raonis.board;

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
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@Autowired
	UserService service;
	
	@Autowired
	UserDaoImpl udi; 
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model, UserVO vo, HttpSession session, RedirectAttributes ra) {
		
		UserVO user = service.login(vo);

		if(user!=null){
			session.setAttribute("id", user.getId());
			session.setAttribute("pw", user.getPw());
			session.setAttribute("auth", user.getAuth());
		}
		else{
			ra.addFlashAttribute("msg", "로그인 실패");
		}
	
		return "redirect:/";
	}
	
	
	
}

package com.raonis.board.controller;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.raonis.board.domain.NoticeVO;
import com.raonis.board.service.NoticeService;
import com.raonis.board.util.DeleteFile;
import com.raonis.board.util.FileUpload;
import com.raonis.board.util.FilenameExtractor;
import com.raonis.board.util.Paging;
import com.raonis.board.util.Search;
import com.raonis.board.util.PreventXSS;

/**
 * Handles requests for the application home page.
 */
@Controller
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	NoticeService service;

	@RequestMapping(value = "/notice/list", method = RequestMethod.GET)
	public void list(Model model, Paging paging, Search search) {
		//페이징을 하기위한 값들을 설정해주는 부분
		int nowPage = paging.getNowPage();
		int nowBlock = paging.getNowBlock();
		paging = new Paging(service.count(search), nowBlock);
		paging.setNowPage(nowPage);
		paging.setNowBlock(nowBlock);
		paging.setSearch(search);
		model.addAttribute("list", service.list((paging.getNowPage()-1)*paging.getRecordPerPage(), paging.getNowPage()*paging.getRecordPerPage(), search));
		model.addAttribute("paging", paging);
	}
	
	@RequestMapping(value = "/notice/write", method = RequestMethod.GET)
	public void write(Model model) {
		
	}
	
	@RequestMapping(value = "/notice/write", method = RequestMethod.POST)
	public String dowrite(Model model, MultipartFile filename, String title, String content, HttpServletRequest req, HttpSession session) throws IOException {
		NoticeVO vo = new NoticeVO();
		//XSS를 방지하기위해 PreventXSS를 사용하여 값을 저장
		vo.setTitle(PreventXSS.filter(title));
		vo.setContent(PreventXSS.filter(content));
		vo.setWriter((String)session.getAttribute("id"));
		
		//파일이 들어왔을 때와 안들어 왔을 때를 구분해주는 조건절
		if(!filename.getOriginalFilename().equals("")){
			String savedName=FileUpload.uploadFile(filename.getOriginalFilename(), filename.getBytes(), req.getServletContext().getRealPath("resources/upload"));
			logger.info(savedName);
			vo.setFilename(savedName);//DB에는 날짜가 포함된 경로를 저장
		} else{
			vo.setFilename(filename.getOriginalFilename());
		}

		service.write(vo);
		
		return "redirect:/notice/list";
	}
	
	@RequestMapping(value = "/notice/read", method = RequestMethod.GET)
	public void read(Model model, int num){
		//read는 업데이트 등에서도 사용하므로 변수를 하나 더 줌으로써 용도를 지정
		//(읽기 수행시에는 조회수가 올라가야하고 나머지는 그렇지않으므로 구분)
		NoticeVO vo = service.read(num, "read");
		//DB경로에서 가져온 값은 경로와 UUID 고유값이 포함되어 있으므로 파일 이름만 가져오기 위한 부분
		if(vo.getFilename()!=null){
			vo.setFilename(FilenameExtractor.getName(vo.getFilename()));
		}
		model.addAttribute("notice", vo);
	}
	
	
	@RequestMapping(value = "/notice/delete", method = RequestMethod.POST)
	public String delete(Model model, int num, RedirectAttributes ra){
		service.delete(num);
		ra.addFlashAttribute("msg", "삭제 완료");
		return "redirect:/notice/list";
	}
	
	@RequestMapping(value = "/notice/update", method = RequestMethod.GET)
	public void update(Model model, int num){
		NoticeVO vo = service.read(num, "update");
		if(vo.getFilename()!=null){
			vo.setFilename(FilenameExtractor.getName(vo.getFilename()));
		}
		model.addAttribute("notice", vo);
		model.addAttribute("num", vo.getNum());
	}
	
	@RequestMapping(value = "/notice/update", method = RequestMethod.POST)
	public String doupdate(Model model, String title, String content, 
			MultipartFile filename, int num, HttpSession session, RedirectAttributes ra, HttpServletRequest req) throws IOException{
		NoticeVO vo = new NoticeVO();
		vo.setTitle(title);
		vo.setNum(num);
		vo.setContent(content);
		vo.setWriter((String)session.getAttribute("id"));
		
		//MultipartFile의 값은 널이 넘어오지 않으므로 이름이 있을 시와 없을 시로 구분
		if(!filename.getOriginalFilename().equals("")){
			String savedName=FileUpload.uploadFile(filename.getOriginalFilename(), filename.getBytes(), req.getServletContext().getRealPath("resources/upload"));
			logger.info(savedName);
			vo.setFilename(savedName);
		} else{
			vo.setFilename(filename.getOriginalFilename());
		}
		
		service.update(vo);		
		ra.addFlashAttribute("msg", "수정 완료");
		
		return "redirect:/notice/read?num="+num;
	}
	
	@ResponseBody
	@RequestMapping(value="/notice/filedel", method = RequestMethod.POST)
	public ResponseEntity<String> filedel(Model model, int num, HttpServletRequest req){
		ResponseEntity<String> entity=null;
		
		try{
			//삭제를 수행하기 위해 업로드된 경로에 DB에 저장되어 있는 파일 이름(날짜경로가 포함되어 있는 이름)을 붙여서 DeleteFile을 호출
			String filepath = req.getServletContext().getRealPath("resources/upload")+"/"+service.read(num, "other").getFilename();
			logger.info(filepath);
			DeleteFile.deleteFile(filepath);
			service.fileDel(num);
			entity=new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}

}

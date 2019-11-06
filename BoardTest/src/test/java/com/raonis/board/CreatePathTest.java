package com.raonis.board;

import java.io.File;
import java.util.Calendar;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.raonis.board.util.FileUpload;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class CreatePathTest {
	
	private static final Logger logger = LoggerFactory.getLogger(CreatePathTest.class);
	
	@Test
	public void test() throws Exception{
		Calendar cal = Calendar.getInstance();
		String path;
		File file;
		cal.get(Calendar.YEAR);
		path = cal.get(Calendar.YEAR)+"/"+(cal.get(Calendar.MONTH)+1)+"/"+cal.get(Calendar.DATE);
		
		
		file=new File("C://"+path);
		if(!file.exists()){
			file.mkdirs();
		}
		

		
	}
	
	
}

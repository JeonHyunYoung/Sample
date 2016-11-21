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
public class FIlenameExtract {
	
	private static final Logger logger = LoggerFactory.getLogger(FIlenameExtract.class);
	
	@Test
	public void test() throws Exception{
		String a = "2016/11/21/11231321a_b1123.jpg ";
		String b = a.substring(a.lastIndexOf("/")+1);
		System.out.println(b);
		System.out.println(a.substring(a.indexOf("_")+1));
		
	}
	
	
}

/*
 * Jeon Hyun Young
 * 년월일을 이용한 경로 생성과 파일 업로드
 */
package com.raonis.board.util;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

import com.raonis.board.repository.NoticeDaoImpl;

public class FileUpload {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeDaoImpl.class);
	
	public static String uploadFile(String originalName, byte[] fileData, String path) throws IOException {
				
		UUID uid = UUID.randomUUID();// 같은 이름의 파일이 올라가지 않도록 해준다. 고유한 값을 생성해준다
		
		Calendar cal = Calendar.getInstance();
		//날짜를 이용하여 경로를 생성(10미만의 달과 일을 두자리로 맞추는 포멧사용)
		String datepath = cal.get(Calendar.YEAR)
				+"/"+new DecimalFormat("00").format((cal.get(Calendar.MONTH)+1))
				+"/"+new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		//서버의 resources/upload 폴더까지의 경로에 datepath를 더하여 최종경로를 설정 
		String totalpath = path+"/"+datepath;		
		//DB에 저정될 이름(날짜경로와 UUID를 사용하서 생성한 고유한 이름 값을 더해서 저장한다.)
		String savedName = datepath+"/"+uid.toString() + "_" + originalName;
		
		//생성할 경로가 있는지 검사하고 없을 시에 경로 생성
		if(!new File(totalpath).exists()){
			new File(totalpath).mkdirs();
		}
		logger.info(uid.toString() + "_" + originalName);
		logger.info(totalpath);
		
		//최종적으로 넣을 경로를 설정하고 저장(savedName에 datepath가 포함되어 있으므로 substring으로 잘라서 사용)
		File target = new File(totalpath, savedName.substring(savedName.lastIndexOf("/")+1));

		FileCopyUtils.copy(fileData, target);// 파일을 저장
		return savedName;
	}
}

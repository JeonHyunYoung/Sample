/*
 * Jeon Hyun Young
 * ������� �̿��� ��� ������ ���� ���ε�
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
				
		UUID uid = UUID.randomUUID();// ���� �̸��� ������ �ö��� �ʵ��� ���ش�. ������ ���� �������ش�
		
		Calendar cal = Calendar.getInstance();
		//��¥�� �̿��Ͽ� ��θ� ����(10�̸��� �ް� ���� ���ڸ��� ���ߴ� ������)
		String datepath = cal.get(Calendar.YEAR)
				+"/"+new DecimalFormat("00").format((cal.get(Calendar.MONTH)+1))
				+"/"+new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		//������ resources/upload ���������� ��ο� datepath�� ���Ͽ� ������θ� ���� 
		String totalpath = path+"/"+datepath;		
		//DB�� ������ �̸�(��¥��ο� UUID�� ����ϼ� ������ ������ �̸� ���� ���ؼ� �����Ѵ�.)
		String savedName = datepath+"/"+uid.toString() + "_" + originalName;
		
		//������ ��ΰ� �ִ��� �˻��ϰ� ���� �ÿ� ��� ����
		if(!new File(totalpath).exists()){
			new File(totalpath).mkdirs();
		}
		logger.info(uid.toString() + "_" + originalName);
		logger.info(totalpath);
		
		//���������� ���� ��θ� �����ϰ� ����(savedName�� datepath�� ���ԵǾ� �����Ƿ� substring���� �߶� ���)
		File target = new File(totalpath, savedName.substring(savedName.lastIndexOf("/")+1));

		FileCopyUtils.copy(fileData, target);// ������ ����
		return savedName;
	}
}

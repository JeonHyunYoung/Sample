
/*
 * 삭제가 수행 될 시에 삭제를 수행하는 클래스
 */
package com.raonis.board.util;

import java.io.File;

public class DeleteFile {
	
	public static void deleteFile(String filepath){
		File file = new File(filepath);
		
		if(file.exists()){
			file.delete();
		}
	}

}

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

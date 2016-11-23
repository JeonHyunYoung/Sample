/*
 * 경로가 포함된 이름을 자르는 작업을 수행하는 클래스 
 */

package com.raonis.board.util;

public class FilenameExtractor {
	public static String getName(String name){
		String temp = name.substring(name.lastIndexOf("/")+1);
		String extractedName = temp.substring(temp.indexOf("_")+1);

		return extractedName;
	}
}

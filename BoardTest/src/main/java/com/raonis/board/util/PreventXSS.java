/*
 * XSS를 막기 위해 게시글 입력시 HTML태그를 사용하지 못하게 하는 클래스 
 */

package com.raonis.board.util;

public class PreventXSS {
	
	//<, >를 다른 값으로 치환하여 XSS를 막음
	public static String filter(String result){
		
		result = result.replaceAll("<", "&lt;");
		result = result.replaceAll(">", "&gt;");
		
		return result;
	}
}

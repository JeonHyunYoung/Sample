package com.raonis.board.util;

public class PreventXSS {
	
	//<, >�� �ٸ� ������ ġȯ�Ͽ� XSS�� ����
	public static String filter(String result){
		
		result = result.replaceAll("<", "&lt;");
		result = result.replaceAll(">", "&gt;");
		
		return result;
	}
}

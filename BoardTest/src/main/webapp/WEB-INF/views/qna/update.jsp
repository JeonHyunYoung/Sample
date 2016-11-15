
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
<br/><br/>

<div class="container">
	<div class="row">
	<div class="col-md-2"></div>
		<div class="col-md-8" align="center">
			<form>
				<table class="table">
					<tr>
						<td>강의명</td>
					</tr>
					<tr>
						<td>
							<select>
								<option>-------------------------</option>
								<option>쉽게 배우는 영어 문법(과정번호:100)</option>
								<option>자바를 마스터하자(과정번호:101)</option>
								<option>HTML5&CSS3(과정번호:102)</option>
							</select>
							<button>찾기</button>
						</td>
					</tr>
					<tr>
						<td>제목</td>
					</tr>
					<tr>
						<td><input type="text" style="width:100%" value="입력된 게시글의 제목의 들어옵니다."></td>
					</tr>
					<tr>
						<td>내용</td>
					</tr>
					<tr>
						<td><textarea rows="5" style="width:100%">입력된 게시글의 내용이 들어옵니다.</textarea></td>
					</tr>
					
				</table>
				<button>완료</button>&nbsp;<button>취소</button>
			</form>	
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>


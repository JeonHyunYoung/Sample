
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>

<script>

</script>

</head>
<body>
<br/><br/>

<div class="container">
	<div class="row">
	<div class="col-md-2"></div>
		<div class="col-md-8" align="center">
			<form action="/notice/update" method="post" name="form" id="form" enctype="multipart/form-data">
				<input type="hidden" name="num" id="num" value="${notice.num }">
				
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
						<td><input type="text" style="width:100%" value="${notice.title }" name="title" id="title"></td>
					</tr>
					<tr>
						<td>내용</td>
					</tr>
					<tr>
						<td><textarea rows="5" style="width:100%" name="content" id="content">${notice.content }</textarea></td>
					</tr>
					<tr>
						<td>첨부파일</td>
					</tr>
					<tr>
						<td>
							<a href="#">${notice.filename }</a>
							<input type="file" id="filename" name="filename" style="opacity: 0">
						</td>
					</tr>
				</table>
				<button class="btn btn-default">완료</button>&nbsp;&nbsp;<button class="btn btn-default">취소</button>
			</form>
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>


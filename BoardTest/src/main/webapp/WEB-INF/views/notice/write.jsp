
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
	$(document).ready(function(){
		$("#submit").click(function(){
			$("#form").submit();
		})
	})
</script>
</head>
<body>
<br/><br/>

<div class="container">
	<div class="row">
	<div class="col-md-2"></div>
		<div class="col-md-8" align="center">
			<form enctype="multipart/form-data" method="post" action="/notice/write" name="form" id="form">
				<table class="table">
					<tr>
						<td>제목</td>
					</tr>
					<tr>
						<td><input type="text" style="width:100%" id="title" name="title"></td>
					</tr>
					<tr>
						<td>내용</td>
					</tr>
					<tr>
						<td><textarea rows="5" style="width:100%" id="content" name="content"></textarea></td>
					</tr>
					<tr>
						<td>첨부파일</td>
					</tr>
					<tr>
						<td>
							<input type="file" id="filename" name="filename">
							
							<!--  <input type="button" value="파일찾기" id="search"> --> 
						</td>
					</tr>
				</table>
				<button id="submit">전송</button>&nbsp;<button id="reset">취소</button>
			</form>	
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>


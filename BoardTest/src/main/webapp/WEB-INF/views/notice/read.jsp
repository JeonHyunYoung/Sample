
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
		<div class="col-md-8"align="center">

				<table class="table">
					<tr>
						<td>제목</td>
					</tr>
					<tr>
						<td><input type="text" style="width:100%" value="입력된 게시글의 제목의 들어옵니다." readonly="readonly"></td>
					</tr>
					<tr>
						<td>내용</td>
					</tr>
					<tr>
						<td><textarea rows="5" style="width:100%" readonly="readonly">입력된 게시글의 내용이 들어옵니다.</textarea></td>
					</tr>
					<tr>
						<td>첨부파일</td>
					</tr>
					<tr>
						<td><a href="#">abcd.jpg</a></td>
					</tr>
				</table>
				
				<a href="#" class="btn">목록</a>
				&nbsp;&nbsp;<button class="btn">수정</button>
				&nbsp;&nbsp;<button class="btn">삭제</button>

				<br/><br/>
				<div>
					<p>댓글 입력</p><br/>
					<textarea rows="1" style="width:100%" ></textarea>
					<button>댓글등록</button>
				</div>
				<br/><br/>
				<div id="replies">
					<div style='border: 1px solid black'>
						<p>jeon</p><br/>
						<textarea style='width:100%' readonly='readonly'>가나다라마바사</textarea>
					</div>
					<div style='border: 1px solid black'>
						<p>kang</p><br/>
						<textarea style='width:100%' readonly='readonly'>ABCDE12345</textarea>
					</div>
				</div>
				<div>
					<button class="btn btn-default btn-lg">더보기(2개씩)</button>
				</div>
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>


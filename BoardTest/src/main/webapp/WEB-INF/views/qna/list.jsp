
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
			<div class="pull-left">
				<form>
					<select id="keyword" name="keyword">
						<option>제목</option>
						<option>내용</option>
						<option>작성자</option>
						<option>제목+내용</option>
					</select>
					
					<input type="text"/>
					<input type="submit" value="검색"/>
				</form>
			</div>
			<br/><br/>
			<table class="table">
				<tr>
					<td>글번호</td><td>제목</td><td>작성자</td><td>등록일</td><td>조회수</td>
				</tr>
				<tr>
					<td>1</td>
					<td><a href="#">1234567</a></td>
					<td>jeon</td>
					<td>2016-11-11</td>
					<td>5</td>
				</tr>
				<tr>
					<td>2</td>
					<td>&nbsp;&nbsp;&nbsp;<a href="#">1234567에 대한 답변입니다</a></td>
					<td>kang</td>
					<td>09:00</td>
					<td>0</td>
				</tr>
				<tr>
					<td>3</td>
					<td><a href="#">ABCDEFG</a>&nbsp;[5]</td>
					<td>kang</td>
					<td>2016-11-10</td>
					<td>0</td>
				</tr>
				<tr>
					<td>4</td>
					<td><a href="#">가나다라마바사</a>&nbsp;[2]</td>
					<td>yoon</td>
					<td>2016-11-05</td>
					<td>1</td>
				</tr>
			</table>
			<div>
				<ul class="pagination">
					<li><a href="#">이전</a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">다음</a></li>
				</ul>
			</div>
			<a href="#" class="btn">글쓰기</a>
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>



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
					<th style="width: 10%">글번호</th><th style="width: 50%">제목</th><th style="width: 15%">작성자</th><th style="width: 15%">등록일</th><th style="width: 10%">조회수</th>
				</tr>
				<c:forEach var="notice" items="${list }">
					<tr>
						<td>${notice.num }</td>
						<td><a href="#">${notice.title }</a></td>
						<td>${notice.writer }</td>
						<td>${notice.regdate }</td>
						<td>${notice.viewcnt }</td>
					</tr>
				</c:forEach>
				<tr>
					<td>1</td>
					<td><a href="#">ABCDEFG</a></td>
					<td>kang</td>
					<td>2016-11-10</td>
					<td>0</td>
				</tr>
				<tr>
					<td>2</td>
					<td><a href="#">ABCDEFG</a></td>
					<td>kang</td>
					<td>2016-11-10</td>
					<td>0</td>
				</tr>
				<tr>
					<td>3</td>
					<td><a href="#">가나다라마바사</a></td>
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
			<a href="/notice/write" class="btn">글쓰기</a>
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>


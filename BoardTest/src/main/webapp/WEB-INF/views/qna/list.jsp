
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
			<table class="table">
				<tr>
					<th style="width: 10%">글번호</th><th style="width: 50%">제목</th><th style="width: 15%">작성자</th><th style="width: 15%">등록일</th><th style="width: 10%">조회수</th>
				</tr>
				<c:forEach items="${list }" var="qna">
					<tr>
						<td>${qna.num }</td>
						<td><a href="/qna/read?num=${qna.num }">${qna.title }</a></td>
						<td>${qna.writer }</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${qna.regdate }"/></td>
						<td>${qna.viewcnt }</td>
					</tr>
				</c:forEach>
			</table>

			<a href="/qna/write" class="btn btn-default" role="button">글쓰기</a>
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>


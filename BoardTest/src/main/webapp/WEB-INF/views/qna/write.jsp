
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
		
		$("#find").click(function(){
		    window.open("/qna/find", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top=500,left=500,width=400,height=400");
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
			<form method="post" action="/qna/write" name="form" id="form">
				<table class="table">
					<tr>
						<td>강의명</td>
					</tr>
					<tr>
						<td>
							<select id="select" name="select">
								<option>-------------------------</option>
								<c:forEach items="${c }" var="cl">
									<option value="${cl.cnum }">${cl.ctitle }(과정번호:${cl.cnum })</option>
								</c:forEach>

							</select>
							<input type="button" id="find" name="find" value="찾기">
						</td>
					</tr>
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


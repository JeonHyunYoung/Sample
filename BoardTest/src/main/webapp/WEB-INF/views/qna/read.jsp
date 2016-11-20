
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
		$("#answerBtn").click(function(){
			var $form = $("<form></form>");
			
			$form.attr("action", "/qna/answer");
			$form.attr("method", "get");
		    $form.appendTo('body');
			
		    var num = $('<input name="num" type="hidden" value="'+${qna.num }+'">');
		    var ctitle = $('<input name="ctitle" type="hidden" value="'+'${qna.ctitle }'+'">');
		    var cnum = $('<input name="cnum" type="hidden" value="'+${qna.cnum }+'">');
		    var title = $('<input name="title" type="hidden" value="'+'${qna.title }'+'">');
			
			$form.append(num);
			$form.append(cnum);
			$form.append(ctitle);
			$form.append(title);

			$form.submit();
		})
	})
</script>
</head>
<body>
<br/><br/>

<div class="container">
	<div class="row">
	<div class="col-md-2"></div>
		<div class="col-md-8"align="center">
				<table class="table">
					<tr>
						<td>${qna.ctitle }(과정번호 : ${qna.cnum })</td>
					</tr>
					<tr>
						<td>제목</td>
					</tr>
					<tr>
						<td><input type="text" style="width:100%" value="${qna.title }" readonly="readonly"></td>
					</tr>
					<tr>
						<td>내용</td>
					</tr>
					<tr>
						<td><textarea rows="5" style="width:100%" readonly="readonly">${qna.content }</textarea></td>
					</tr>
				</table>
				
				<a href="/qna/list" role="button" class="btn btn-default">목록</a>
				&nbsp;&nbsp;<button class="btn btn-default">수정</button>
				&nbsp;&nbsp;<button class="btn btn-default">삭제</button>
				&nbsp;&nbsp;<button class="btn btn-default" id="answerBtn">답글쓰기</button>

		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>


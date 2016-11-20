
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
		$('#del').click(function(){

			var $form = $('<form></form>');
			$form.attr("action", "/notice/delete");
			$form.attr("method", "GET");
		    $form.appendTo('body');
		     
		    var num = $('<input name="num" type="hidden" value="'+${notice.num}+'">');
			
			$form.append(num)
			if(confirm("정말로 삭제하시겠습니까?")){
				$form.submit();
			}
		})
	})
</script>
</head>
<body>
<br/><br/>
<c:if test="${msg!=null }">
	<script>
		alert('${msg}');
	</script>
</c:if>

<div class="container">
	<div class="row">
	<div class="col-md-2"></div>
		<div class="col-md-8"align="center">
				<table class="table">
					<tr>
						<td>작성자</td>
					</tr>
					<tr>
						<td><input type="text" style="width:100%" value="${notice.writer }" readonly="readonly"></td>
					</tr>
					<tr>
						<td>제목</td>
					</tr>
					<tr>
						<td><input type="text" style="width:100%" value="${notice.title }" readonly="readonly"></td>
					</tr>
					<tr>
						<td>내용</td>
					</tr>
					<tr>
						<td><textarea rows="5" style="width:100%" readonly="readonly">${notice.content }</textarea></td>
					</tr>
					<tr>
						<td>첨부파일</td>
					</tr>
					<tr>
						<td><a href="#">${notice.filename }</a></td>
					</tr>
				</table>
				<a href="/notice/list" class="btn btn-default" role="button">목록</a>
				&nbsp;&nbsp;<a href="/notice/update?num=${notice.num }" class="btn btn-default" role="button">수정</a>
				&nbsp;&nbsp;<button class="btn btn-default" id="del">삭제</button>
			
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>



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
	function delFunc(){
		var param='num='+${notice.num };
		$.ajax({
			type:'POST',
			url:'/notice/filedel',
			data:param,			
			success:function(result){
				if(result=='SUCCESS'){
					//alert("파일이 삭제되었습니다");
				}
			}
		});
	}
	$(document).ready(function(){
		$("#x").click(function(){
			$("#filename").val("");
			$("#file").text("");
			$("#x").attr("class", "");
			
			delFunc();
		})
		
		$("#search").click(function(){
			$("#filename").click();
		})
		$("#filename").change(function(){
			delFunc();
			var fullname = $("#filename").val();
			var cutname = fullname.substring(fullname.lastIndexOf("\\")+1, fullname.length);
			$("#file").text(cutname);
			$("#x").attr("class", "glyphicon glyphicon-remove");
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
			<form action="/notice/update" method="post" name="form" id="form" enctype="multipart/form-data">
				<input type="hidden" name="num" id="num" value="${notice.num }">
				
				<table class="table">
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
							<a href="#" id="file">${notice.filename }</a><span id="x" class="<c:if test="${notice.filename!=null }">glyphicon glyphicon-remove</c:if>" aria-hidden="true"></span>
							&nbsp;<input type="button" id="search" value="찾기">
							<input type="file" id="filename" name="filename" style="display: none">
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


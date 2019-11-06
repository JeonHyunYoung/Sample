
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

	/*업로드된 삭제되는 조건 2가지
		
		1. x표시를 눌렀을 때
		2. <input type="file">의 값이 변화가 생겼을 때
		
	*/
	//삭제를 실행하는 에이젝스 처리
	function delFunc(){
		//에이젝스 방식에서 form을 사용하지 않고 parameter를 넘기는 방법
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
		//삭제의 첫번째 조건 x표시를 눌렀을 때의 동작
		$("#x").click(function(){
			$("#filename").val("");
			$("#file").text("");
			$("#x").attr("class", "");
			
			delFunc();
		})
		//input type="file" 태그를 display를 none으로 주어서 직접 클릭이 불가능하므로 찾기버튼 클릭시에 해당 
		//input type="file" 태그를 클릭한 효과를 준다. 
		$("#search").click(function(){
			$("#filename").click();
		})
		
		//삭제의 두번째 조건 input type="file"의 값이 변화가 생겼을 때
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


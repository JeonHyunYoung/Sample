
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script>
function fncProductFile(){ 
   //document.fileForm.filename.click(); 
   document.fileForm.txtProductFileName.value = document.fileForm.filename.value;
</script>
<style type="text/css">
.file_input_textbox {height:25px;width:200px;float:left; } 
.file_input_div     {position: relative;width:80px;height:26px;overflow: hidden; } 
.file_input_button  {width: 80px;position:absolute;top:0px; 
border:1px solid #F0F0EE;padding:2px 8px 2px 8px; font-weight:bold; height:25px; margin:0px; margin-right:5px; } 
.file_input_button_hover{width:80px;position:absolute;top:0px; 
   border:1px solid #0A246A; background-color:#B2BBD0;padding:2px 8px 2px 8px; height:25px; margin:0px; font-weight:bold; margin- 
right:5px; } 
.file_input_hidden  {font-size:45px;position:absolute;right:0px;top:0px;cursor:pointer;opacity:0;filter:alpha(opacity=0);-ms-filter:"alpha 
(opacity=0)";-khtml-opacity:0;-moz-opacity:0;} 
</style>
</head>
<body>
<br/><br/>

<div class="container">
	<div class="row">
	<div class="col-md-2"></div>
		<div class="col-md-8" align="center">
			<form name="fileForm">
				<table class="table">
					<tr>
						<td>제목</td>
					</tr>
					<tr>
						<td><input type="text" style="width:100%" value="게시글의 제목이 들어옵니다."></td>
					</tr>
					<tr>
						<td>내용</td>
					</tr>
					<tr>
						<td><textarea rows="5" style="width:100%">게시글의 내용이 들어옵니다.</textarea></td>
					</tr>
					<tr>
						<td>첨부파일</td>
					</tr>
					<tr>
						<td>
							<input type="button" value="파일찾기"> 
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


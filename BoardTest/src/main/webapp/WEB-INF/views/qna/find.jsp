
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

<div class="row">
	<div class="col-md-2"></div>
		<div class="col-md-8" align="center">
		<select>
			<option>과정명</option>
			<option>과정번호</option>	
		</select>
		<input type="text">
		<button>검색</button>
		
		<table class="table">
			<tr>
				<th>과정번호</th><th>과정명</th>
			</tr>
			<tr>
				<td>101</td><td><a>자바를 마스터하자</a></td>
			</tr>
		</table>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>


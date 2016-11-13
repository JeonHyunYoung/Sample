
<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title></title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
<br><br><br><br><br><br>
<div class="container">
  <div class="row">
  	<div class="col-md-4"></div>
  	<div class="col-md-4">
  		<form>
              <input type="radio" id="radio1" name="option" checked="checked"><label for="radio1">일반회원</label>
              <input type="radio" id="radio2" name="option"><label for="radio2">관리자</label>

			  <div class="form-group">
			    <label for="id">아이디</label>
			    <input type="text" class="form-control" id="id" placeholder="아이디을 입력하세요">
			  </div>
			  <div class="form-group">
			    <label for="password">암호</label>
			    <input type="password" class="form-control" id="password" placeholder="비밀번호를 입력하세요">
			  </div>
			  <button type="submit" class="btn btn-default">LOGIN</button>
		</form>
		 <!--
		 <p><b>OOO</b>님 환영합니다.</p><br><br>
		 <a href="#">공지사항</a>&nbsp;&nbsp;&nbsp;<a href="#">Q & A</a>
		 -->
  	</div>
  </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>
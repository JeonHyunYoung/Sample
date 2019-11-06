
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script>
	//검색 값을 사용해 입력된 강의를 불러오고 테이블에 출력
	function getList(){
		
		var option=$('#option').val();
		var value=$('#value').val();
		
		$.ajax({
			type:'POST',
			url:'/qna/search',
			headers:{"Content-Type":"application/json","X-HTTP-Method-Override":"POST"},
			dataType:'text',
			data:JSON.stringify({option:option, value:value}),
			success:function(result){
				
				var json = $.parseJSON(result);
				var str='';
				for (var i in json) {
					str+='<tr>'
						+'<td>'+json[i].cnum+'</td>'
						+'<td>'+json[i].ctitle+'</td>'
						+'<td><input type="button" class="btn btn-default" id="btn" value="선택" data-num="'+json[i].cnum+'">'
						+'</tr>'
				}
				$('#tbody').html(str);
	
			}
		});
	}
	
	$(document).ready(function(){
		//테이블에서 해당 레코드에 달린 버튼을 클릭시에 이 페이지를 오픈한 페이지로 값을 전달 후 이 페이지를 닫음
		$("#tbody").on("click", "#btn", function(){
			opener.$("#select").val($(this).attr("data-num"));
			self.close();
		})
			
		//검색했을 시 검색 조건에 맞는 레코드 출력
		$("#search").click(function(){
			getList();
		})
	})
	//페이지가 켜졌을 때 모든 레코드가 출력되도록 함
	window.onload(getList());
</script>

</head>
<body>

<div class="row">
	<div class="col-md-2"></div>
		<div class="col-md-8" align="center">
		<!-- form action="/qna/search" method="post"> -->
			<select id="option" name="option">
				<option value="cnum" >과정번호</option>	
				<option value="class" >과정명</option>
			</select>
			<input type="text" id="value" name="value">
			<button id="search">검색</button>
		<!-- </form> -->
		<table class="table">
			<tr>
				<th width="30%">과정번호</th><th width="60%">과정명</th><th width="10%"></th>
			</tr>
			
			<tbody id="tbody">

			</tbody>				
	
		</table>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>



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
getAllList();

var max=3;//댓글이 출력될 수 있는 최대 갯수
var totalreply;//해당 글에 입력되어 있는 댓글의 갯수
function getAllList(){
	var str="";
	var num='${qna.num }';
	$.getJSON("/reply/all/"+num, function(data){
		
		totalreply=data.length;
		
		//max의 갯수 이상의 댓글을 볼 수 있도록 하는 버튼의 생성 유무를 판단하는 조건문
		if(totalreply<=max){$('#more').hide();}
		else if(totalreply>max){$('#more').show();}
		
		//댓글을 출력해주는 부분
		$(data).each(function(i){
			if(i<max){
				str+="<div style='border: 1px solid black'>"
					+"<p>작성자 : "+this.replyer+"</p><br/>"
					+"<textarea style='width:100%' readonly='readonly'>"+this.replytext+"</textarea>"
					+"</div>";
			}
		});

		$('#replies').html(str);
	})
}


	$(document).ready(function(){
		//더보기 버튼 클릭 시에 2개씩 더 보이도록 하는 부분
		$('#more').click(function(){
			max+=2;
			if(max>=totalreply){
				$('#more').hide();
			}
			getAllList();
		});
		
		//json방식으로 댓글 등록에 필요한 값을 전달
		$('#insertReply').click(function(){
			var replyer = '${id}';
			var replytext = $('#replytext').val();
			var num = '${qna.num }';
			
			$.ajax({
				type:'post',
				url:'/reply/write',
				headers:{"Content-Type":"application/json","X-HTTP-Method-Override":"POST"},
				dataType:'text',
				data:JSON.stringify({num:num, replyer:replyer, replytext:replytext}),
				success:function(result){
					if(result=='SUCCESS'){
						alert("등록되었습니다.");
						getAllList();
						$('#replytext').val('');
					}
				}
			});
		});
		
		//답변페이지로 가기 위한 함수
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
				
				<br/><br/>
				<div id="addReplyDiv">
					<p>댓글 입력</p><br/>
					<textarea id="replytext" name="replytext" rows="1" style="width:100%" ></textarea>
					<button id="insertReply">댓글등록</button>
				</div>
				<br/><br/>
				<div id="replies">
					
				</div>
				<div id="replymore">
					<button id="more">더보기(2개씩)</button>
				</div>
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/custom.css">
	<title>update</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type = "text/javascript" src="./js/bootstrap.js"></script>
	<script type = "text/javascript">
	function passwordCheckFunction() {
		var userPassword1 = $('#userPassword1').val();
		var userPassword2 = $('#userPassword2').val();
		if(userPassword1 != userPassword2){
			$('#passwordCheckMessage').html('비밀번호가 서로 일치하지 않습니다.');
		}
		else{
			$('#passwordCheckMessage').html('');
		}
	}
</script>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>	
			</button>
			<a class="navbar-brand" href="home">KNU공동구매</a>
		</div>
		<div class = "collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="home">메인</a></li>
				<li><a href="post/list">게시판</a></li>
				<li><a href="post/mylist">참여 내역</a>
				<li><a href="chatpage">메시지함</a></li>
				<li><a href="receivedReview?studentNum=${loginNum}">리뷰</a><li>
			</ul>
			<c:choose>
				<c:when test="${isLogin}">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">마이페이지<span class="caret"></span>
							</a>		
							<ul class="dropdown-menu">
								<li><a href="./mypage">프로필</a>
	            				<li class="active"><a href="./update">회원정보수정</a></li>
	            				<li><a href="./login?c=out">로그아웃</a></li>
	            				
	            			</ul>
	            		</li>
	            	</ul>			
            	</c:when>
            	<c:when test="${!islogin}">
		            <ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">접속하기<span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
	            				<li><a href="./login">로그인</a></li>
		            			<li><a href="./signup">회원가입</a></li>
	            			</ul>		
	            		</li>
	            	</ul>			
            	</c:when>
	    	</c:choose>
		</div>
	</nav>
	<div class="container">
		<form method="post" action="./userUpdate">
			<table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2"><h4>회원정보수정</h4></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 120px;"><h5>학번</h5></td>
						<td>
							<h5>${student.getStudentNum()}</h5>
							<input type="hidden" name="userNum" value="${student.getStudentNum()}">
						</td>
					</tr>
					<tr>
						<td style="width: 120px;"><h5>이름</h5></td>
						<td colspan="2"><input class="form-control" type="text" id="userName" name="userName" maxlength="20" placeholder="이름을 입력해주세요." value="${student.getName()}"></td>
					</tr>
					<tr>
						<td style="width: 120px;"><h5>아이디</h5></td>
						<td>
							<h5>${student.getId()}</h5>
							<input type="hidden" name="userID" value="${student.getId()}">
						</td>
					</tr>
					<tr>
						<td style="width: 120px;"><h5>비밀번호</h5></td>
						<td colspan="2"><input class="form-control" type="password" onkeyup="passwordCheckFunction();" id="userPassword1" name="userPassword1" maxlength="20" placeholder="비밀번호를 입력해주세요.(20자 제한)"></td>
					</tr>
					<tr>
						<td style="width: 120px;"><h5>비밀번호 확인</h5></td>
						<td colspan="2"><input class="form-control" type="password" onkeyup="passwordCheckFunction();" id="userPassword2" name="userPassword2" maxlength="20" placeholder="비밀번호 확인을 입력해주세요.(20자 제한)"></td>						
					</tr>		
					<tr>
						<td style="text-align: right" colspan="3"><h5 style="color: red;", id="passwordCheckMessage"></h5><input class ="btn btn-primary pull-right" type="submit" value="수정"></td>
					</tr>					
				</tbody>	
			</table>
		</form>
	</div>
	
	
	<% 
		String messageContent = null;
		if(session.getAttribute("messageContent") != null)
		{
			messageContent = (String) session.getAttribute("messageContent");
		}
		String messageType = null;
		if(session.getAttribute("messageType") != null)
		{
			messageType = (String) session.getAttribute("messageType");
		}
		if(messageContent != null) {
	%>
	<div class = "modal fade" id="messageModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content <% if(messageType.equals("오류 메시지")) out.println("panel-warning"); else out.println("panel-success");%>">
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">
							<%= messageType %>
						</h4>
					</div>
					<div class="modal-body">
						<%= messageContent %>
					</div>
					<div class="modal-footer">
						<button type="button" class = "btn btn-primary" data-dismiss="modal">확인</button>
					</div> 	
				</div>
			</div>	
		</div>
	</div>
	<script>
	  	$(document).ready(function() {
	  		$('#messageModal').modal("show");
		  });
	</script>
	<%
		session.removeAttribute("messageContent");
		session.removeAttribute("messageType");
		}
	%>
</body>
</html>
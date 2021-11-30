<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="../css/bootstrap.css">
	<link rel="stylesheet" href="../css/custom.css">
	<title>home</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type = "text/javascript" src="../js/bootstrap.js"></script>
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
			<a class="navbar-brand" href="../home">KNU공동구매</a>
		</div>
		<div class = "collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="../home">메인</a></li>
				<li class="active"><a href="../post/list">게시판</a></li>
				<li><a href="../chatpage">메시지함</a></li>
				<li><a href="../receivedReview?studentNum=${loginNum}">리뷰</a><li>
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
								<li><a href="../mypage">프로필</a>
	            				<li><a href="../update">회원정보수정</a></li>
	            				<li><a href="../login?c=out">로그아웃</a></li>
	            				
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
	            				<li><a href="../login">로그인</a></li>
		            			<li><a href="../signup">회원가입</a></li>
	            			</ul>		
	            		</li>
	            	</ul>			
            	</c:when>
	    	</c:choose>
		</div>
	</nav>
<!-- --------------------------- <body> --------------------------------------- -->
<div id="body">
    <div class="content-container clearfix">

        <main>
            <h2 class="main title">게시글 등록</h2>

            <form method="post" action="reg">
                <div class="margin-top first">
                    <h3 class="hidden">게시글 입력</h3>
                    <table class="table">
                        <tbody>
                        <tr>
                            <th>제목</th>
                            <td class="text-align-left text-indent text-strong text-orange" colspan="3">
                                <input type="text" name="title" />
                            </td>
                        </tr>
                        <tr class="content">
                            <td colspan="4"><input type="text" name="productInfo"></input></td>
                        </tr>
                        <tr>
                            <label>set limit of participants: </label>
                            <select name="limitOfParticipants">
                                <option value="2">2ppl</option>
                                <option value="3">3ppl</option>
                                <option value="4">4ppl</option>
                            </select>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="margin-top text-align-center">
                    <input class="" type="submit" value="등록" />
                    <a class="" href="list">취소</a>
                </div>
            </form>

        </main>
    </div>
</div>

<!-- ------------------- <footer> --------------------------------------- -->
</body>

</html>
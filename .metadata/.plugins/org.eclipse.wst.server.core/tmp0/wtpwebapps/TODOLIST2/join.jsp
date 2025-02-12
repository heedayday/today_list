<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-with, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>TODAY LIST 일정관리</title>
<style>
body {
  background-image: url("login6.jpg");
}
#nomal{
        padding: 0px 0px 0px 0px;
        font-weight: bold;
        text-align: center;
        background-color: #ffffff;
        opacity: 0.5;
      }
</style>
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
			<a class ="navbar-brand">TODAY LIST</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspoppup="ture"
						aria-expanded="false">돌아가기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>			
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumpbotron" style="padding-top:20px;">
				 <form method="post" action="joinAction.jsp">
				 <div id="nomal">
				 	<h3 style="text-align: center; color:navy; font-family: 'Noto Sans KR', sans-serif; ">회원가입</h3>
				 	<h5 style="text-align: center; color:navy; font-family: 'Noto Sans KR', sans-serif; ">반갑습니다. 아래의 내용을 모두 적어주세요.</h5>
				 	</div>
				 	<div class="form-group">
				 		<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
				 	</div>
				 	<div class="form-group">
				 		<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
				 	</div>
				 	<div class="form-group">
				 		<input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">
				 	</div>
				 	<div class="form-group" style="text-align:center;">
				 		<div class="btn-group" data-toggle="buttons">
				 			<label class="btn btn-primary active">
				 				<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자				 			
				 			</label>
				 			<label class="btn btn-primary">
				 				<input type="radio" name="userGender" autocomplete="off" value="여자" checked>여자				 			
				 			</label>
				 		</div>
				 	</div>		
				 	<div class="form-group">
				 		<input type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="20">
				 	</div>
				 			 	
				 	<input type="submit" class="btn-primary form-control" value="회원가입">
				 </form>
			</div>		
		</div>
	</div>
 	<script src= "https://code.jquery.com/jquery-3.5.1.min.js"></script>
 	<script src="js/bootstrap.js"></script>
</body>
</html>
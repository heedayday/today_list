<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="userdata.UserData" %>
<%@ page import="userdata.UserDataDAO" %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-with" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<title>TODAY LIST 일정관리</title>
<style>
.container {
  width: 50%;
}
body {
  		background-image: url("ect.jpg");
	}
	nav>div>ul>li>a:hover{
	font-weight:900;}
</style>
</head>
<body>
	<%
		 String userID =null;
		if (session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		int bbsID = 0;
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));	
		}
		if(bbsID == 0){
			session.setAttribute("userID", user.getUserID());
			String name = user.getUserID()+"'";
			PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href ='Register_main_AT.jsp"+"?userID="+name);
			script.println("</script>");
		}
		UserData bbs =new UserDataDAO().getBbs(bbsID);
	%>
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
				<ul class="nav navbar-nav">
				<li class="active"><a href="Register_main_M2.jsp?userID=<%=userID %>">오늘의 일정</a></li>
				<li ><a href="Register_main_Month.jsp?userID=<%=userID %>">날짜별 일정</a></li>							
				<li ><a href="bbs.jsp?userID=<%=userID %>">전체 일정</a></li>								
				<li><a href="Title_search.jsp?userID=<%=userID %>">일정 출력</a></li>							
				</ul>
			<%
				if(userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspoppup="ture"
						aria-expanded="false">시작하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>			
			</ul>
			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspoppup="ture"
						aria-expanded="false"><%=userID %>님 나가기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>			
			</ul>
			
			<% 
				}
			%>
			
		</div>
	</nav>	
	<div class="container">
		<div class="row">
		<table class="table" style="text-align: center; border-radius: 5px; box-shadow: rgba(0,0,0,0.8) 0 0 10px;">
			<thead>
				<tr>
					<th colspan="2" style="background-color: #42579D; text-align:center; color: white; border-top-left-radius: 5px; border-top-right-radius: 5px;"><h4>일정 확인하기</h4></th>
				</tr>			
			</thead>		
			<tbody>
				<tr>
					<td style="background-color: #fafafa; text-align: center;"><h5>Title</h5></td>
					<td style="background-color: #fafafa; text-align: center;"><%= bbs.getUserTitle() %></td>				
				</tr>
				<tr>
					<td style="background-color: #fafafa; text-align: center;"><h5>Date</h5></td>
					<td style="background-color: #fafafa; text-align: center;"><%= bbs.getUserDate() %></td>				
				</tr>
				<tr>
					<td style="background-color: #fafafa; text-align: center;"><h5>Memo</h5></td>
					<td style="background-color: #fafafa; text-align: center;"><%= bbs.getUserMemo() %></td>				
				</tr>
				<tr>
					<td style="background-color: #fafafa; text-align: center;border-bottom-left-radius: 5px;"><h5>Importance</h5></td>
					<td style="background-color: #fafafa; text-align: center;border-bottom-right-radius:5px;"><%= bbs.getUserCompletion() %></td>
				</tr>
			</tbody>
		</table>
		
		<a href="Register_main_AT.jsp?userID=<%=userID %>" class="btn btn-primary" style="box-shadow: rgba(0,0,0,0.8) 0 0 3px;">목록</a>
		<%
			if(userID != null && userID.equals(bbs.getUserID())){
		%>
			<a href="update_AT.jsp?bbsID=<%= bbsID %>" class="btn btn-primary" style="box-shadow: rgba(0,0,0,0.8) 0 0 3px;">수정</a>
			<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction_AT.jsp?bbsID=<%= bbsID %>" class="btn btn-primary" style="box-shadow: rgba(0,0,0,0.8) 0 0 3px;">삭제</a>
			<a  id="kakao-link-btn" href="javascript:sendLink()">
			<img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" width="37", height="37"/>
			</a>
			<script type="text/javascript">
			Kakao.init('a22e90bb42843140e53e7439ba4d1a83');
			  function sendLink() {
			    Kakao.Link.sendDefault({
			      objectType: 'text',
				 text:
					 'TODAY LIST 공유 일정입니다. \nTitle: <%= bbs.getUserTitle() %> \nDate: <%= bbs.getUserDate() %> \nMemo: <%= bbs.getUserMemo() %> \nImportance: <%= bbs.getUserCompletion() %>',
					 link: {
			        mobileWebUrl:
			          'https://developers.kakao.com/docs/js/kakaotalklink#텍스트-템플릿-보내기',
			        webUrl:
			          'https://developers.kakao.com/docs/js/kakaotalklink#텍스트-템플릿-보내기',
			      },
			    })
			  }
			</script>
		<% 
			}
		%>		
		</div>
	</div>
 	<script src= "https://code.jquery.com/jquery-3.5.1.min.js"></script>
 	<script src="js/bootstrap.js"></script>
</body>
</html>


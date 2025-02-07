<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="userdata.UserData" %>
<%@ page import="userdata.UserDataDAO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-with" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>TODAY LIST 일정관리</title>
<style type="text/css">
	a, a:hover{
		color: #000000;
		text-decoration: none;
	}
	body {
  		background-image: url("main.jpg");
	}
	nav>div>ul>li>a:hover{
	font-weight:900;}
	#ajaxTable{
	 border-top-left-radius: 5px; border-top-right-radius: 5px;
	}
</style>
<script type="text/javascript">
//전체보기 페이지

 		var searchRequest = new XMLHttpRequest();
 		var deleteRequest = new XMLHttpRequest();
 		
 		function searchParam(key) {
			  return new URLSearchParams(location.search).get(key);
		};		 		
		
		
 		function searchFunction(){//search action
 			searchRequest.open("Post","./UserDSearchServlet4?userDate=" + encodeURIComponent(document.getElementById("userDate").value)+
 									"&userID=" + searchParam('userID'), true);
 			searchRequest.onreadystatechange = searchProcess;
 			searchRequest.send(null);
 		}
 		function searchProcess(){ // 각각의 행의 데이터 들을 가지고 오는 과정
 			var table = document.getElementById("ajaxTable");
 			table.innerHTML ="";
 			if (searchRequest.readyState == 4 && searchRequest.status == 200){
 				var object = eval('(' + searchRequest.responseText + ')');
 				var result = object.result; // 배열을 가져오겠다			
 				for(var i = 0; i < result.length; i++) {
 					var row = table.insertRow(0);
 					for(var j = 0; j < result[i].length; j++){
 						var cell = row.insertCell(j);
 						cell.innerHTML = result[i][j].value;
 					}					
 				}			
 			}		
 		}
 		window.onload = function() {
 			searchFunction();	
 		}
 		
 	</script>
</head>
<body>
	<%
		 String userID =null;
		if (session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber =1;
		if(request.getParameter("pageNumber") != null){			
			pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		}
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
			<a class ="navbar-brand" href="Register_main_M2.jsp?userID=<%=userID %>">TODAY LIST</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
				<li ><a href="Register_main_M2.jsp?userID=<%=userID %>">오늘의 일정</a></li>
				<li ><a href="Register_main_Month.jsp?userID=<%=userID %>">날짜별 일정</a></li>							
				<li class="active"><a href="bbs.jsp?userID=<%=userID %>">전체 일정</a></li>								
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
						aria-expanded="false"> <%=userID %>님 나가기<span class="caret"></span></a>
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
	<br>
		<div  class="container-fluid">
		<div class="col-md-5 col-md-offset-1">
		<table class="table" style="text-align: center;  border-radius: 5px; box-shadow: rgba(0,0,0,0.8) 0 0 10px;">
			<thead>
			<tr>			
			<td colspan="4" style="background-color: #42579D; align: right;border-top-left-radius: 5px; border-top-right-radius: 5px;">
			  <div class="from-group row pull-right">
			<div class="col-xs-7">				
				<input class="form-control" onkeyup="searchFunction()" type="date" id="userDate" size="20" placeholder="날짜로 찾기">			
			</div>
			<div class="col-xs-2">
				<button type="button" onclick="searchFunction();" class="btn btn-primary">검색</button>				
			</div>
			<div class="col-xs-2">
				<button class="btn btn-primary" onClick="window.location.reload()">초기화</button>			
			</div>
			</div>
			</td>			
			</tr>
		 	<tr>	
		 		<th style="background-color: #fafafa; text-align: center;">Title</th>
		 		<th  class="col-md-2" style="background-color: #fafafa; text-align: center;">Date</th>
		 		<th style="background-color: #fafafa; text-align: center;">Memo</th>
		 		<th style="background-color: #fafafa; text-align: center;">Importance</th>		 		
		 	</tr>	 
		 	</thead>
		 	<tbody style="background-color: #fafafa; text-align: center;" id="ajaxTable">		
		 	</tbody>	 	
		 </table>
		  </div>	
		  <div class="col-md-5">
			<table class="table table-striped" style="text-align: center;  border-radius: 5px; box-shadow: rgba(0,0,0,0.8) 0 0 10px;">
				<thead>
					<tr style="text-align:right;margin:0px;padding:0px;">
					<th colspan="4" style="background-color: #42579D; text-align: center;height: 70px;padding-bottom:5px;margin:0px;border-top-left-radius: 5px; border-top-right-radius: 5px;"><h2><span style="color: white;margin:0px;">TOTAL LIST</span></h2></th></tr>
					<script>
					console.log(document.getElementsByName("userCompletion").value);
					</script>
					<tr>
					<th  style="background-color: #fafafa;  text-align:center;">Title</th>
					<th  class="col-md-2" style="background-color: #fafafa; text-align:center;">Date</th>
					<th  style="background-color: #fafafa;  text-align:center;">Memo</th>
					<th  style="background-color: #fafafa;  text-align:center;">Importance</th>
					</tr>
				</thead>
				<tbody>
				<%
					UserDataDAO userdataDAO = new UserDataDAO();
					ArrayList<UserData> list = userdataDAO.getList(userID);
					for(int i=0;i< list.size(); i++){
				%>	
				<tr>
				<td style="background-color: #fafafa;  text-align:center;"><a href="view_bbs.jsp?bbsID=<%= list.get(i).getBbsID()%>"><%= list.get(i).getUserTitle()%></a></td> 
	 			<td style="background-color: #fafafa;  text-align:center;"><%=list.get(i).getUserDate()%></td>
				<td style="background-color: #fafafa;  text-align:center;"><%=list.get(i).getUserMemo()%></td>
				<td style="background-color: #fafafa;  text-align:center;"><%=list.get(i).getUserCompletion()%></td>            
				</tr>					
				<% 	
					}
				%>
				</tbody>
			</table>			

			<a href="write_bbs.jsp?userID=<%=userID%>" style="box-shadow: rgba(0,0,0,0.8) 0 0 5px;"  class="btn btn-primary pull-right">글쓰기</a>
		</div>	
		</div>

 	<script src= "https://code.jquery.com/jquery-3.5.1.min.js"></script>
 	<script src="js/bootstrap.js"></script>
</body>
</html>


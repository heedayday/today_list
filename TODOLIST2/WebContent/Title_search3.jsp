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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-with, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="css/bootstrap.css">
<title>TODAY LIST 일정관리</title>
<style type="text/css">
	body {
  		background-image: url("main.jpg");
	}
</style>
<script src="js/bootstrap.js"></script>
<script src= "https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="jquery.table2excel.js"></script>
<script type="text/javascript">
//전체보기 페이지

 		var searchRequest = new XMLHttpRequest();
 		var deleteRequest = new XMLHttpRequest();
 		
 		function searchParam(key) {
			  return new URLSearchParams(location.search).get(key);
		};		 		
		function printFunction(){
			window.print();
		}
		
 		function searchFunction(){//search action
 			searchRequest.open("Post","./UserDSearchServlet?userTitle=" + encodeURIComponent(document.getElementById("userTitle").value)+
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

 				var b;
 				for(var i = 0; i < result.length; i ++) {
 					for(var j = 0 ; j < result.length-i-1 ; j ++) {
 						var before = to_date(result[j][1]);
 						var after = to_date(result[j+1][1]);

 						if(before < after) {
 							b = result[j];
 							result[j] = result[j+1];
 							result[j+1] = b;
 						}
 					}
 				}

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
 		
 		function to_date(date_str){
 		    var yyyyMMdd = String(date_str.value);
 		    var sYear = yyyyMMdd.substring(0,4);
 		    var sMonth = yyyyMMdd.substring(5,7);
 		    var sDate = yyyyMMdd.substring(8,10);

 		    return new Date(Number(sYear), Number(sMonth)-1, Number(sDate));
 		}
 		function ReportToExcelConverter() { $("#TableToExcel").table2excel({
 			exclude: ".noExl", name: "Excel Document Name", filename: searchParam('userID')+"'s TODAYLIST" +'.xls', //확장자를 여기서 붙여줘야한다.
 			fileext: ".xls", exclude_img: true, exclude_links: true, exclude_inputs: true }); }
 	</script>

</head>
<body>
	<%
		 String userID =null;
		if (session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
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
			<a class ="navbar-brand"> <%=userID %>'s TODAY LIST</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
				<li ><a href="Register_main_M2.jsp?userID=<%=userID %>">오늘의 일정</a></li>
				<li ><a href="Register_main_Month.jsp?userID=<%=userID %>">날짜별 일정</a></li>							
				<li><a href="bbs.jsp?userID=<%=userID %>">전체 일정</a></li>								
				<li class="active"><a href="Title_search.jsp?userID=<%=userID %>">일정 출력</a></li>						
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
					<a href="logoutAction.jsp" class="dropdown-toggle"
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

	<div class="container">
		<table id="TableToExcel" class="table" style="text-align: center; border: 1px solid #42579D">
			<thead>
			<tr>			
			<td colspan="4" style="background-color: #42579D; align: right;">
			<div class="from-group row pull-right">
			 <div class="col-xs-7 col-md-pull-1">
				<input class="form-control" id="userTitle" onkeyup="searchFunction()" type="text" size="20" placeholder="Title로 따로보기">
			</div>
			<div class="col-xs-1 col-md-pull-1">
				<button type="button" onclick="searchFunction();" class="btn btn-primary">검색</button>
			</div>		
			<div class="col-xs-4 col-md-push-0">
			<div class="form-group" style="text-align:center; margin: 0 auto;">
			<div class="btn-group" data-toggle="buttons">
				 		<label class="btn btn-primary">
				 			<input type="radio" onclick="printFunction();">P
				 		</label>
				 		<label class="btn btn-primary">
				 			<input type="radio"  onclick="ReportToExcelConverter()" >Excel
				 		</label>				 					 				
			</div>
			</div>
			</div>						
			</div>
			</td>			
			</tr>
		 	<tr>
		 		<th style="background-color: #fafafa; text-align: center;">Title</th>
		 		<th style="background-color: #fafafa; text-align: center;">Date</th>
		 		<th style="background-color: #fafafa; text-align: center;">Memo</th>
		 		<th style="background-color: #fafafa; text-align: center;">Importance</th>		 		
		 	</tr>	 
		 	</thead>
		 	<tbody style="background-color: #fafafa; text-align: center;" id="ajaxTable">
		 	</tbody>	 	
		 </table>
		 
	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="userdata.UserData" %>
<%@ page import="userdata.UserDataDAO" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
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
	#plus{
		height:173px;
		padding:1px 10px 10px 150px;
background: #E0EAFC;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #CFDEF3, #E0EAFC);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #CFDEF3, #E0EAFC); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	}
	nav>div>ul>li>a:hover{
	font-weight:900;}
</style>
<script type="text/javascript">
 //등록하는 페이지	
 		
 		var registerRequest = new XMLHttpRequest();	
		var search2Request = new XMLHttpRequest();
		
 		function searchParam(key) {
 			  return new URLSearchParams(location.search).get(key);
 		};
 		function vCheck(obj, msg)
 		{
 		    if (obj.value == "" || obj.value == null )
 		    {
 		        alert("Please Input Your " + msg) ;
 		        obj.focus() ;
 		        return 0 ;
 		    }
 		    else
 		    {
 		        return 1 ;
 		    }
 		}
 				
 		function registerFunction(){	
 			registerRequest.open("Post","./UserDRegisterServlet?userTitle=" + encodeURIComponent(document.getElementById("registerTitle").value) +
 										"&userDate=" + encodeURIComponent(document.getElementById("registerDate").value) +
 										"&userMemo=" + encodeURIComponent(document.getElementById("registerMemo").value) +    
 										"&userCompletion=" + encodeURIComponent($('input[name=registerCompletion]:checked').val()) +
 										"&userID=" + searchParam("userID"), true); //이부분 수정 ....
 			registerRequest.onreadystatechange = registerProcess;
 			registerRequest.send(null);
 			location.href ='Register_main_M1.jsp?userID='+searchParam("userID");
 			
 		} 	
 		
 		function registerProcess(){
 			 if(registerRequest.readyState == 4 && registerRequest.status == 200){
 				var result = registerRequest.responseText; //성공 1 아니면 0
 				if(result != 1){
 					alert('등록에 실패했습니다.');
 				}
 				else{
 					var userTitle = document.getElementById("userTitle");
 					var registerTitle = document.getElementById("registerTitle");
 					var registerDate = document.getElementById("registerDate");
 					var registerMemo = document.getElementById("registerMemo");
 					var userID = document.getElementById("userID");
 					userTitle.value = "";
 					registerTitle.value = "";
 					registerDate.value = "";
 					registerMemo.value = "";
 					userId.value = "";
 					
 				}
 			}
 			
 		}	

		function getFormatDate(date){
	 		    var year = date.getFullYear();              //yyyy
	 		    var month = (1 + date.getMonth());          //M
	 		    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
	 		    var day = date.getDate();                   //d
	 		    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
	 		    return  year + '-' + month + '-' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
	 		};
	 		
	 	function searchFunction2(){ 
	 		var date = new Date();
	 		date = getFormatDate(date);
	 		var today = date.toString();
	 		
	 		
 			search2Request.open("Post","./UserDSearchServlet2?userDate="+today +
 										"&userID=" + searchParam("userID"), true);
 			search2Request.onreadystatechange = searchProcess2;
 			search2Request.send(null);
 		} 		
 		function searchProcess2(){ // 각각의 행의 데이터 들을 가지고 오는 과정
 			var table = document.getElementById("ajaxTable");
 			table.innerHTML ="";
 			if (search2Request.readyState == 4 && search2Request.status == 200){
 				var object = eval('(' + search2Request.responseText + ')');
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
 			 searchFunction2();			
 		}
 		
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
			<a class ="navbar-brand" href="Register_main_M2.jsp?userID=<%=userID %>">TODAY LIST</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
				<li class="active"><a href="Register_main_M2.jsp?userID=<%=userID %>">오늘의 일정</a></li>
				<li ><a href="Register_main_Month.jsp?userID=<%=userID %>">날짜별 일정</a></li>							
				<li><a href="bbs.jsp?userID=<%=userID %>">전체 일정</a></li>								
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
	<div id="plusOption" class="row">
	<div class="col-md-1">
	</div>
	<div class="col-md-10">
	<div id="plus" class="jumbotron" style="font-family: 'Nanum Gothic', sans-serif;">
    <h2 style="font-weight:900;color:black;"><%=userID %>'s TODAY LIST &nbsp;<span style="font-weight:900;color: #42579D;">오늘도 반갑습니다.</span> </h2> 
    <p style="font-size:20px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:25px; font-weight:900;background: linear-gradient(to top, #ffe400 50%, transparent 50%);padding:0px 5px 0px 5px;">TODAY LIST의 일정 변경 방법 설명 </span><br>
    <span style="font-weight:900"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;오늘의 일정에서 <span style="font-weight:900">TODAY LIST</span>,
     날짜별 일정에서 <span style="font-weight:900">MONTH LIST</span>, 전체 일정에서 <span style="font-weight:900">TOTAL LIST</span> 
     <br>&nbsp;&nbsp;&nbsp;&nbsp; <span style="border-bottom: 1px solid #ffe400; box-shadow: inset 0 -2px 0 #ffe400;padding:0px 3px 0px 3px;">위 3개의 'LIST'에서 각각 'Title'을 누르시면</span> <span style="font-weight:900">일정의 수정, 삭제, 공유</span>가 가능합니다.</p>
  	</div>
	</div>
	
	<div class="col-md-1">
	</div>	
	</div>
	
	<div class="col-md-5 col-md-offset-1">
	<!--  <div class="container">-->
		<form method="post" action="writeAction_M2.jsp?userID=<%=userID %>">
			<table class="table" style="text-align: center; border-radius: 5px; box-shadow: rgba(0,0,0,0.8) 0 0 10px;">
			<thead >
				<tr>
					<th colspan="2" style="background-color: #42579D; text-align:center; color: white; border-top-left-radius: 5px; border-top-right-radius: 5px;"><h4>일정 등록하기</h4></th>
				</tr>			
			</thead>		
			<tbody>
				<tr >
					<td style="background-color: #fafafa; text-align: center;"><h5>Title</h5></td>
					<td style="background-color: #fafafa; text-align: center;"><input class="form-control" type="text" name="userTitle" size="20" maxlength="20" placeholder="(20자 이내)"></td>				
				</tr>
				<tr>
					<td style="background-color: #fafafa; text-align: center;"><h5>Date</h5></td>
					<td style="background-color: #fafafa; text-align: center;"><input class="form-control" type="date" name="userDate" size="20"></td>				
				</tr>
				<tr>
					<td style="background-color: #fafafa; text-align: center;"><h5>Memo</h5></td>
					<td style="background-color: #fafafa; text-align: center;"><input class="form-control" type="text" name="userMemo" size="20" maxlength="30" placeholder="(30자 이내)"></td>				
				</tr>
				<tr>
					<td style="background-color: #fafafa; text-align: center; border-bottom-left-radius: 5px;"><h5>Importance</h5></td>
					<td style="background-color: #fafafa; text-align: center; border-bottom-right-radius:5px;">
						<div class="form-group" style="text-align:center; margin: 0 auto;">
				 			<div class="btn-group" data-toggle="buttons" >
				 				<label class="btn btn-primary active">
				 					<input type="radio" name="userCompletion" autocomplete="off" value="상" checked>상
				 				</label>
				 				<label class="btn btn-primary">
				 					<input type="radio" name="userCompletion" autocomplete="off" value="중" >중
				 				</label>
				 				<label class="btn btn-primary">
				 					<input type="radio" name="userCompletion" autocomplete="off" value="하">하
				 					<!-- 이부분도 수정 -->
				 				</label>			 				
				 			</div>
				 		</div>				
					</td>
				</tr>
			</tbody>
		</table>
			<input type="submit" href="write_M2.jsp" style="box-shadow: rgba(0,0,0,0.8) 0 0 3px;" class="btn btn-primary pull-right" value="추가">
		</form>
		<!--  </div>-->

	</div>
		  <div class="col-md-5">
		  <table class="table table-striped" style="text-align: center; border-radius: 5px; box-shadow: rgba(0,0,0,0.8) 0 0 10px;">
				<thead>					
					<tr> 		
			 		<th colspan="3" style="background-color: #42579D; text-align: center; border-top-left-radius: 5px; border-top-right-radius: 5px;">
			 		<h3><button type="button" onclick="location.href='Register_main_BT.jsp?userID=<%=userID %>'" class="btn btn-secondary"><</button>&nbsp;&nbsp;&nbsp;<span style="color: white">TODAY LIST</span>&nbsp;&nbsp;&nbsp;<button type="button" onclick="location.href='Register_main_AT.jsp?userID=<%=userID %>'" class="btn btn-secondary">></button></h3></th>
			 		</tr>				
					<tr>					
					<th  style="background-color: #fafafa;  text-align:center;">Title</th>					
					<th  style="background-color: #fafafa;  text-align:center;">Memo</th>
					<th  style="background-color: #fafafa;  text-align:center;">Importance</th>
					</tr>
				</thead>
				<tbody>
				<%
					Date now = new Date();
					SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");	
				    String today = sf.format(now);
				    String userDate=today;
					UserDataDAO userdataDAO = new UserDataDAO();
					ArrayList<UserData> list = userdataDAO.getList3(userID,userDate);
					for(int i=0;i< list.size(); i++){
				%>	
				<tr>				
				<td style="background-color: #fafafa; text-align: center; border-bottom-left-radius: 5px; border-top-left-radius: 5px;"><a href="view_M2.jsp?bbsID=<%= list.get(i).getBbsID()%>"><%= list.get(i).getUserTitle()%></a></td> 				
				<td style="background-color: #fafafa; text-align: center;"><%=list.get(i).getUserMemo()%></td>
				<td style="background-color: #fafafa; text-align: center; border-bottom-right-radius:5px; border-top-right-radius: 5px;"><%=list.get(i).getUserCompletion()%></td>               
				</tr>					
				<% 	
					}
				%>
				</tbody>
				</table>
		  </div>
	</div>
	
 	<script src= "https://code.jquery.com/jquery-3.5.1.min.js"></script>
 	<script src="js/bootstrap.js"></script>
</body>
</html>
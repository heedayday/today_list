<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "userdata.UserDataDAO" %>
<%@ page import = "userdata.UserData" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP</title>
</head>
<body>
<%
		String userID= null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
	}
		if (userID == null){
			PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href ='login.jsp'");
			script.println("</script>");
	} 
		int bbsID = 0;
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));	
		}
		if(bbsID == 0){
			PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href ='bbs.jsp'");
			script.println("</script>");
		}
		UserData bbs =new UserDataDAO().getBbs(bbsID);
		if(!userID.equals(bbs.getUserID())){
			PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href ='bbs.jsp'");
			script.println("</script>");
		} else {
					UserDataDAO bbsDAO = new UserDataDAO();
					int result = bbsDAO.delete(bbsID);
					if (result == -1){
						PrintWriter script =response.getWriter();
						script.println("<script>");
						script.println("alert('글 삭제에 실패했습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}
					else {
						userID = (String) session.getAttribute("userID");
						String name = userID+"'";
						PrintWriter script =response.getWriter();
						script.println("<script>");
						script.println("location.href ='Register_main_Month.jsp?userID="+name);
						script.println("</script>");
					} 		
		}
		
	
%>
</body>
</html>
/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.38
 * Generated at: 2020-11-12 17:43:21 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.PrintWriter;
import userdata.UserData;
import userdata.UserDataDAO;

public final class view_005fbbs_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.io.PrintWriter");
    _jspx_imports_classes.add("userdata.UserData");
    _jspx_imports_classes.add("userdata.UserDataDAO");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      user.User user = null;
      user = (user.User) _jspx_page_context.getAttribute("user", javax.servlet.jsp.PageContext.PAGE_SCOPE);
      if (user == null){
        user = new user.User();
        _jspx_page_context.setAttribute("user", user, javax.servlet.jsp.PageContext.PAGE_SCOPE);
      }
      out.write('\r');
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.introspecthelper(_jspx_page_context.findAttribute("user"), "userID", request.getParameter("userID"), request, "userID", false);
      out.write('\r');
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.introspecthelper(_jspx_page_context.findAttribute("user"), "userPassword", request.getParameter("userPassword"), request, "userPassword", false);
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-with\" , initial-scale=\"1\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/bootstrap.css\">\r\n");
      out.write("<script src=\"//developers.kakao.com/sdk/js/kakao.min.js\"></script>\r\n");
      out.write("<title>TODAY LIST 일정관리</title>\r\n");
      out.write("<style>\r\n");
      out.write(".container {\r\n");
      out.write("  width: 50%;\r\n");
      out.write("}\r\n");
      out.write("body {\r\n");
      out.write("  \t\tbackground-image: url(\"ect.jpg\");\r\n");
      out.write("\t}\r\n");
      out.write("\tnav>div>ul>li>a:hover{\r\n");
      out.write("\tfont-weight:900;}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t");

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
			script.println("location.href ='Register_main_M2.jsp"+"?userID="+name);
			script.println("</script>");
		}
		UserData bbs =new UserDataDAO().getBbs(bbsID);
	
      out.write("\r\n");
      out.write("\t<nav class=\"navbar navbar-default\">\r\n");
      out.write("\t\t<div class=\"navbar-header\">\r\n");
      out.write("\t\t\t<button type=\"button\" class=\"navbar-toggle collapsed\"\r\n");
      out.write("\t\t\t\tdata-toggle=\"collapse\" data-target=\"#bs-example-navbar-collapse-1\"\r\n");
      out.write("\t\t\t\taria-expanded=\"false\">\r\n");
      out.write("\t\t\t\t<span class=\"icon-bar\"></span>\r\n");
      out.write("\t\t\t\t<span class=\"icon-bar\"></span>\r\n");
      out.write("\t\t\t\t<span class=\"icon-bar\"></span>\r\n");
      out.write("\t\t\t</button>\r\n");
      out.write("\t\t\t<a class =\"navbar-brand\">TODAY LIST</a>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"collapse navbar-collapse\" id=\"bs-example-navbar-collapse-1\">\r\n");
      out.write("\t\t\t<ul class=\"nav navbar-nav\">\r\n");
      out.write("\t\t\t\t<li ><a href=\"Register_main_M2.jsp?userID=");
      out.print(userID );
      out.write("\">오늘의 일정</a></li>\r\n");
      out.write("\t\t\t\t<li ><a href=\"Register_main_Month.jsp?userID=");
      out.print(userID );
      out.write("\">날짜별 일정</a></li>\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t<li class=\"active\"><a href=\"bbs.jsp?userID=");
      out.print(userID );
      out.write("\">전체 일정</a></li>\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t<li><a href=\"Title_search.jsp?userID=");
      out.print(userID );
      out.write("\">일정 출력</a></li>\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t</ul>\r\n");
      out.write("\t\t\t");

				if(userID == null) {
			
      out.write("\r\n");
      out.write("\t\t\t<ul class=\"nav navbar-nav navbar-right\">\r\n");
      out.write("\t\t\t\t<li class=\"dropdown\">\r\n");
      out.write("\t\t\t\t\t<a href=\"#\" class=\"dropdown-toggle\"\r\n");
      out.write("\t\t\t\t\t\tdata-toggle=\"dropdown\" role=\"button\" aria-haspoppup=\"ture\"\r\n");
      out.write("\t\t\t\t\t\taria-expanded=\"false\">시작하기<span class=\"caret\"></span></a>\r\n");
      out.write("\t\t\t\t\t<ul class=\"dropdown-menu\">\r\n");
      out.write("\t\t\t\t\t\t<li><a href=\"login.jsp\">로그인</a></li>\r\n");
      out.write("\t\t\t\t\t\t<li><a href=\"join.jsp\">회원가입</a></li>\r\n");
      out.write("\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t</li>\t\t\t\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t\t");

				} else {
			
      out.write("\r\n");
      out.write("\t\t\t<ul class=\"nav navbar-nav navbar-right\">\r\n");
      out.write("\t\t\t\t<li class=\"dropdown\">\r\n");
      out.write("\t\t\t\t\t<a href=\"#\" class=\"dropdown-toggle\"\r\n");
      out.write("\t\t\t\t\t\tdata-toggle=\"dropdown\" role=\"button\" aria-haspoppup=\"ture\"\r\n");
      out.write("\t\t\t\t\t\taria-expanded=\"false\">");
      out.print(userID );
      out.write("님 나가기<span class=\"caret\"></span></a>\r\n");
      out.write("\t\t\t\t\t<ul class=\"dropdown-menu\">\r\n");
      out.write("\t\t\t\t\t\t<li><a href=\"logoutAction.jsp\">로그아웃</a></li>\r\n");
      out.write("\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t</li>\t\t\t\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t");
 
				}
			
      out.write("\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</nav>\t\r\n");
      out.write("\t<div class=\"container\">\r\n");
      out.write("\t\t<div class=\"row\">\r\n");
      out.write("\t\t<table class=\"table\" style=\"text-align: center; border-radius: 5px; box-shadow: rgba(0,0,0,0.8) 0 0 10px;\">\r\n");
      out.write("\t\t\t<thead>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<th colspan=\"2\" style=\"background-color: #42579D; text-align:center; color: white; border-top-left-radius: 5px; border-top-right-radius: 5px;\"><h4>일정 확인하기</h4></th>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t</thead>\t\t\r\n");
      out.write("\t\t\t<tbody>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td style=\"background-color: #fafafa; text-align: center;\"><h5>Title</h5></td>\r\n");
      out.write("\t\t\t\t\t<td style=\"background-color: #fafafa; text-align: center;\">");
      out.print( bbs.getUserTitle() );
      out.write("</td>\t\t\t\t\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td style=\"background-color: #fafafa; text-align: center;\"><h5>Date</h5></td>\r\n");
      out.write("\t\t\t\t\t<td style=\"background-color: #fafafa; text-align: center;\">");
      out.print( bbs.getUserDate() );
      out.write("</td>\t\t\t\t\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td style=\"background-color: #fafafa; text-align: center;\"><h5>Memo</h5></td>\r\n");
      out.write("\t\t\t\t\t<td style=\"background-color: #fafafa; text-align: center;\">");
      out.print( bbs.getUserMemo() );
      out.write("</td>\t\t\t\t\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td style=\"background-color: #fafafa; text-align: center;border-bottom-left-radius: 5px;\"><h5>Importance</h5></td>\r\n");
      out.write("\t\t\t\t\t<td style=\"background-color: #fafafa; text-align: center;border-bottom-right-radius:5px;\">");
      out.print( bbs.getUserCompletion() );
      out.write("</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</tbody>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<a href=\"bbs.jsp?userID=");
      out.print(userID );
      out.write("\" class=\"btn btn-primary\" style=\"box-shadow: rgba(0,0,0,0.8) 0 0 3px;\">목록</a>\r\n");
      out.write("\t\t");

			if(userID != null && userID.equals(bbs.getUserID())){
		
      out.write("\r\n");
      out.write("\t\t\t<a href=\"update_bbs.jsp?bbsID=");
      out.print( bbsID );
      out.write("\" class=\"btn btn-primary\" style=\"box-shadow: rgba(0,0,0,0.8) 0 0 3px;\">수정</a>\r\n");
      out.write("\t\t\t<a onclick=\"return confirm('정말로 삭제하시겠습니까?')\" href=\"deleteAction_bbs.jsp?bbsID=");
      out.print( bbsID );
      out.write("\" class=\"btn btn-primary\" style=\"box-shadow: rgba(0,0,0,0.8) 0 0 3px;\">삭제</a>\r\n");
      out.write("\t\t\t<a  id=\"kakao-link-btn\" href=\"javascript:sendLink()\">\r\n");
      out.write("\t\t\t<img src=\"//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png\" width=\"37\", height=\"37\"/>\r\n");
      out.write("\t\t\t</a>\r\n");
      out.write("\t\t\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t\tKakao.init('a22e90bb42843140e53e7439ba4d1a83');\r\n");
      out.write("\t\t\t  function sendLink() {\r\n");
      out.write("\t\t\t    Kakao.Link.sendDefault({\r\n");
      out.write("\t\t\t      objectType: 'text',\r\n");
      out.write("\t\t\t\t text:\r\n");
      out.write("\t\t\t\t\t 'TODAY LIST 공유 일정입니다. \\nTitle: ");
      out.print( bbs.getUserTitle() );
      out.write(" \\nDate: ");
      out.print( bbs.getUserDate() );
      out.write(" \\nMemo: ");
      out.print( bbs.getUserMemo() );
      out.write(" \\nImportance: ");
      out.print( bbs.getUserCompletion() );
      out.write("',\r\n");
      out.write("\t\t\t      link: {\r\n");
      out.write("\t\t\t        mobileWebUrl:\r\n");
      out.write("\t\t\t          'https://developers.kakao.com/docs/js/kakaotalklink#텍스트-템플릿-보내기',\r\n");
      out.write("\t\t\t        webUrl:\r\n");
      out.write("\t\t\t          'https://developers.kakao.com/docs/js/kakaotalklink#텍스트-템플릿-보내기',\r\n");
      out.write("\t\t\t      },\r\n");
      out.write("\t\t\t    })\r\n");
      out.write("\t\t\t  }\r\n");
      out.write("\t\t\t</script>\r\n");
      out.write("\t\t");
 
			}
		
      out.write("\t\t\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write(" \t<script src= \"https://code.jquery.com/jquery-3.5.1.min.js\"></script>\r\n");
      out.write(" \t<script src=\"js/bootstrap.js\"></script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

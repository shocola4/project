<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	if( session.getAttribute("aid") == null) {
%>
		<script language="Javascript">
		location.href="admin_login_BootStrap.jsp";
		</script>
<%
	} else {
		// 관리자 session 제거.
		String alogin = session.getAttribute("aid").toString();
		session.invalidate();	
		//out.println("<h4>관리자는 로그아웃 되었습니다.</h4>");
%>
		<script language="Javascript">
			alert('로그아웃 되었습니다.');
			location.href="admin_login_BootStrap.jsp";
		</script>
<%	
}
%>    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.sql.*" %>
    
<%
	String uid = request.getParameter("uid");
	String pwd = request.getParameter("pwd");
	String sql = "select m_uid, m_pwd from member where m_uid = ? ";
	String sql1 = "update member set m_visit=m_visit+1 where m_uid = ? ";
  	
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection(url,"antman","12345");
	PreparedStatement pstmt = null; 
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, uid);
	ResultSet rs = pstmt.executeQuery();
	
	if( rs.next() ) {
		if (pwd.trim().equals(rs.getString("m_pwd").trim())) 
		{
			session.setAttribute("uid", uid);
			PreparedStatement pstmt1 = conn.prepareStatement(sql1);
			pstmt1.setString(1, uid);
			pstmt1.executeUpdate();
			pstmt1.close();
 %>
 			
 			<script language="JavaScript">
 				alert('<%= uid %>' + '님이 로그인 하셨습니다.');
 				//location.href = "http://localhost:8088/MMS/Member/index_BootStrap.jsp";
				location.href ="index_BootStrap.jsp";
 			</script>
 			
			<%-- 
				<h3>로그인 성공</h3>
				<img src="img/love.gif"><p>
				<%= uid %> 님이 로그인 하셨습니다.<p> 
			--%>
<%
		} else {
 %>
            <script language="JavaScript">
 				alert('비밀 번호를 다시 확인해 주세요.');
 				history.go(-1);
 			</script>
			<!-- 			
            	<h3>로그인 실패</h3>
				<img src="img/warning.gif"><p>
				비밀 번호를 다시 확인해 주세요...<p> 
			-->
<%       
		}          
	} else {
%>
            <script language="JavaScript">
 				alert('아이디를 다시 확인해 주세요.');
 				history.go(-1);
 			</script>
		<!-- 		
			<h3>로그인 실패</h3>
			<img src="img/warning.gif"><p>
			아이디를 다시 확인해 주세요...<p>
		 -->
<%	
	}
	rs.close();
	pstmt.close();
	conn.close();
%>
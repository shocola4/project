<%@ page  import="java.sql.*" contentType="text/html;charset=euc-kr" %>

<%
	String b_id = request.getParameter("b_id");
%>                                          
<HTML>
	<HEAD>
		<TITLE>�߰���</TITLE>
	</HEAD>
	<link href="../common/u3.css" type=text/css rel=stylesheet>

<BODY leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
	<jsp:include page="../common/basic_screen.jsp" flush="true"/>

	<br>
	<table cellpadding=0 cellspacing=0 border=0 width=330>
		<tr bgcolor=#7eaee9>
			<td align=center><font color="#ffffff"><b>�Խù��� ��й�ȣ�� �Է��ϼ���.</b></font></td>
		</tr>
	</table>
	&nbsp;
	<table >
	<tr>
	<td>
	<img src="img/b_re.gif" border=0>
	</td>
	</tr>
	</table>
	<table cellpadding=0 cellspacing=0 border=0 width=330>
	<form name="confirm_password" method="post" action="delete.jsp">
		<tr bgcolor=#948dcf>
			<td>
				<table cellpadding=4 cellspacing=1 border=0 width=330>
  					<tr bgcolor="#ffffff">
						<td align="center">
							<input type="password" name="pwd" size=20 >
							<input type="submit" value="Ȯ��">
						</td>
					</tr>
				</table>
				<input type="hidden" name="b_id" value="<%=b_id%>">  
	</form>                              
	</tr>
	</table>

	<table cellpadding=0 cellspacing=0 border=0 width=330>
		<tr bgcolor=#0000FF><td></td>
		</tr>
	</table>


</body>
</html>
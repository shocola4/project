<%@ page contentType="text/html;charset=utf-8" %>

<% 
	String pid =(String)session.getAttribute("pid");
	String pname=(String)session.getAttribute("pname"); 
%>

<body link="#000000" vlink="#000000" alink="#666666">
<table width=1000 border=0 cellspacing=0 cellpadding=0 height=100 align=left name="top_table">
	<tbody valign=top align=left>
		<tr valign=top align=left> 
			<td border=0 width=50 height=50 rowspan=2><a href="../main/index.jsp"><img name="Image5" border=0 src="../img/logo_12.gif" width=350 height=60></a></td>
			<td>&nbsp&nbsp</td>
			<td width=100 colspan=2>
			<div align=center><marquee behavior=left scrollamount=1><font color="#0000AA">
<%
				if( session.getAttribute("pid") != null) {
 %>
					([<%=pname%>]
<%
				}
 %>			님 어서오세요!</font></marquee></div>
			</td>
			<td>&nbsp &nbsp &nbsp</td>
			</tr>
		<tr valign=top align=right> 
<%
			if( session.getAttribute("pid") != null) {
%>
			<td><a href="../member/logout.jsp" class=line>[ 로그아웃 ]</td>
<%
			}  else {
%>
			<td><a href="../member/login.jsp" class=line>[ 로그인 ]</a></td>
<%
			}
%>
            <td align=right style="width: 120px; padding-left :9px;"><a href="../AD_Page/admin_login_BootStrap.jsp" class=line>[ 관리자페이지 ]</a></td>
			<td align=right style="width: 98px;"><a href="../service/index_site.jsp" class=line>[ 사이트맵 ]</a></td>
		</tr>
	</tbody>
</table>

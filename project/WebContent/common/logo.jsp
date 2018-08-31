<%@ page contentType="text/html;charset=utf-8" %>

<% 
	String pid =(String)session.getAttribute("pid");
	String pname=(String)session.getAttribute("pname"); 
%>

<body link="#000000" vlink="#000000" alink="#666666">
<table width=1700 border=0 cellspacing=0 cellpadding=0 height=10 align=left name="top_table">
	<tbody valign=top align=left>
		<tr valign=top align=left> 
			<td border=0 width=50 height=100 rowspan=2><a href="../main/index.jsp"><img name="Image5"  align=left  border=0 src="../img/electronic-logo.png" width=500 height=95></a></td>
			
			<td width=100 colspan=2>
			<div align=right><marquee behavior=left scrollamount=1><font color="#0000AA">
<%
				if( session.getAttribute("pid") != null) {
 %>
					([<%=pname%>]
<%
				}
 %>			님 어서오세요!</font></marquee></div>
			</td>
		
			</tr>
		<tr valign=top  align=center> 
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
            <td align=center style="width: 120px; padding-left :9px;"><a href="../AD_Page/admin_login_BootStrap.jsp" class=line>[ 관리자페이지 ]</a></td>
			<td align=right style=" width= 100px;"><a href="../service/index_site.jsp" class=line>[ 사이트맵 ]</a></td>
			
			
		</tr>
		
		  <td width=1000 height=50 valign=middle style=" padding-bottom:4px;" bgcolor=#ffffff >
		<tr align=center>
		<form name="search_form" action="../common/search_view.jsp" method=post>
	         <td height="50" width="1000" align="center" style="padding-bottom: 12px ;  padding-left: 400px;">  
                  <input type="text" name="srch_word" size="25" style="width:600px;height: 40.98438px;">
                   <input type="image" border=0 width="49" height="40"align="center" style="padding-bottom: 9px;" src="../img/s.gif"></td>
             </form>
             </td>
		</tr>
	</tbody>
</table>

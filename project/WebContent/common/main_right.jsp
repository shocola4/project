<%@ page contentType="text/html;charset=utf-8" import="java.sql.*,oracle.dbpool.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table align=center border =1 width=900 cellpadding=0 cellspacing=0 bgcolor=#ffffff>
	<tr>
		<td><table align=center border=0 width=900  cellpadding=0 cellspacing=0 bgcolor=#ffffff><div align=center><img src="../img/main_window.JPG" width=905 height=250 ></div></table></td>
	</tr>
	</table>
	<table>
  <tr height="35px;">
    <td></td>
  </tr>

</table>


<table>
  
</table>

	<table align=center border =1 width=550 cellpadding=0 cellspacing=0 bgcolor=#ffffff>
	
	<!-- 최신상품 출력  -->
	<tr height=35>
		<div align=center ><td bgcolor=black><font color=white style="padding-left: 10px;'"><span style="font-weight:bold "size="4px"; align="center"; >최신상품</span></font></div></td>
	</tr>
	<tr>
		<td width=550>
			<table width=535 border=0 cellpadding=1 cellspacing=1>
				<tr>
<%
	try {
		String name, company_id, expression, photo;
		int id, price;
		DBConnectionManager pool = DBConnectionManager.getInstance();
		Connection con = pool.getConnection("ora8");
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select id,name,price,photo from product where id between 49 and 52");
		int flag=0;
		while(rs.next()) {
			id=rs.getInt(1);
			name=rs.getString(2);
			price=rs.getInt(3);
			photo=rs.getString(4);
%>
         <!-- 표시 테이블  -->
		<td>
			<table width=145 border=0 cellpadding=1 cellspacing=2 align=center>
			<tr>
				<td colspan=2 align=center><a href="../product/product.jsp?i=<%= id %>">
				<img src="../product/image/<%= photo %>" width=155 height=155 border=0></a></td>
			</tr>
			<tr>
				<td width=145><font color=blue>&nbsp;<a href="../product/product.jsp?i=<%= id %>">[<%=name%>]</a></font></td>
			</tr>
			<tr>
				<td>
				<c:set var="fmtPrice" value="<%=price%>"/>
				<font color=red>&nbsp;[<fmt:formatNumber value="${fmtPrice }" pattern="#,###" />&nbsp;원]</font>
				</td>
			</tr>  
			</table>
	    </td>
<%
	    }
       rs.close(); 
       stmt.close();
       pool.freeConnection("ora8", con);
      } catch (Exception e) {
	     out.println(e);
      }
%>
				</tr>
			</table>
		</td> 
	</tr>


	<!-- 베스트 상품 -->
<tr height=35>
		<div align=center ><td bgcolor=black><font color=white style="padding-left: 10px;'"><span style="font-weight:bold "size="4px"; align="center"; >베스트상품</span></font></div></td>
	</tr>
	<tr>
		<td bgcolor=#dddddd><img height=1 src="" width=1></td>
	</tr>
	<tr>
		<td>
			<table width=450 border=0 cellpadding=1 cellspacing=1>
				<tr>
<%
	try {
		String name,company_id,expression,photo;
		int id,price;
		DBConnectionManager pool = DBConnectionManager.getInstance();
		Connection con = pool.getConnection("ora8");
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select id,name,price,company_id,expression,photo from product where id between 9 and 11");
		int flag=0;
		while(rs.next()) {
			id=rs.getInt(1);
			name=rs.getString(2);
			price=rs.getInt(3);
			company_id=rs.getString(4);
			expression=rs.getString(5);
			photo=rs.getString(6);
%>
       <!-- 표시테이블 -->
		<td>
			<table width=300 border=0 cellpadding=1 cellspacing=2 align=center>
				<tr>
					<td colspan=2 align=center valign=top><a href="../product/product.jsp?i=<%= id %>">
						<img src="../product/image/<%=photo%>" width=155 height=155 border=0></a></td>
				</tr>
				<tr>
					<td width=300><font color=blue>&nbsp;<a href="../product/product.jsp?i=<%= id %>">[<%=name%>]</a></font></td>
				</tr>
				<tr>
				<td>
					<c:set var="fmtPrice" value="<%=price%>"/>
				<font color=red>&nbsp;[<fmt:formatNumber value="${fmtPrice }" pattern="#,###" />&nbsp;원]</font>
				</td>
				</tr>
			</table>
		</td>
<%
 	    }
        rs.close(); 
        stmt.close();	
        pool.freeConnection("ora8", con);    
       } catch (Exception e) {
          out.println(e);
       }
%>
				</tr>
			</table>
		</td>
	</tr>

<!--  최신 qna  -->
	<tr>
		<td>
			<script language="javascript">
				function readContents(articlenum){
					location.href ="../board/qnashow.jsp?qnaid="+articlenum;
				}
			</script>
<%
	try {
		DBConnectionManager pool = DBConnectionManager.getInstance();
		Connection con = pool.getConnection("ora8");
		Statement stmt=null;
		Statement stmt1=null;
		ResultSet rs=null;
		ResultSet rs1=null;
		stmt1=con.createStatement();
		rs1=stmt1.executeQuery("select qnaid,title,name,to_char(cdate,'yy-mm-dd') from qna where type='I' order by 1 desc" );
%>		
		<table border=0  cellpadding=0 cellspacing=0 height=35>
		<div align=center ><td bgcolor=black><font color=white style="padding-left: 10px;'"><span style="font-weight:bold "size="4px"; align="center"; >최근Q&A</span></font></div></td>
	
				<td colspan=2 align=right><a href="../board/qnashow.jsp?qnaid=1"><font color=blue>More...&nbsp;&nbsp;&nbsp;</font></a></b></td>
			</tr>
			<tr>
				<td colspan=3 bgcolor=#dddddd></td>
			</tr>
<%
			int stop=0;	
			while(rs1.next() && (stop<5)) { 
%>
			<tr height=21>
				<td align=left>&nbsp;<img src="../img/que.gif"> 
				<a href="javascript:readContents('<%=rs1.getInt(1)%>')"><%=rs1.getString(2)%></a></td>
				<td align=center><%=rs1.getString(3)%></td>
				<td align=center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=rs1.getString(4)%></td>
			</tr>
<%	
		stmt=con.createStatement();
		rs=stmt.executeQuery("select qnaid,title,name,to_char(cdate,'yy-mm-dd') from qna where type='R' and p_id ="+rs1.getInt(1)+" order by 1 desc" );
		while(rs.next()) { 
%>
			<tr height=21>
				<td align=left><img src="../img/answ1.gif">
				<a href="javascript:readContents('<%=rs.getInt(1)%>')"><%=rs.getString(2)%></a></td>
				<td align=center><%=rs.getString(3)%></td>
				<td align=center><%=rs.getString(4)%></td>
			</tr>
<%
			stop++;
		}
		stop++;
	}
		stmt.close();
        rs.close(); 
		stmt1.close();
		rs1.close();
	   pool.freeConnection("ora8", con); 
	} catch (Exception e) {
		out.println(e);
	}
%>
			</table>
		</td>
	</tr>
</table>
</td>

<!-- 추천상품(오른쪽 메뉴) -->
<td valign=top width=205>
<td valign=top width=205 style="padding-top: 20px;">
<table border=0 cellpadding=0 cellspacing=0 width=195>
	<tr><div align=center ><td><font color=gray style="padding-left: 10px;'"><span style="font-weight:bold "size="4px"; align="center"; >추천상품</span></font></div>
		<td align=right valign="top">&nbsp;</td>
	</tr>
</table>
<table border = 0 cellPadding=0 cellSpacing=0 width=170>
	<tr>
		<td colspan=3 width=141 height=1 bgcolor="#c4beb7">
	</tr>
<%
	try {
		String name,company_id,expression,photo,code;
		int id,price;
		DBConnectionManager pool = DBConnectionManager.getInstance();
		Connection con = pool.getConnection("ora8");
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select id,name,price,company_id,expression,photo,code from product where category between 34 and 35");
		while(rs.next()) {
			id=rs.getInt(1);	
			name=rs.getString(2);
			price=rs.getInt(3);
			company_id=rs.getString(4);
			expression=rs.getString(5);
			photo=rs.getString(6);
			code=rs.getString(7);
%>

<!-- 상품  테이블 표시-->
	<tr>
		<td rowspan=3 width=5><img src="" width=8 height=8 border=0></td>
		<td width=65 height=70 align=left valign=middle><A href="../product/product.jsp?i=<%= id %>">
          <img src="../product/image/<%= photo %>" width=82 height=100 border=0></A></td>
		<td width=100><a href="../product/product.jsp?i=<%= id %>">[<%= name %>]</a><br>
          <font color=red>&nbsp;[<fmt:formatNumber value="${fmtPrice }" pattern="#,###" />&nbsp;원]</font>
	</tr>
	<tr>
		<td colspan= 2 width=170><%= expression%></td>
	</tr>
	<tr>
		<td width=300 colspan=2 align=right>&nbsp;</td>
	</tr>
	<tr>
		<td colspan=3 width=170 height=1 bgcolor="#c4beb7"></td>
	<tr>
<%
		}
		rs.close(); 
		stmt.close();
		pool.freeConnection("ora8", con); 
	} catch (Exception e) {
		out.println(e);
	}
%>
	</table><br>
	</td>
	</tr>
</table>
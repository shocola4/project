<%@ page  import="java.sql.*,oracle.dbpool.*" contentType="text/html;charset=euc-kr" %>

<%!
     String b_name ,b_email,b_title,b_content,b_date,b_ip,mailto;
      int b_id , b_hit , ref=0 ;
 %>

<%
try {
      
   //DB풀 메니저 객체 생성 사용
   DBConnectionManager pool = DBConnectionManager.getInstance();
   Connection con = pool.getConnection("ora8");
     
   String bid=request.getParameter("b_id"); 

   Statement stmt = con.createStatement();
   stmt.executeUpdate("update re_board set b_hit=b_hit+1 where b_id="+bid+"");  //조회수를 올린다

   String sql="select b_id, b_name, b_email, b_title, b_content, to_char(b_date,'yy-mm-dd'),b_hit, b_ip, ref, step, anslevel, pwd  from re_board where b_id="+bid; 

   ResultSet rs = stmt.executeQuery(sql);  
   if(rs.next()) {   
      b_id=rs.getInt(1);
      b_name=rs.getString(2);
      b_email=rs.getString(3);
      b_title=rs.getString(4);
      b_content=rs.getString(5);
      b_date=rs.getString(6);
      b_hit=rs.getInt(7)+1;
      b_ip=rs.getString(8);
      ref = rs.getInt(9);  // 글 그룹
      if(!b_email.equals("")) {
         mailto="(<font size=2><a href=mailto:"+b_email+">"+b_email+"</a></font>)";
      } else {
         mailto="";
         }
   }
   rs.close(); 
   stmt.close();
   pool.freeConnection("ora8", con);
} catch (Exception e) {
	out.println(e);
}
%>	    

<html>
<head><title>컴퓨터전문쇼핑몰</title>
<link href="../common/u3.css" type=text/css rel=stylesheet>
</head>

<BODY leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>
    <jsp:include page="../common/basic_screen.jsp" flush="true"/>
  
  <table style="padding-left:600px; padding-top: 30px;">
  	<td colspan=3 align=middle height=8 >
	  <a href="javascript:history.go(-2)"><img src="img/b_list.gif" border=0></a>
	   	</td>
  </table>
  
  <br>
  <table border=0 width=685 height=30 >
	<tr>
		<td align=left><font size=6 color=#BDBDBD><b>◎게시물 읽기</b></td>
	</tr>
  </table>
  <br>
 
<table width="688" height="872" border="2" valign="middle" align="center" cellspacing="0" cellpadding="0" bordercolor=#E6E6E6>

	<tr>
	   <td width=80 height="35" align=center bgcolor="#7eaee9"><font color="#fffff">등록자</td>
	   <td width=90 bgcolor=ffffff>&nbsp;<%=b_name%></td>
	   <td width=100 height="35" align=center bgcolor="#7eaee9"><font color="#fffff">작성일</td>
	   <td width=160 bgcolor=ffffff>&nbsp;<%=b_date%>
	   </td>
	</tr>	
	<tr>
	   <td width=120 height="35" align=center bgcolor="#7eaee9"><font color="#fffff">E-mail 주소</td>
	   <td colspan=3 bgcolor=ffffff>&nbsp;
	        <a href="mailto:<%=b_email%>"><%=b_email%></a></td>
	</tr>	
	<tr>
	   <td align=center height="40" bgcolor="#7eaee9"><font color="#fffff">제 목</td>
	   <td colspan=3 bgcolor=ffffff>&nbsp;<%=b_title%></td>
	</tr>	
	<tr>
	   <td align=center bgcolor="#7eaee9" ><font color="#fffff">내 용</td>
	   <td colspan=3 bgcolor=ffffff>
	    <table>
	      <tr>
	         <textarea cols=70 rows=20  name="content" style="height:712;"><%=b_content%></textarea>
	      </tr>
	   </table>
	   </td>
	</tr>

    <tr border="0">
	   	<td colspan=4  align=right height=28 >
	   	  <a href="reply_form.jsp?b_id=<%=b_id%>"><img src="img/b_re.gif" border=0></a>
		  <a href="update_form.jsp?b_id=<%=b_id%>"><img src="img/b_modify.gif" border=0></a>
		  <a href="delete_confirm.jsp?b_id=<%=b_id%>"><img src="img/b_delete.gif" border=0></a>
		  <a href="mailform.jsp?b_id=<%=b_id%>"><img src="img/singo.png" border=0></a> 
		  
	   	</td>
	  </TR>
	</table>
	</center>
	
</body>
</html>
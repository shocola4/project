<%@ page contentType="text/html;charset=euc_kr" import="java.sql.*,oracle.dbpool.*,java.util.Date"  %>

<HTML>
	<HEAD>
		<TITLE>��ǻ���������θ�</TITLE>
		<script language=JavaScript src="../common/u3.js"></script>
		<link href="../common/u3.css" type=text/css rel=stylesheet>
	</HEAD>

<BODY leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
        <jsp:include page="../common/basic_screen.jsp" flush="true"/>
	
<!-- �������� ��� ��� -->
<center><br>
	  
 <table border=1 width=650 height=50 bordercolor=#BDBDBD>
	<tr>
		<td align="left"  bordercolor=white valign="top"  style="height: 50px;border-left-width: 1; border-top-width: 5;padding-left: 4px padding-top: 10px"><font size="5" color="#BDBDBD"><b>�� �� �� ��</b></td>
	</tr>
  </table><br>

  <table border=0 cellpadding=0 cellspacing=0 width=650>
    <tr>
       <td>
	    <table width=650 border=1 cellpadding=0 cellspacing=1 border color=639cce>
		<tr height="50">
	<td width=70 align="center"bgcolor="#7EAEE9"><font size="3" color="#fffff" >��ȣ</font></td>
			<td width=230  align="center" bgcolor="#7EAEE9" ><font size="3" color="#fffff" >����</font></td>
			<td width=120 align="center"bgcolor="#7EAEE9"><font size="3" color="#fffff" >��¥</font></td>
       <td width=60 align="center"bgcolor="#7EAEE9"><font size="3" color="#fffff" >��ȸ</font></td>
		</tr>
<%
try {
	String title,body,cdate;
	String today=""; /*new */
	int idnum,hits;
	int datacount=0;
	int pagecount;

   DBConnectionManager pool = DBConnectionManager.getInstance();
   Connection con = pool.getConnection("ora8"); 

   Statement stmt=con.createStatement();

   /* ����¡ ����  */
   ResultSet rs=stmt.executeQuery("select count(idnum) from notice");
   if(rs.next()) {
      datacount=rs.getInt(1);  /* �� �ۼ� */
   }
   rs.close();

	int pagesize=10;
	pagecount=datacount%pagesize;
	if(pagecount==0){
		pagecount=datacount/pagesize;
	} else {
		pagecount=datacount/pagesize+1;
	}
	int mypage=1;
	int abpage=1;
	if(request.getParameter("mypage")!=null){
		mypage=Integer.parseInt(request.getParameter("mypage"));
		abpage=(mypage-1)*pagesize+1;
		if(abpage <=0) abpage=1;
		}

/*------- ����¡ �� ------- */

	ResultSet rs1=stmt.executeQuery("select idnum,title,body,to_char(cdate,'yy-mm-dd'),hits from notice order by idnum desc");
      
	for(int k=1; k<abpage; k++)rs.next();
	int k=1;
	while(rs1.next() && k<=pagesize) {
        idnum=rs1.getInt(1);   /* �۹�ȣ */
		title=rs1.getString(2);  /* ������ */
		body=rs1.getString(3);  /* �۳��� */
		cdate=rs1.getString(4); /* �� �Է� �ð� */
		hits=rs1.getInt(5); /* ������ ��ȸ�� */
        k++;
%>
	<tr height="30" onMouseOver=this.style.backgroundColor='#fff8de'  onMouseOut=this.style.backgroundColor='#ffffff'>
		<td width=50 align="left"  style="padding-left:12px;"><p><%=idnum%></td>
		<td width=290 align=left><p>&nbsp;
		<a href="gongji_view.jsp?bid=<%=idnum%>"><%=title%>&nbsp;</a></td>
		
		<td width=120 align=center><p><%=cdate%></td>
		<td width=40 align=center><p><%=hits%></td>
	</tr>
<%
	}
	rs.close();
    rs1.close();
	stmt.close();	
	 pool.freeConnection("ora8", con); 
%>

   </table></td>
  </tr>
</table></div><br>
<p align="center"><font size=2>

<%
	int gopage=1;
	if(mypage !=1) {
		gopage=mypage-1;
		out.println("<a href=gongji.jsp?mypage="+gopage+"><<����</a> ");
	} else {
		out.println("<<����");
	}

	if(mypage!=pagecount) {
	   gopage=mypage+1;
	   out.println("<a href=gongji.jsp?mypage="+gopage+">����>></a> ");
    } else {
	   out.println("����>>");
    }
   
   } catch(Exception e) {
	  out.println(e);
   }
%>

</center>  
	  
<!--  �������� ��� ��� ��   -->

</body>
</html>
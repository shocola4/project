<%@ page language="java" import="java.sql.*,oracle.dbpool.*"  contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
<head>
  <title>컴퓨터전문쇼핑몰</title>
  <link href="../common/u3.css" type=text/css rel=stylesheet>

<script language=javascript src="../common/u3.js"></script>
</head>

<body leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
<jsp:include page="../common/basic_screen.jsp" flush="true"/>

<!-- 상품상세정보 표시 -->
<%
	int productid = 0;
	String name,company_id,expression,photo,category,cdate;
	int id,price,code;

	Statement stmt=null;
	ResultSet rs=null;

	DBConnectionManager pool = DBConnectionManager.getInstance();
	Connection con = pool.getConnection("ora8");
    
	try {
		 productid = Integer.parseInt(request.getParameter("i"));
		String pid= (String)session.getAttribute("pid");
	
		String sql1="select id,name,price,company_id,expression,photo,cname,code,cdate from product_view where id ="+ productid;
		stmt=con.createStatement();
		rs=stmt.executeQuery(sql1);
		while(rs.next()) {
			id = rs.getInt(1);
			name = rs.getString(2);
			price = rs.getInt(3);
			company_id = rs.getString(4);
			expression = rs.getString(5);
			photo = rs.getString(6);
			category = rs.getString(7);
			code = rs.getInt(8);
			cdate = rs.getString(9);
%>

<br>
<table border=0 cellpadding=0 cellspacing=0 width=688 align=center>
	<tr >
		<td height=50 align=middle ><font size=6 color=#BDBDBD><b>●<%=name%>●상세 상품 정보</b></font></td>
	</tr>
</table>
<br><br>
	
<table border=1 align=center cellpadding=0 cellspacing=0 width=600>
 <tbody> 
    <tr> 
      <td valign=top> 
      <table border=3 align=left cellpadding=0 cellspacing=0 width=200 bgcolor=#E0F2F7>
 <tbody> 
    <tr> 
      <td > 
        <table border=2 cellpadding=0 cellspacing=0 width=200 bordercolor>
          <tr> 
            <td valign=top><img border=0 name=picmedium height=400 width=400 src="../product/image/<%=photo%>"></td>
          </tr>
         </table>
      </td>
      
    

      <td> 
        <table border=1 cellspacing=0 width=400 height="555" valign=top bordercolor=white>
          <tr> 
              <td colspan=2 align=center  bgcolor=#EFFBFB width=400 height=60 ><font size=3><b><%=name%></b></font></td>
		 </tr>
		 </tr>
            <tr height=12> 
            <td> </td>
          </tr>
          <tr>
                  <td width=90 height="40"  bgcolor=#EFFBFB>&nbsp; 상품분류</td>
                  <td width=280 height="40"  >&nbsp;[<%= category %>]</td>
          </tr>
          </tr>
            <tr height=12> 
            <td> </td>
          </tr>
          <tr>
                  <td width=90 height="40" bgcolor=#EFFBFB >&nbsp; 가       격</td>
                  <td width=280 height="40">
                  	<c:set var="fmtPrice" value="<%=price%>"/>
					&nbsp;<fmt:formatNumber value="${fmtPrice }" pattern="#,###" />원
                  </td>
          </tr>
          </tr>
            <tr height=12> 
            <td> </td>
          </tr>
           <tr> 
                  <td bgcolor=#EFFBFB>&nbsp; 제조 회사</td>
                  <td>&nbsp;<%= company_id %></td>
          </tr>
          </tr>
            <tr height=12> 
            <td> </td>
          </tr>
          <tr> 
                  <td bgcolor=#EFFBFB>&nbsp; 상품 코드</td>
                  <td>&nbsp;<%= code %></td>
           </tr>
           </tr>
            <tr height=12> 
            <td> </td>
          </tr>
            <tr> 
                  <td bgcolor=#EFFBFB>&nbsp; 등  록  일</td>
                  <td>&nbsp;<%= cdate %></td>
           </tr>
            <tr height=12> 
            <td> </td>
          </tr>
          <tr> 
            <td  bgcolor=#EFFBFB>&nbsp; 상세 설명</td>
            <td>&nbsp;<%= expression %></td>
          </tr>
      
        </table>
        <tr>
            <td height=50 ><img src="../img/b_white_1.gif"></td>
            <td align=right><a  href="../product/check.jsp?productnum=<%= productid %>"><img src="../img/basket_1.gif"></a>
          </tr>
      </td>
    </tr>
    </tbody> 
</table>

<%}
	rs.close();
	} catch (Exception e)
	{System.out.println(e);
	} finally{
	if (stmt != null) stmt.close();
	if (con != null) {
		 pool.freeConnection("ora8", con);
		}
}%>
<!-- 상품상세정보 표시 끝 -->
</body>
</html>
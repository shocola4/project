<%@ page  import="java.sql.*,oracle.dbpool.*" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="org.apache.log4j.*" %>

<%! 
	static Logger logger = Logger.getLogger("show2.jsp"); 
%>


<html>
<head>
  <title>컴퓨터전문쇼핑몰</title>
  <link href="../common/u3.css" type=text/css rel=stylesheet>

<script type="javascript" src="../common/u3.js"></script>

<script type="text/javascript">

	function go_update()
	{
	 	if(document.mform.name.value == "") {
			alert("상품명을 입력하세요");
			document.mform.name.focus();
			return;
		}
	 	
	 	if(document.mform.category.value == "") {
			alert("카테고리를 선택하세요");
			return;
		}
	 	
	 	if(document.mform.price.value == "") {
			alert("가격을 입력하세요");
			document.mform.price.focus();
			return;
		}
	 	
	 	if(document.mform.company_id.value == "") {
			alert("회사명을 입력하세요");
			document.mform.company_id.focus();
			return;
		}
	 	
	 	if(document.mform.expression.value == "") {
			alert("상세설명을 입력하세요");
			document.mform.expression.focus();
			return;
		}
	 		
	 	document.mform.submit();
	}

</script>


</head>

<body leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
<jsp:include page="../common/basic_screen.jsp" flush="true"/>

<!-- 상품상세정보 표시 -->
<%
	int productid = 0, id, price, code, category;
	String name,company_id,expression,photo,cdate, pass;

	Statement stmt = null;
	//Statement stmt2 = null;
	ResultSet rs = null;

	DBConnectionManager pool = DBConnectionManager.getInstance();
	Connection con = pool.getConnection("ora8");
    
	try {
		 String pid = (String)session.getAttribute("pid");
		 productid = Integer.parseInt(request.getParameter("b_id"));
		 String sql1 ="select id,name,price,company_id,expression,photo,category,code,cdate,pass from product_view where id ="+ productid;
		 stmt = con.createStatement();
		 rs = stmt.executeQuery(sql1);
		 
		 while(rs.next()) {
			id = rs.getInt(1);
			name = rs.getString(2);
			price = rs.getInt(3);
			company_id = rs.getString(4);
			expression = rs.getString(5);
			photo = rs.getString(6);
			category = rs.getInt(7);
			code = rs.getInt(8);
			cdate = rs.getString(9);
			pass = rs.getString(10);
			
			logger.info("상품정보 pass값:" + pass);
%>


<form name=mform method=post action="update2.jsp" >
<br><br>
<table border=0 cellpadding=0 cellspacing=0 width=605 align=center>
   <tr bgcolor=#7aaad5 height=30>
       <td  colspan=3 align=center bgcolor="#0000ff"><font color="#ffffff"><b> [수정]<%= name %>상세 상품 정보</b></font></td>
  </tr>
</table><br>
	
<table border=1 align=center cellpadding=0 cellspacing=0 width=600>
 <tbody> 
    <tr> 
      <td valign=top> 
        <table border=0 cellpadding=0 cellspacing=0 width=200>
          <tr> 
            <td valign=top><img border=0 name=picmedium height=200 width=200 src="../product/image/<%=photo%>"></td>
          </tr>
         </table>
      </td>

      <td> 
        <table border=1 cellpadding=0 cellspacing=0 width=400>
          <tr> 
              <td width=90>&nbsp; 상품명</td>
              <td width=280>&nbsp;<input type="text" name="name" value="<%=name%>"/></td>
		 </tr>
          <tr>
                  <td width=90>&nbsp; 상품분류</td>
                  <td width=280>           
                  	&nbsp;<select name="category">
						<option value="1" <% if(category == 1)  { %>selected<%}%>>CPU</option>
						<option value="2" <% if(category == 2)  { %>selected<%}%>>RAM</option>
						<option value="3" <% if(category == 3)  { %>selected<%}%>>MAINBOARD</option>
						<option value="4" <% if(category == 4)  { %>selected<%}%>>HDD_FDD</option>
						<option value="5" <% if(category == 5)  { %>selected<%}%>>VGA</option>
						<option value="6" <% if(category == 6)  { %>selected<%}%>>SOUND</option>
						<option value="7" <% if(category == 7)  { %>selected<%}%>>MONITOR</option>
						<option value="8" <% if(category == 8)  { %>selected<%}%>>CDROM</option>
						<option value="9" <% if(category == 9)  { %>selected<%}%>>COOLER</option>
						<option value="10" <% if(category == 10)  { %>selected<%}%>>MOUSE</option>
						<option value="11" <% if(category == 11)  { %>selected<%}%>>CASE</option>
						<option value="12" <% if(category == 12)  { %>selected<%}%>>POWER</option>
						<option value="13" <% if(category == 13)  { %>selected<%}%>>KEYBOARD</option>
						<option value="14" <% if(category == 14)  { %>selected<%}%>>NETWORK</option>
						<option value="15" <% if(category == 15)  { %>selected<%}%>>SPEAKER</option>
						<option value="16" <% if(category == 16)  { %>selected<%}%>>SCANNER</option>
						<option value="17" <% if(category == 17)  { %>selected<%}%>>PRINTER</option>
						<option value="18" <% if(category == 18)  { %>selected<%}%>>PC CAMERA</option>
						<option value="19" <% if(category == 19)  { %>selected<%}%>>CD</option>
						<option value="20" <% if(category == 20)  { %>selected<%}%>>CD CASE</option>
						<option value="21" <% if(category == 21)  { %>selected<%}%>>INK</option>
						<option value="22" <% if(category == 22)  { %>selected<%}%>>DESK</option>
						<option value="23" <% if(category == 23)  { %>selected<%}%>>BRAND PC</option>
						<option value="24" <% if(category == 24)  { %>selected<%}%>>NOTEBOOK</option>
						<option value="25" <% if(category == 25)  { %>selected<%}%>>NOTEBOOK ETC</option>
						<option value="26" <% if(category == 26)  { %>selected<%}%>>Share</option>
						<option value="27" <% if(category == 27)  { %>selected<%}%>>INTERNET SHARE</option>
						<option value="28" <% if(category == 28)  { %>selected<%}%>>LANCARD</option>
						<option value="29" <% if(category == 29)  { %>selected<%}%>>Gender</option>
						<option value="30" <% if(category == 30)  { %>selected<%}%>>OS</option>
						<option value="31" <% if(category == 31)  { %>selected<%}%>>TOOL</option>
						<option value="32" <% if(category == 32)  { %>selected<%}%>>Graphic</option>
						<option value="33" <% if(category == 33)  { %>selected<%}%>>OFFICE</option>
						<option value="34" <% if(category == 34)  { %>selected<%}%>>DIGITAL CAMERA</option>
						<option value="35" <% if(category == 35)  { %>selected<%}%>>PC CAMERA2</option>
						<option value="36" <% if(category == 36)  { %>selected<%}%>>CAMERA ETC</option>
						<option value="37" <% if(category == 37)  { %>selected<%}%>>PDA</option>
						<option value="38" <% if(category == 38)  { %>selected<%}%>>PDA ETC</option>
						<option value="39" <% if(category == 39)  { %>selected<%}%>>MP3 Player</option>
						<option value="40" <% if(category == 40)  { %>selected<%}%>>중고물품</option>
  				</select>   
                  </td>
          </tr>
          <tr>
                  <td width=90>&nbsp; 가       격</td>
                  <td width=280>
                  	&nbsp;<input type="text" name="price" value="<%=price%>"/>
					원
                  </td>
          </tr>
           <tr> 
                  <td>&nbsp; 제조 회사</td>
                  <td>&nbsp;<input type="text" name="company_id" value="<%= company_id %>"></td>
          </tr>
          <tr> 
                  <td>&nbsp; 상품 코드</td>
                  <td>&nbsp;<%= code %></td>
           </tr>
            <tr> 
                  <td>&nbsp; 등  록  일</td>
                  <td>&nbsp;<%= cdate %></td>
           </tr>
          <tr> 
            <td>&nbsp; 상세 설명</td>
            <td>&nbsp;<input type="text" name="expression" value="<%= expression %>" size="40"></td>
          </tr>
          <tr> 
	   		<td colspan=2 valign="bottom" align=right height=40 >
	
		     <a href="javascript:go_update()"><img src="img/b_edit.gif" border=0></a>
		     <a href="javascript:history.go(-2)"><img src="img/b_cancel.gif" border=0></a>


	   		</td>
	  	</tr>
        </table>
      </td>
    </tr>
    </tbody> 
</table>
    
	<input type="hidden" name="b_id" value="<%=productid%>">

</form>
<%
	}
		rs.close();
	} catch (Exception e){
		System.out.println(e);
	} finally{
		if (stmt != null) 
			stmt.close();
	
		if (con != null) {
		 	pool.freeConnection("ora8", con);
		}
	}
%>
<!-- 상품상세정보 표시 끝 -->

</body>
</html>
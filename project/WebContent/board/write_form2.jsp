<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="myutil.MultiPart" %>
<%@ page import="java.net.URLEncoder" %>


<%
	String member = (String)session.getAttribute("pid"); 
%>


	<html>
	<head><title>컴퓨터전문쇼핑몰</title>
		<LINK href="../common/u3.css" type=text/css rel=STYLESHEET>
	
	<script>
	function writeCheck() {
		
		if(!document.bbs_form.price.value){
			alert("가격을 입력하세요.");
			document.bbs_form.price.focus();
			return ;
		}
		
		document.bbs_form.submit();
	}
	</script>
	</head>

<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>
    <jsp:include page="../common/basic_screen.jsp" flush="true"/>

<br>
<form name=bbs_form method="post" action="write2.jsp" enctype="multipart/form-data">
	  <table border=1 width=550 height=30 bordercolor=black>
		<tr>
			<td align=center bgcolor=#E68D8D><font size=3 color=#FFFFFF><b>상품 등록</b></td>
		</tr>
	  </table>
	  <br>
<table width=550 border=1>
	<tr>
	   <td width=100 align=center bgcolor="#E68D8D">카테고리</td>
	   <td width=170>&nbsp;
	   			<select name="category">
						<option value="1">CPU</option>
						<option value="2">RAM</option>
						<option value="3">MAINBOARD</option>
						<option value="4">HDD_FDD</option>
						<option value="5">VGA</option>
						<option value="6">SOUND</option>
						<option value="7">MONITOR</option>
						<option value="8">CDROM</option>
						<option value="9">COOLER</option>
						<option value="10">MOUSE</option>
						<option value="11">CASE</option>
						<option value="12">POWER</option>
						<option value="13">KEYBOARD</option>
						<option value="14">NETWORK</option>
						<option value="15">SPEAKER</option>
						<option value="16">SCANNER</option>
						<option value="17">PRINTER</option>
						<option value="18">PC CAMERA</option>
						<option value="19">CD</option>
						<option value="20">CD CASE</option>
						<option value="21">INK</option>
						<option value="22">DESK</option>
						<option value="23">BRAND PC</option>
						<option value="24">NOTEBOOK</option>
						<option value="25">NOTEBOOK ETC</option>
						<option value="26">Share</option>
						<option value="27">INTERNET SHARE</option>
						<option value="28">LANCARD</option>
						<option value="29">Gender</option>
						<option value="30">OS</option>
						<option value="31">TOOL</option>
						<option value="32">Graphic</option>
						<option value="33">OFFICE</option>
						<option value="34">DIGITAL CAMERA</option>
						<option value="35">PC CAMERA2</option>
						<option value="36">CAMERA ETC</option>
						<option value="37">PDA</option>
						<option value="38">PDA ETC</option>
						<option value="39">MP3 Player</option>
						<option value="40">중고물품</option>
  				</select> </td>
  				
<%--  				
		<c:forEach var="item" items="${List}" varStatus="status">
			<option value="${item.id}">${item.nm}</option>
		</c:forEach>

   --%>				
	   <td width=100 align=center bgcolor="#E68D8D">판매가격</td>
	   <td width=170>&nbsp;<input type="text" name="price" size=15 value=""></td>
	</tr>	
	<tr>
	   <td width=100 align=center bgcolor="#E68D8D">판매자ID</td>
	   <td width=170>&nbsp;<input type="text" name="code" size=20 value="<%=member%>" readonly="readonly"></td>
	   <td width=100 align=center bgcolor="#E68D8D">비밀번호</td>
	   <td width=170>&nbsp;<input type="password" name="pwd" size=15 value=""></td>
	</tr>	
	<tr>
	   <td width=100 align=center bgcolor="#E68D8D">연락처</td>
	   <td width=170>&nbsp;<input type="text" name="" size=20></td>
	   <td width=100 align=center bgcolor="#E68D8D">제조사</td>
	   <td width=170>&nbsp;<input type="text" name="company_id" size=15 value=""></td>
	</tr>
	<tr>
		<td width=100 align=center bgcolor="#E68D8D">파일첨부</td>
		<td  colspan=3>&nbsp;<input type="file" name="upload_file"></td>
	</tr>	
	<tr>
	   <td align=center bgcolor="#E68D8D">상품명</td>
	   <td colspan=3>&nbsp;<input type="text" name="name" size=40></td>
	</tr>	
	   <td align=center bgcolor="#E68D8D">상품정보</td>
	   <td colspan=3>
   <table>
      <tr>
         <td><textarea cols=60 rows=15 name="expression"></textarea></td>
      </tr>
   </table>
	  <tr>
	   	<td colspan=4 align=right height=25>
		  <a href="javascript:writeCheck()"><img src="img/b_save.gif" border=0></a>
		  <a href="javascript:history.go(-1)"><img src="img/b_cancel.gif" border=0></a>
	   	</td>
	  </TR>

</TABLE>
</form>

		
	</body>
	</html>

	<%@ page contentType="text/html; charset=KSC5601" %>

	<html>
	<head><title>컴퓨터전문쇼핑몰</title>
		<LINK href="../common/u3.css" type=text/css rel=STYLESHEET>
	
	<script>
	function writeCheck() {
		if(!document.bbs_form.b_title.value){
			alert("제목을 입력하세요.");
			document.bbs_form.b_title.focus();
			return ;
		}
	
		if(!document.bbs_form.pwd.value) {
			alert("비밀번호를 입력하세요.");
			document.bbs_form.pwd.focus();
			return ;
		}

		if(!document.bbs_form.b_name.value){
			alert("이름을 입력하세요");
			document.bbs_form.b_name.focus();
			return ;
		}

		if(!document.bbs_form.b_content.value){
			alert("내용을 입력하세요.");
			document.bbs_form.b_content.focus();
			return;
		}
		document.bbs_form.submit();
	}
	</script>
	</head>

<body leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>
    <jsp:include page="../common/basic_screen.jsp" flush="true"/>

<br>
<form name=bbs_form method=post action="write.jsp">
	  <table align=left border=1 width=550 height=90 bordercolor=black>
		<tr>
			<td align=left bgcolor=0063ce><font size=5 color=#FFFFFF><b>게시물 올리기</b></td>
		</tr>
	  </table>
	  <br>
<table  height=90 >
		<tr>
			<td ></td>
		</tr>
	  </table>	  
	  
<table width=722 border=1 height=925>
	<tr>
	   <td width=100 height=45 align=center bgcolor="#7eaee9">등록자</td>
	   <td width=225>&nbsp;<input type="text" name="b_name" size=25 value=""></td>
	   <td width=116 height=40 align=center bgcolor="#7eaee9">비밀번호</td>
	   <td width=146>&nbsp;<input type="password" name="pwd" size=17 value=""></td>
	</tr>	
	<tr>
	   <td width=100 height=50 align=center bgcolor="#7eaee9">e-mail</td>
	   <td  colspan=3>&nbsp;<input type="text" name="b_email" size=30></td>
	</tr>	
	<tr>
	   <td align=center height=50 bgcolor="#7eaee9">제 목</td>
	   <td colspan=3>&nbsp;<input type="text" name="b_title" size=72></td>
	</tr>	
	   <td align=center bgcolor="#7eaee9">내 용</td>
	   <td colspan=3>
   <table align="center">
      <tr >
         <td><textarea  cols=67 rows=70 name="b_content"></textarea></td>
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

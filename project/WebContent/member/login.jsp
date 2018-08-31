<%@ page contentType="text/html;charset=EUC_KR"%>
<HTML>
<HEAD>
<TITLE>로그온폼</TITLE>
<LINK href="../common/u3.css" type=text/css rel=STYLESHEET>
<script language="JavaScript">
	function checkInput() {
		if (document.fname.uid.value == "") {
			alert("ID를 입력하세요");
			document.fname.uid.focus();
			return;
		}

		if (document.fname.pwd.value == "") {
			alert("비밀번호를 입력하세요");
			document.fname.pwd.focus();
			return;
		}
		
		document.fname.submit();
	}
	
</script>
</HEAD>

<BODY leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>
	<jsp:include page="../common/basic_screen.jsp" flush="true" />

	<!--상단테이블과 메뉴테이블 끝-->


<center>
<br>
<BODY bgcolor=" #EFF8FB">

	<table  align="center"  width=620 height=38 >
		<tr>
			<td align="left" ><font size=10 color=#BDBDBD ><b>-- 로그인 -- </b></td>
		</tr>
	</table>
</center>

&nbsp;	
		<form name="fname" method="post" action="login_ok.jsp">
			<table width="620" border="3" cellspacing="0" cellpadding="0" bordercolor="#EEEEE0"
				height="279">
			
				<tr bgcolor="#ffffff">
					<td align=center bgcolor="#eff4f8" height="120">
						<table width="250" height=225 border="0" cellspacing="0" cellpadding="1">
							<tr>
								<td width="100" nowrap><font size=3>아이디</td>
								<td width="289" height=100>
					<input type="text" name="uid" size="16" maxlength="20" value="" style="width:339;  height: 36px;" onkeypress="if(event.keyCode==13) {checkInput(); return false;}"></td>
							</tr>
							<tr>
								<td width="100" nowrap><font size=3>비밀번호</td>
								<td width="300" ><input type=password name="pwd" size="16" maxlength="20" value=""
									style="width:339;  height: 36px;" onkeypress="if(event.keyCode==13) {checkInput(); return false;}"></td>
							</tr>
							<tr height=10 valign="top">
								<td></td>
								<td align=center  style="padding-right: 35px">
								<input type="button" value="로그인" onclick="checkInput();" style="
                                    margin-right: 10px;">
									<input type="reset" value="취 소"></td>
							</tr>
						</table>
					</td>
				</tr>
				
			</table>
			<table>
			<tr>
					<td bgcolor="#ffffff" align=center style="padding-left: 40px" height="120">
						
							<a href="id_find.jsp"><font color="#BDBDBD">아이디 찾기</font></a>&nbsp;|
							
						
							<a href="pw_find.jsp"><font color="#BDBDBD">비밀번호 찾기</font></a>&nbsp;|
							
							
						
							 <a href="user.jsp"><font color="#BDBDBD">회원가입</font></a>
							<br>
							<br>
							<br>
						
					</td>
				</tr>
			</table>
		</form>
	</center>
	<!-- table END-->
</body>
</html>


<%@ page contentType="text/html;charset=EUC_KR"%>
<HTML>
<HEAD>
<TITLE>�α׿���</TITLE>
<LINK href="../common/u3.css" type=text/css rel=STYLESHEET>
<script language="JavaScript">
	function checkInput() {
		if (document.fname.uid.value == "") {
			alert("ID�� �Է��ϼ���");
			document.fname.uid.focus();
			return;
		}

		if (document.fname.pwd.value == "") {
			alert("��й�ȣ�� �Է��ϼ���");
			document.fname.pwd.focus();
			return;
		}
		
		document.fname.submit();
	}
	
</script>
</HEAD>

<BODY leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>
	<jsp:include page="../common/basic_screen.jsp" flush="true" />

	<!--������̺�� �޴����̺� ��-->


<center>
<br>
<BODY bgcolor=" #EFF8FB">

	<table  align="center"  width=620 height=38 >
		<tr>
			<td align="left" ><font size=10 color=#BDBDBD ><b>-- �α��� -- </b></td>
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
								<td width="100" nowrap><font size=3>���̵�</td>
								<td width="289" height=100>
					<input type="text" name="uid" size="16" maxlength="20" value="" style="width:339;  height: 36px;" onkeypress="if(event.keyCode==13) {checkInput(); return false;}"></td>
							</tr>
							<tr>
								<td width="100" nowrap><font size=3>��й�ȣ</td>
								<td width="300" ><input type=password name="pwd" size="16" maxlength="20" value=""
									style="width:339;  height: 36px;" onkeypress="if(event.keyCode==13) {checkInput(); return false;}"></td>
							</tr>
							<tr height=10 valign="top">
								<td></td>
								<td align=center  style="padding-right: 35px">
								<input type="button" value="�α���" onclick="checkInput();" style="
                                    margin-right: 10px;">
									<input type="reset" value="�� ��"></td>
							</tr>
						</table>
					</td>
				</tr>
				
			</table>
			<table>
			<tr>
					<td bgcolor="#ffffff" align=center style="padding-left: 40px" height="120">
						
							<a href="id_find.jsp"><font color="#BDBDBD">���̵� ã��</font></a>&nbsp;|
							
						
							<a href="pw_find.jsp"><font color="#BDBDBD">��й�ȣ ã��</font></a>&nbsp;|
							
							
						
							 <a href="user.jsp"><font color="#BDBDBD">ȸ������</font></a>
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


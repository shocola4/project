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



<BODY bgcolor="#EEEEE0">

	<table  align="center" bgcolor=#FAFAFA border="2" width=620 >
		<tr>
			<td align="left" ><font size=2 color=gray><b>ȸ������ �α��� </b></td>
		</tr>
	</table>

	
		<form name="fname" method="post" action="login_ok.jsp">
			<table width="620" border="1" cellspacing="0" cellpadding="0"
				height="25">
			
				<tr bgcolor="#ffffff">
					<td align=center bgcolor="#eff4f8" height="120">
						<table width="250" border="0" cellspacing="0" cellpadding="1">
							<tr>
								<td width="55" nowrap>���̵�</td>
								<td width="175"><input type=text name="uid" size="16" value="jmkim"
									maxlength=16 style="width:155" onkeypress="if(event.keyCode==13) {checkInput(); return false;}"></td>
							</tr>
							<tr>
								<td nowrap>��й�ȣ</td>
								<td><input type=password name="pwd" size="14" maxlength="16" value="1234"
									style="width:155" onkeypress="if(event.keyCode==13) {checkInput(); return false;}"></td>
							</tr>
							<tr height=40 valign=bottom>
								<td></td>
								<td align=center><input type="button" value="�α���"
									OnClick="checkInput();"><input type="reset" value="�� ��"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td bgcolor="#ffffff" align=center height="120">
						<p>
							���̵�(ID)�� �н����带 �Է��ϼ���!!!.<br>
							<br>
						<p>
							���̵� ������ ���� <a href="user.jsp"><font color="#ff7508">ȸ������</font></a>��
							�Ͻñ� �ٶ��ϴ�.<br>
							<br>
							<br>
						</p>
					</td>
				</tr>
			</table>
		</form>
	</center>
	<!-- table END-->
	<%-- <jsp:include page="../common/basic_copyright.jsp" flush="true" /> --%>
</body>
</html>


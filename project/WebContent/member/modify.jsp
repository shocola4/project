<%@ page contentType="text/html;charset=EUC_KR"  %>

<%
      if( session.getAttribute("pid") == null) {
%>
	<script language="Javascript">
	   alert("�α����� �ϼ���")
	   location.href="../member/login.jsp";
    </script>
<%
	} else {
%>

<html>
<head>
  <title>��ǻ���������θ�</title>
  <link href="../common/u3.css" type=text/css rel=stylesheet>
<SCRIPT language=JavaScript src="../common/u3.js"></script>
</head>

<BODY leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>
    <jsp:include page="../common/basic_screen.jsp" flush="true"/>
	<jsp:include page="update_form.jsp" flush="true"/>

</body>
</html>
<%
}
%>
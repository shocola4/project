<%@ page import="java.sql.*,oracle.dbpool.*" contentType="text/html;charset=euc-kr" %>
<%
	try{
		DBConnectionManager pool = DBConnectionManager.getInstance();
		Connection con = pool.getConnection("ora8");
		String uid="", pwd="", name="";
		String mem_uid = request.getParameter("uid"); 
		String mem_pwd = request.getParameter("pwd");
		String sql = "select m_uid, m_pwd, m_name from member where m_uid ='" + mem_uid +"'"; 
		
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);

		if(rs.next()) {
			
			uid = rs.getString(1);
			pwd = rs.getString(2);
			name = rs.getString(3);
			System.out.println("@@@@@@@@ ID ��ȸȮ�� ");
			
		} else{
			
			System.out.println("!!!!!!!!! ID ������ ȸ������");
 %>

			<script language="JavaScript"> 
				alert("��ϵǾ� ���� ���� ���̵��Դϴ�.");
				history.go(-1); 
			</script>

 <% }
		
        if(uid.equals(mem_uid) && pwd.equals(mem_pwd)) {
			
		    session.setAttribute("pid",uid);	 //ȸ�����̵�
			session.setAttribute("pname",name);	 //ȸ�� �̸�
			session.setAttribute("pmember","y"); //ȸ�� ���� �ƴ���..

            // ���ø����̼� ���� ����. ���� ����� üũ��

			if( application.getAttribute("activecount") == null){
		
				Integer r1 = new Integer("1");
				application.setAttribute("activecount",r1);

			} else { 

				Integer r2 = (Integer)application.getAttribute("activecount");
			    int s = r2.intValue(); 
				Integer r3 = new Integer(++s);
			   application.setAttribute("activecount",r3);
			}			
			
			System.out.println("########### �α��� ����! ###########");
%>

			<script>
				alert("�α��� �Ǿ����ϴ�.");
				location.href="../main/index.jsp";	 
			</script>
				
<%		 
			//response.sendRedirect("../main/index.jsp");

		 } else if(uid.equals(mem_uid) && !pwd.equals(mem_pwd)) {

			 System.out.println("�α��� ���� - �н����� ����");
%>

			<script>
				alert("�н����尡 ��ġ���� �ʽ��ϴ�");
				history.go(-1); 
			</script>

<%
		}
		stmt.close();
		rs.close();
		pool.freeConnection("ora8", con); 

	} catch(Exception e) {

		out.println(e);
	}
	// response.sendRedirect("../main/index.jsp");
%>
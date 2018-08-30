<%@ page  import="java.sql.*,oracle.dbpool.*,java.util.*" contentType="text/html;charset=UTF-8" %>

<%@ page import="myutil.MultiPart"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="org.apache.log4j.*" %>

<%! 
	static Logger logger = Logger.getLogger("write.jsp"); 
%>
<% logger.info("WRITE.jsp start ~~~."); %>

<%
try {
	
    //DB풀 메니저 객체 생성 사용
	DBConnectionManager pool = DBConnectionManager.getInstance();
	Connection con = pool.getConnection("ora8");
	
	int b_id=0;
	//String b_name=makeKOR(request.getParameter("b_name"));
	
	request.setCharacterEncoding("UTF-8");
	
	///////////////////// 파일 업로드 시작 ////////////////
 	MultiPart multiPart = new MultiPart(request);
	String fileName = multiPart.getFileName("upload_file");
	String newPath = application.getRealPath("/product/image/" + fileName);
	multiPart.saveFile("upload_file", newPath); 
	
	
	//String b_name = request.getParameter("b_name");
	//String pwd = request.getParameter("pwd");
	//String b_email = request.getParameter("b_email");
	//String b_title = request.getParameter("b_title");
	//String b_content = request.getParameter("b_content");
	//String ip = request.getRemoteAddr(); // IP 알아내기
	
	String b_name = multiPart.getParameter("b_name");
	String pwd = multiPart.getParameter("pwd");
    String b_email = multiPart.getParameter("b_email");
	String b_title = multiPart.getParameter("b_title");
	String b_content = multiPart.getParameter("b_content");
	String photo = fileName;//이미지
	//String ip = request.getRemoteAddr(); // IP 알아내기
	String ip = "127.0.0.1";
	
 	//쿼리에 '가 들어가면 에러가 발생하므로 replace 처리해준다.
 	b_title = Replace(b_title,"'","''");
 	b_content = Replace(b_content,"'","''");
	/* 답변형에서 추가된 부분 */
	int maxref=0;  //DB 안에 들어 있는 가장 큰 글 그룹번호
    int ref=0;
    int step=0;
    int level=0;
    String sql = "select max(b_id),max(ref) from re_board2";
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery(sql);
	
	if(rs.next()) {
		b_id=rs.getInt(1); 
		b_id=b_id+1;    
   		maxref=rs.getInt(2); // 글 항목 최대값 반환
		rs.close();
	} else {
		b_id=1;   
	}
	logger.info("WRITE.jsp step1 ~~~.");
    if(multiPart.getParameter("b_id") != null) { 
    	ref=Integer.parseInt(multiPart.getParameter("ref"));
        step=Integer.parseInt(multiPart.getParameter("step"));
        level=Integer.parseInt(multiPart.getParameter("level"));
     	String str="update re_board2 set step=step+1 where ref="+ref+" and step > "+ step;
   		stmt.executeUpdate(str);
   		stmt.close();
        step=step+1;
        level=level+1;
	} else {
    	ref=maxref+1;
        step=0;
        level=0;
    }  
    
     logger.info("WRITE.jsp 내용 ~~~.");
    
			
/* 	
    if(request.getParameter("b_id") != null) { 
    	ref=Integer.parseInt(request.getParameter("ref"));
        step=Integer.parseInt(request.getParameter("step"));
        level=Integer.parseInt(request.getParameter("level"));
     	String str="update re_board set step=step+1 where ref="+ref+" and step > "+ step;
   		stmt.executeUpdate(str);
   		stmt.close();
        step=step+1;
        level=level+1;
	} else {
    	ref=maxref+1;
        step=0;
        level=0;
    }        
     */
    
     logger.info("WRITE.jsp step2 ~~~.");
     
	sql = "insert into re_board2 (B_ID, PWD, B_NAME, B_EMAIL, B_TITLE, B_CONTENT, B_HIT, B_IP, PHOTO, REF, STEP, ANSLEVEL, B_DATE )values(?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(1,b_id);
    pstmt.setString(2,pwd);
	pstmt.setString(3,b_name);
	pstmt.setString(4,b_email);
	pstmt.setString(5,b_title);
	pstmt.setString(6,b_content);
    pstmt.setInt(7,0);
    pstmt.setString(8,ip);
    pstmt.setString(9,photo);
    pstmt.setInt(10,ref);
    pstmt.setInt(11,step);
    pstmt.setInt(12,level);
	pstmt.executeUpdate();
	pstmt.close();
	pool.freeConnection("ora8", con); 
%>
<% logger.info("WRITE.jsp 내용 ~~~."); %>
	 <script language=javascript>
    location.href="Boarde_list.jsp";
     </script> 
<%
	} catch (Exception e) {
		out.println(e);
	}
%>

<%!
	
   String makeKOR(String str)throws java.io.UnsupportedEncodingException{
   String kor="";
   if (str==null) 
    kor=null;
   else
    kor=new String(str.getBytes("ISO-8859-1"),"UTF-8");
   return kor;
   }
	
	   // 개행 처리를 위한 메소드 
public static String Replace(String original, String oldString, String newString) {
 	for(int index = 0; (index = original.indexOf(oldString, index)) >= 0; index += newString.length())
    	original = original.substring(0, index) + newString + original.substring(index + oldString.length());
        return original;
}	
	   
	   
%>
<% logger.info("write.jsp end ~~~."); %>
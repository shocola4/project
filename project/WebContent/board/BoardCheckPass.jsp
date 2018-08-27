<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE script PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
   <head>
   
<title>게시글비밀번호</title>

<%String b_id = request.getParameter("b_id");%>
<%String b_pw = request.getParameter("b_pw");%>

	<script type="text/javascript">
		function checkPass(passValue){
		    var originPass = <%=b_pw%>
			var checkPass = passValue.value;
			
			if(originPass == checkPass){
			   location.href="show.jsp?b_id=<%= b_id %>";
			}else{
			  alert("패스워드가 일치하지 않습니다.");
			  history.go(-1); 
			}
		}		
	</script>
	</head>
<body>
    <div>
        <h1>비밀번호 확인</h1>
        <form action="BoardServlet" name="frm" method="get">
            <input type="hidden" name="command" value="board_check_pass">        
            <input type="hidden" name="b_id" value="${param.b_id}">
            
                <!--boardView.jsp의  "게시글 수정" 부분에
                onclick="open_win('BoardServlet?command=board_check_pass_form&num=${board.num}')
                부분에서 num값을 보낸것을 param(.$.{.}.EL에서 키를 지정하지않은 파라메타)으로 받는다 
                /> -->
        
            <table>
                <tr>
                    <th> 비밀번호 </th>
                    <td>
                        <input type="password" id="inputPassword" name="pass" size="20">
                    </td>
                </tr>
            </table>
            
            <input type="submit"  value="확인" onclick="return passCheck()">
            
            <a href="javascript:checkPass(document.getElementById('inputPassword'))">확인</a>
            ${message} 

            <!--  BoardCheckPassAction에 request영역의 
            setAttribyte로 ("message","비밀번호가 틀렸습니다.")의 키와 값을  
             주어 "비밀번호가 틀렸습니다 출력"-->

        </form>
    </div>
</body>
</html>





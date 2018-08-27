package controller.action;
 
import java.io.IOException;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import action.Action;
import pdh.DAO.BoardDAO;
import pdh.DAO.BoardVO;
 
public class BoardCheckPassAction implements Action{
 
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = null;
        
        String num = request.getParameter("b_id");
            //boardView.jsp에서 보낸 값을 
            //<input type="hidden" name="num" value="${param.num}">

        String pass = request.getParameter("pwd"); 
            //<input type="password" name="pass" size="20">
        
        BoardDAO bDao = BoardDAO.getInstance();
        
            //select * from boardtest1 where num = ? 상세보기 DAO에 
            //getParameter로 num값으로 찾은 bVo에 컬럼의 레코드값을 저장 
        

        if(bDao.getClass().equals(pass)){ // pass 성공시   
                                        // num로 찾은 bVo입력된 값의 pass가 request로 받은 pass값이 맞다면
            url = "../board/show.jsp";

        }else{// 실패시
            url= "../board/BoardCheckPass.jsp";
            request.setAttribute("message", "비밀번호가 틀렸습니다.");
                //boardCheckPass.jsp 의 ${message}키에 값을 뿌린다.
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher(url); //if 조건에 맞는 url 연결
        dispatcher.forward(request, response);
    }
 
    
}



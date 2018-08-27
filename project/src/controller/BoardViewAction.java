package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import pdh.DAO.BoardDAO;
import pdh.DAO.BoardVO;

//게시글 상세 보기 페이지로 이동하게 하는 액션 클래스
public class BoardViewAction implements Action {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "../board/BoardCheckPass.jsp";
        String u_id = request.getParameter("u_id"); //List.jsp(view)에서 request영역으로 보낸 num키의 값을 담는다. 
        
        BoardDAO bDao = BoardDAO.getInstance(); //BoardDAO를 사용할 싱글톤 bDao객체로 담는다.
        
  
            
        request.setAttribute("board",bDao); //request영역에 board키로 bVo값들을 저장
        
        RequestDispatcher dispatcher = request.getRequestDispatcher(url);
        dispatcher.forward(request, response);
        
    }
    
}


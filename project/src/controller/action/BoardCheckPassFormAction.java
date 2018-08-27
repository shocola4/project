package controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;



//비밀번호 입력 화면으로 이동하게 하는 액션 클래스
public class BoardCheckPassFormAction implements Action{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         String url = "../board/BoardCheckPass.jsp"; 
         
        RequestDispatcher dispatcher = request.getRequestDispatcher(url);     //boardCheckPass.jsp로 이동
        dispatcher.forward(request, response);
        }
    }


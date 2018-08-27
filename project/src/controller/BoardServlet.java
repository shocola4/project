package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionFactory;

@WebServlet("/BoardServlet")
public class BoardServlet extends HttpServlet {
private static final long serialVersionUID = 1L;

public BoardServlet() {
    super();
}

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String command = request.getParameter("command"); 
    System.out.println("BoardServlet 에서 요청을 받음을 확인 : "+command);



ActionFactory af = ActionFactory.getInstance(); 
   //ActionFactory의 getInstance에는 return instance가 들어있다 instance는 ActionFactory 객체화한 싱글톤이다.
        
        Action action = af.getAction(command); 
        //ActionFactory(af) 클래스에서 불러온 
        //Action클래스의 getAction의(String command)를 인자로 받던 것을  Action action으로 담는다.
        
        if(action != null){ //만일 action이 null이 아닐때 (action에 command 값이 들어와 있을때)
            action.execute(request, response);    //Action의 request와 response를 담아서 실행한다.

//execute - SQL문이 무엇인지 모를때 사용하고, 

//반환은 true이면 Result set객체에, false이면 결과가 없거나 갱신된 행의 수의 경우다.

        } 
    }



protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("UTF-8");
doGet(request, response);
}
}



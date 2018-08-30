package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
    //request영역의 request 와 response 를 사용을 인터페이스로 만든다.
}




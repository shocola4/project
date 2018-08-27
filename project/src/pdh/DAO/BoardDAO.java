package pdh.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class BoardDAO {
    //기본 생성자
    private BoardDAO(){}
    
    //싱글톤
    private static BoardDAO instance= new BoardDAO();
    public static BoardDAO getInstance(){
        return instance;
    }
    
  //=======================================================================비밀번호 확인
    //선택한 num값(게시글 번호)의 쿼리(pass)를 받아온것이 일치할때 BoardVO 값을 뿌린다.
    public BoardVO checkPassword(String pwd, String b_id) throws SQLException{
        String sql = "select * from re_board where pwd=? and b_id=?";
        //모두 컬럼값을 찾는데 Password와 num이 일치하는것을 찾는다.
        String url="jdbc:oracle:thin:@localhost:1521:orcl";
    	Connection conn = DriverManager.getConnection(url,"antman","12345");
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BoardVO bVo = null;
        try{
            conn = DriverManager.getConnection(url);
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, pwd);
            pstmt.setString(2, b_id); 
            //checkPassword(인자String num)가 가져온 num이라서 String 이다.
            
            rs = pstmt.executeQuery();//select 쿼리 실행한다.
            
            if(rs.next()){//next 전체를 읽을때까지
                bVo = new BoardVO();
                
                bVo.setNum(rs.getInt("num"));
                bVo.setName(rs.getString("name"));
                bVo.setEmail(rs.getString("b_email"));
                bVo.setPass(rs.getString("pwd"));
                bVo.setTitle(rs.getString("b_title"));
                bVo.setContent(rs.getString("b_content"));
                bVo.setReadcount(rs.getInt("readcount"));
                bVo.setWritedate(rs.getTimestamp("writedate"));
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
        	rs.close();
        	pstmt.close();
        	conn.close();

        }
        return bVo;//next로 읽어온 bVo값을 돌려준다. 
    }
}
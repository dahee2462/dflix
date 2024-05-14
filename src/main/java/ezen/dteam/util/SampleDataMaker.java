package ezen.dteam.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.security.crypto.bcrypt.BCrypt;


public class SampleDataMaker {

	public static void main(String[] args) {
		
		Connection conn = null;	
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		String url = "jdbc:mysql://127.0.0.1:3306/dflix";
		String user = "dteam";
		String pass ="ezen";
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace(); 
		}
		try {
			conn=DriverManager.getConnection(url,user,pass);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			
			String password = "", sql ="";
			for(int i =1; i<=10 ; i++) {
				
				password = BCrypt.hashpw("testpw"+i, BCrypt.gensalt());
				sql = "        INSERT INTO member(mid, mpw, mnickNm, mname, mbirth, memail, mphone, mgender, authority, enabled) "
						+ "		VALUES(concat('testid',"+i+"),?,concat('닉네임',"+i+"),concat('이름',"+i+"),'19990111','stacktack@gmail.com','01011111111','m','ROLE_ADMIN','1')";
				psmt=conn.prepareStatement(sql);
				psmt.setString(1, password);
				psmt.executeUpdate();
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("Sample생성");
			try {
				if(conn != null) conn.close();
				if(psmt != null) psmt.close();
				if(rs != null) rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
	}

}

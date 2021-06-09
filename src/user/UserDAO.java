package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bbs.Bbs;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BLANC";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if (rs.getString(1).equals(userPassword))
					return 1; // 로그인 성공
				else
					return 0; //비밀번호 불일치
			}
			return -1; // 아이디 없음
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류
	}
	
	public int join(User user) {
		String SQL = "Insert into USER VALUES (?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserEmail());
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류 
	}
	
	public int User(User user) {
		String SQL = "SELECT * FROM User (?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserEmail());
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류 
	}
	
	public User getUser(int bbsID) { //User user1 = User() // user1.get
		 String SQL = "SELECT * FROM Blance WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10"; 
		 try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 rs = pstmt.executeQuery();
			 if (rs.next()) {
				 User user = new User();
				 user.setUserID(rs.getString(1));
				 user.setUserPassword(rs.getString(2));
				 user.setUserName(rs.getString(3));
				 user.setUserEmail(rs.getString(4));
				 return user;
			 }
		 } catch (Exception e) {
			 e.printStackTrace();
		 }
		 return null;
	}
	
	public User getUserDATA(String USERID) { //User user1 = User() // user1.get
		 String SQL = "SELECT * FROM User where UserID= ? "; 
		 try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 pstmt.setString(1, USERID);
			 rs = pstmt.executeQuery();
			 if (rs.next()) {
				 User user = new User();
				 user.setUserID(rs.getString(1));
				 user.setUserPassword(rs.getString(2));
				 user.setUserName(rs.getString(3));
				 user.setUserEmail(rs.getString(4));
				 return user;
			 }
		 } catch (Exception e) {
			 e.printStackTrace();
		 }
		 return null;
	}	
	
} 



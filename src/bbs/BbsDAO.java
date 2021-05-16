package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import user.User;

public class BbsDAO {
	private Connection conn;

	private ResultSet rs;
	
	public BbsDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		 String SQL = "SELECT NOW()";
		 try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 rs = pstmt.executeQuery();
			 if(rs.next()) {
				 return rs.getString(1);
			 }
		 } catch (Exception e) {
			 e.printStackTrace();
		 }
		 return ""; //데이터베이스 오류
	}
	public int getNext() {
		 String SQL = "SELECT bbsID FROM bbs ORDER BY bbsID DESC";
		 try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 rs = pstmt.executeQuery();
			 if(rs.next()) {
				 return rs.getInt(1)+1;
			 }
			 return 1; //첫 게시물인 경우
		 } catch (Exception e) {
			 e.printStackTrace();
		 }
		 return -1; //데이터베이스 오류
	}
	
	public int write(String bbsTitle, String userID, String bbsContent) {
		 String SQL = "INSERT INTO bbs VALUES(?, ?, ?, ?, ?, ?)";
		 try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 pstmt.setInt(1, getNext());
			 pstmt.setString(2, bbsTitle);
			 pstmt.setString(3, userID);
			 pstmt.setString(4, getDate());
			 pstmt.setString(5, bbsContent);
			 pstmt.setInt(6, 1);
			 return pstmt.executeUpdate();
		 } catch (Exception e) {
			 e.printStackTrace();
		 }
		 return -1; //데이터베이스 오류
	}
	
	public ArrayList<Bbs> getlist(int pageNumber){//게시물 제한
		 String SQL = "SELECT * FROM bbs WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		 ArrayList<Bbs> list = new ArrayList<Bbs>();
		 try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 pstmt.setInt(1, getNext() - (pageNumber - 1)* 10);
			 rs = pstmt.executeQuery();
			 while (rs.next()) {
				 Bbs bbs = new Bbs();
				 bbs.setBbsID(rs.getInt(1));
				 bbs.setBbsTitle(rs.getString(2));
				 bbs.setUserID(rs.getString(3));
				 bbs.setBbsDate(rs.getString(4));
				 bbs.setBbsContent(rs.getString(5));
				 bbs.setBbsAvailable(rs.getInt(6));
				 list.add(bbs);
			 }
		 } catch (Exception e) {
			 e.printStackTrace();
		 }
		 return list;
	}
	
	public ArrayList<Bbs> getlistMy(String UserID){//내 게시물
		 String SQL = " SELECT * FROM BBS where userID = ? AND bbsAvailable = 1";
		 ArrayList<Bbs> list = new ArrayList<Bbs>();
		 try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 pstmt.setString(1, UserID);
			 rs = pstmt.executeQuery();
			 while (rs.next()) {
				 Bbs bbs = new Bbs();
				 bbs.setBbsID(rs.getInt(1));
				 bbs.setBbsTitle(rs.getString(2));
				 bbs.setUserID(rs.getString(3));
				 bbs.setBbsDate(rs.getString(4));
				 bbs.setBbsContent(rs.getString(5));
				 bbs.setBbsAvailable(rs.getInt(6));
				 list.add(bbs);
			 }
		 } catch (Exception e) {
			 e.printStackTrace();
		 }
		 return list;
	}
	public boolean nextPageMy(int pageNumber, String UserID) {//페이지 넘어갈 경우 처리 (초과시
		 String SQL = "SELECT * FROM BBS WHERE userID = ? AND bbsID < ? AND bbsAvailable = 1"; 
		 try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 pstmt.setInt(1, getNext()- (pageNumber - 1)* 10);
			 pstmt.setString(2, UserID);
			 rs = pstmt.executeQuery();
			 if (rs.next())
				 return true;
		 } catch (Exception e) {
			 e.printStackTrace();
		 }
		 return false;
	}
	
	public boolean nextPage(int pageNumber) {//페이지 넘어갈 경우 처리 (초과시
		 String SQL = "SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1"; 
		 try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 pstmt.setInt(1, getNext()- (pageNumber - 1)* 10);
			 rs = pstmt.executeQuery();
			 if (rs.next())
				 return true;
		 } catch (Exception e) {
			 e.printStackTrace();
		 }
		 return false;
	}
	public Bbs getBbs(int bbsID) {
		 String SQL = "SELECT * FROM BBS WHERE bbsID = ?"; 
		 try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 pstmt.setInt(1, bbsID);
			 rs = pstmt.executeQuery();
			 if (rs.next()) {
				 Bbs bbs = new Bbs();
				 bbs.setBbsID(rs.getInt(1));
				 bbs.setBbsTitle(rs.getString(2));
				 bbs.setUserID(rs.getString(3));
				 bbs.setBbsDate(rs.getString(4));
				 bbs.setBbsContent(rs.getString(5));
				 bbs.setBbsAvailable(rs.getInt(6));
				 return bbs;
			 }
		 } catch (Exception e) {
			 e.printStackTrace();
		 }
		 return null;
	}
	
	public int update(int bbsID, String bbsTitle, String bbsContent) {
		 String SQL = "UPDATE BBS SET bbsTitle = ? , bbsContent = ? Where bbsID = ? ";
		 try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 pstmt.setString(1, bbsTitle);
			 pstmt.setString(2, bbsContent);
			 pstmt.setInt(3, bbsID);
			 return pstmt.executeUpdate();
		 } catch (Exception e) {
			 e.printStackTrace();
		 }
		 return -1; //데이터베이스 오류
		 
	}
	
	public int delete(int bbsID) {
		 String SQL = "UPDATE BBS SET bbsAvailable = 0 Where bbsID = ? ";
		 try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 pstmt.setInt(1, bbsID);
			 return pstmt.executeUpdate();
		 } catch (Exception e) {
			 e.printStackTrace();
		 }
		 return -1; //데이터베이스 오류
	}

}

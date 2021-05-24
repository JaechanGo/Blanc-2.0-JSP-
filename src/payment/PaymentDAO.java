package payment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bbs.Bbs;

public class PaymentDAO {
	
	private Connection conn;

	private ResultSet rs;
	
	public PaymentDAO() {
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
	
	public int getNext() {
		 String SQL = "SELECT id FROM payment_cart ORDER BY id DESC";
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
	
	public ArrayList<payment> getlist(int pageNumber){//게시물 제한
		 String SQL = "SELECT * FROM payment_cart ORDER BY id";
		 ArrayList<payment> list = new ArrayList<payment>();
		 try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 
			 
			 rs = pstmt.executeQuery();
			 while (rs.next()) {
				 payment Payment = new payment();
				 Payment.setId(rs.getInt(1));
				 Payment.setUserID(rs.getString(2));
				 Payment.setProductID(rs.getString(3));
				 Payment.setProductQnt(rs.getInt(4));
				 Payment.setUserEmail(rs.getString(5));
				 Payment.setUserPhone(rs.getString(6));
				 Payment.setItemuser_ID(rs.getString(7));
				 Payment.setItemAdress(rs.getString(8));
				 Payment.setItemPhone(rs.getString(9));
				 Payment.setItemMessage(rs.getString(10));
				 Payment.setDate(rs.getString(11));
				 Payment.setState(rs.getString(12));
				 list.add(Payment);
			 }
		 } catch (Exception e) {
			 e.printStackTrace();
		 }
		 return list;
	}
	
	public ArrayList<payment> getMylist(String UserID){//내 게시물
		 String SQL = "SELECT * FROM payment_cart where userID = ?";
		 ArrayList<payment> list = new ArrayList<payment>();
		 try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 pstmt.setString(1, UserID);
			 rs = pstmt.executeQuery();
			 while (rs.next()) {
				 payment Payment = new payment();
				 Payment.setId(rs.getInt(1));
				 Payment.setUserID(rs.getString(2));
				 Payment.setProductID(rs.getString(3));
				 Payment.setProductQnt(rs.getInt(4));
				 Payment.setUserEmail(rs.getString(5));
				 Payment.setUserPhone(rs.getString(6));
				 Payment.setItemuser_ID(rs.getString(7));
				 Payment.setItemAdress(rs.getString(8));
				 Payment.setItemPhone(rs.getString(9));
				 Payment.setItemMessage(rs.getString(10));
				 Payment.setDate(rs.getString(11));
				 Payment.setState(rs.getString(12));
				 Payment.setPay(rs.getString(13));
				 list.add(Payment);
			 }
		 } catch (Exception e) {
			 e.printStackTrace();
		 }
		 return list;
	}
	
	public boolean nextPage(int pageNumber) {//페이지 넘어갈 경우 처리 (초과시
		 String SQL = "SELECT * FROM payment_cart WHERE id < ?"; 
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
	public payment getpayment_cart(int id) {
		 String SQL = "SELECT * FROM payment_cart WHERE id = ?"; 
		 try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 pstmt.setInt(1, id);
			 rs = pstmt.executeQuery();
			 if (rs.next()) {
				 payment Payment = new payment();
				 Payment.setId(rs.getInt(1));
				 Payment.setUserID(rs.getString(2));
				 Payment.setProductID(rs.getString(3));
				 Payment.setProductQnt(rs.getInt(4));
				 Payment.setUserEmail(rs.getString(5));
				 Payment.setUserPhone(rs.getString(6));
				 Payment.setItemuser_ID(rs.getString(7));
				 Payment.setItemAdress(rs.getString(8));
				 Payment.setItemPhone(rs.getString(9));
				 Payment.setItemMessage(rs.getString(10));
				 Payment.setDate(rs.getString(11));
				 Payment.setState(rs.getString(12));
				 return Payment;
			 }
		 } catch (Exception e) {
			 e.printStackTrace();
		 }
		 return null;
	}
	
}

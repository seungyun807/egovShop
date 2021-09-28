package egovframework.example.cmmn.web.service;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.HashMap;

public class MemberDAO {
	
	 public static Connection getConnection() {
		    try {
		      String dbURL = "jdbc:mariadb://localhost:3306/shop";
		      String dbID = "root";
		      String dbPassword = "1234";
		      Class.forName("org.mariadb.jdbc.Driver");
		      return DriverManager.getConnection(dbURL, dbID, dbPassword);
		    } catch (Exception e) {
		      e.printStackTrace();
		    }
				
		    return null;
		    // 오류 발생시 null 값 리턴
		  }
	 
	 /*
	public String loginCheck(String id, String password) {
		
		String name = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String SQL = "SELECT NAME FROM user WHERE USER_ID=? and PASSWORD=?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				name = rs.getString("name");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
					//return "없는유저입니다.";
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return name;
	}
	*/
	/*
	public String Join(HashMap params) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat simpleDateFromat = new SimpleDateFormat(pattern);
		String date = simpleDateFromat.format(new Date(System.currentTimeMillis()));
		System.out.println(date);
		
		try {
			conn = getConnection();
			String SQL = "INSERT INTO user VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, (String)params.get("id"));
			pstmt.setString(2, (String)params.get("password"));
			pstmt.setString(3, (String)params.get("name"));
			pstmt.setString(4, (String)params.get("email"));
			pstmt.setString(5, (String)params.get("phonenum"));
			pstmt.setString(6, (String)params.get("zip"));
			pstmt.setString(7, (String)params.get("address"));
			pstmt.setString(8, (String)params.get("detailaddress"));
			pstmt.setString(9, null);
			pstmt.setString(10, date);
			rs = pstmt.executeQuery();
	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
					//return "없는유저입니다.";
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return "";
	}
*/

	
}
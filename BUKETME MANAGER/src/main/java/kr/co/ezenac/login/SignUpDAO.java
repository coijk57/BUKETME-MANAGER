package kr.co.ezenac.login;

import java.sql.*;

public class SignUpDAO { //memberDTO를 SignUpVO로 함, MemberDao를 SignUpDAO로 함
	private static SignUpDAO signupDao;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int result;
	
	private SignUpDAO() {
		
	}

	public static synchronized SignUpDAO getInstance() {
		if (signupDao == null) {
			signupDao = new SignUpDAO();
		}
		return signupDao;
	}
	
	public Connection getConnection() {
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String id = "wdsql", pw = "0311";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, id, pw);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	
	
	public int join(SignUpVO signupVo) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("insert into USERINFO values (?,?,?,?,?,?,?,?,?,?,?)"); 
		try {
			pstmt = conn.prepareStatement(query.toString());
		     pstmt.setString(1, "1");
	          pstmt.setString(2, "관리자");
	          pstmt.setString(3, signupVo.getEmail());
	          pstmt.setString(4, signupVo.getPassword());
	          pstmt.setString(5, "01012345678");
	          pstmt.setString(6, signupVo.getName());
	          pstmt.setString(7, "관리자");
	          pstmt.setString(8, "관리자");
	          pstmt.setString(9, "관리자");
	          pstmt.setString(10, "1");
	          pstmt.setString(11, "20220210");
//	      구문객체날리기
	          pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(conn, pstmt, null);
		}
		return result;
	}
}

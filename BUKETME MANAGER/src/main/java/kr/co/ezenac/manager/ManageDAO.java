package kr.co.ezenac.manager;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class ManageDAO {
	private static ManageDAO manageDao;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	private ManageDAO() {
		
	}

	public static synchronized ManageDAO getInstance() {
		if (manageDao == null) {
			manageDao = new ManageDAO();
		}
		return manageDao;
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
	
	public int selectMaxVideoNum() {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		
		
		int maxnum = 0;
		query.append("SELECT max(VIDEONUM) FROM VIDEOINFO"); 
		try {
			Statement stmt = conn.createStatement();
			//결과를 담을 ResultSet 생성 후 결과 담기
			ResultSet rs = stmt.executeQuery(query.toString());
			while(rs.next()) {
				System.out.println("--" + rs.getInt(1));
				maxnum = rs.getInt(1);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(conn, pstmt, null);
		}
		return maxnum;
	}
	
	public int upload(VideoVO videoVO) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		int result = 0;
		
		
		query.append("insert into VIDEOINFO values (?,?,?,?,?,?,?,?,?,?,?,?,?)"); 
		try {
			pstmt = conn.prepareStatement(query.toString());
		     pstmt.setInt(1, videoVO.getVideoNum());
	          pstmt.setString(2, videoVO.getTitle());
	          pstmt.setString(3, videoVO.getContents());
	          pstmt.setString(4, videoVO.getCategory());
	          pstmt.setString(5, videoVO.getLikeCategory());
	          pstmt.setString(6, videoVO.getImageFileName());
	          pstmt.setString(7, videoVO.getVideoFileName());
	          pstmt.setString(8, videoVO.getAgeLimit());
	          pstmt.setString(9, videoVO.getOpenDate());
	          pstmt.setTimestamp(10, videoVO.getPostDate());
	          pstmt.setInt(11, videoVO.getVideoHits());
	          pstmt.setString(12, videoVO.getActors());
	          pstmt.setString(13, videoVO.getDirector());
	        
//	      구문객체날리기
	          result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(conn, pstmt, null);
		}
		
		return result;
	}
	
}

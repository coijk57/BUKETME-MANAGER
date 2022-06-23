package kr.co.ezenac.signup;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.ezenac.manager.VideoVO;

public class SignUpDAO {
	private static SignUpDAO signupDao;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
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
	
	// registernum의 숫자 +1 확인
	public int selectMaxRegisterNum() {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		
		
		int maxid = 0;
		query.append("SELECT max(REGISTERNUM) FROM USERINFO"); 
		try {
			Statement stmt = conn.createStatement();
			//결과를 담을 ResultSet 생성 후 결과 담기
			ResultSet rs = stmt.executeQuery(query.toString());
			while(rs.next()) {
				System.out.println("--" + rs.getInt(1));
				maxid = rs.getInt(1);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(conn, pstmt, null);
		}
		return maxid;
	}
	
	// 이메일 존재 여부 체크
	public boolean isExistsEmail(String email) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		
		boolean isExists = false;
		
		
		query.append("SELECT COUNT(1) FROM USERINFO WHERE EMAIL = '" + email +"'"); 

		try {
			Statement stmt = conn.createStatement();
			//결과를 담을 ResultSet 생성 후 결과 담기
			ResultSet rs = stmt.executeQuery(query.toString());
			while(rs.next()) {
				System.out.println(rs.getInt(1));
				if(rs.getInt(1) >= 1) {
					isExists = true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(conn, pstmt, null);
		}
		
		return isExists;
	}
	
	public int join(SignUpVO signupVo) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		int result = 0;
		
		
		query.append("insert into USERINFO values (?,?,?,?,?,?,?,?,?,?,?)"); 
		try {
			pstmt = conn.prepareStatement(query.toString());
		     pstmt.setInt(1, signupVo.getRegisterNum());
	          pstmt.setInt(2, signupVo.getManagerCheck());
	          pstmt.setString(3, signupVo.getEmail());
	          pstmt.setString(4, signupVo.getPassword());
	          pstmt.setString(5, signupVo.getPhoneNum());
	          pstmt.setString(6, signupVo.getName());
	          pstmt.setString(7, signupVo.getGender());
	          pstmt.setDate(8, signupVo.getBirthday());
	          pstmt.setString(9, signupVo.getInstrument());
	          pstmt.setInt(10, signupVo.getMemCode());
	          pstmt.setTimestamp(11, signupVo.getJoinDate());
//	      구문객체날리기
	          result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(conn, pstmt, null);
		}
		
		return result;
	}
	
	public int login(String email, String password) {
		int registerNum = -1;
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("SELECT * FROM USERINFO WHERE EMAIL = ?");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				String pas = rs.getString("password");
				if(pas != null && pas.equals(password)) {
					registerNum = rs.getInt("REGISTERNUM");
				} else {
					registerNum = 0;
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(conn, pstmt, rs);
		}
		return registerNum;
	}
	
	public List<ProfileVO> getProfiles(int registerNum) {
		
		List<ProfileVO> result = new ArrayList<ProfileVO>();
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("SELECT * FROM PROFILE WHERE REGISTERNUM = ?");
		try {
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setInt(1, registerNum);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ProfileVO profileVO = new ProfileVO();
				
				profileVO.setProfileRegisterNum(rs.getInt("PROFILEREGISTERNUM"));
				profileVO.setRegisterNum(rs.getInt("REGISTERNUM"));
				profileVO.setMemCode(rs.getInt("MEMCODE"));
				profileVO.setProfileImageName(rs.getString("PROFILEIMAGENAME"));
				profileVO.setProfileName(rs.getString("PROFILENAME"));
				
				result.add(profileVO);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(conn, pstmt, rs);
		}
		return result;
	}
	
	public int selectMaxProfileNum() {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		
		
		int maxProfile = 0;
		query.append("SELECT max(PROFILEREGISTERNUM) FROM PROFILE"); 
		try {
			Statement stmt = conn.createStatement();
			//결과를 담을 ResultSet 생성 후 결과 담기
			ResultSet rs = stmt.executeQuery(query.toString());
			while(rs.next()) {
				System.out.println("--" + rs.getInt(1));
				maxProfile = rs.getInt(1);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(conn, pstmt, null);
		}
		return maxProfile;
	}
	
	
	public int profileCreate(int profileRegisterNum, int registerNum, int mem, String profileName, String likecategories) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		int result = 0;
		query.append("insert into PROFILE values (?,?,?,?,?,?)"); 
		try {
			pstmt = conn.prepareStatement(query.toString());
		     pstmt.setInt(1, profileRegisterNum);
	          pstmt.setInt(2, registerNum);	
	          pstmt.setInt(3, mem);//수정함
	          pstmt.setString(4, "234");
	          pstmt.setString(5, profileName);
	          pstmt.setString(6, likecategories);
	          
//	      구문객체날리기
	          result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(conn, pstmt, null);
		}
		
		return result;
	}
	
//	public int createLikeMedia(int profileRegisterNum, int registerNum, int mem, String profileName) {
//		conn = this.getConnection();
//		StringBuffer query = new StringBuffer();
//		int result = 0;
//		query.append("insert into LIKEMEDIA values (?,?,?,?)"); 
//		try {
//			pstmt = conn.prepareStatement(query.toString());
//		     pstmt.setInt(1, profileRegisterNum);
//	          pstmt.setInt(2, registerNum);	
//	          pstmt.setInt(3, mem);//수정함
//	          pstmt.setString(4, "234");
//	          pstmt.setString(5, profileName);
//	          
////	      구문객체날리기
//	          result = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			this.close(conn, pstmt, null);
//		}
//		
//		return result;
//	}
	
	
	//수정 필요
	public int membershipCode(int mem, int registerNum) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		int result = 0;
		query.append("update USERINFO set memcode=? where registernum=?"); 
		try {
			pstmt = conn.prepareStatement(query.toString());	
	          pstmt.setInt(1, mem);
	          pstmt.setInt(2, registerNum);       
//	      구문객체날리기
	          result = pstmt.executeUpdate();
	          System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(conn, pstmt, null);
		}
		
		return result;
	}
	
	public int cardInfo(cardInfoVO cardinfoVO) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		int result = 0;
		query.append("insert into cardinfo values (?,?,?,?,?)"); 
		try {
			pstmt = conn.prepareStatement(query.toString());
			
			 pstmt.setString(1, cardinfoVO.getCardnum());
			 pstmt.setString(2, cardinfoVO.getExpiredate());
			 pstmt.setString(3, cardinfoVO.getCardowner());
			 pstmt.setString(4, cardinfoVO.getCardownerbirthday());
	         pstmt.setInt(5, cardinfoVO.getRegisternum());
//	      구문객체날리기
	          result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(conn, pstmt, null);
		}
		
		return result;
	}	
	
	public List<FavoriteVO> listFavorites(){
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		
		List<FavoriteVO> favorites = new ArrayList<FavoriteVO>();
		query.append("SELECT * FROM LIKECATEGORY"); 
		try {
			Statement stmt = conn.createStatement();
			//결과를 담을 ResultSet 생성 후 결과 담기
			ResultSet rs = stmt.executeQuery(query.toString());
			while(rs.next()) {
				FavoriteVO favoriteVO = new FavoriteVO();
				favoriteVO.setLikeCategoryNo(rs.getInt(1));
				favoriteVO.setLikeCategoryName(rs.getString(2));
				favorites.add(favoriteVO);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(conn, pstmt, null);
		}
		return favorites;
	}
	
	
	public int mypageUpdate(int profileRegisterNum, String profileName, String likecategories) {
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		int result = 0;
		query.append("update PROFILE set profileName=?, likecategories=? where profileRegisterNum=?"); 
		try {
			pstmt = conn.prepareStatement(query.toString());	
	          pstmt.setString(1, profileName);
	          pstmt.setString(2, likecategories); 
	          pstmt.setInt(3, profileRegisterNum); 

//	      구문객체날리기
	          result = pstmt.executeUpdate();
	          System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(conn, pstmt, null);
		}
		
		return result;
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
	
	public List<VideoVO> VideoList(){
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		
		List<VideoVO> videolist = new ArrayList<VideoVO>();
		query.append("SELECT * FROM VIDEOINFO"); 
		try {
			Statement stmt = conn.createStatement();
			//결과를 담을 ResultSet 생성 후 결과 담기
			ResultSet rs = stmt.executeQuery(query.toString());
			while(rs.next()) {
				VideoVO videoVO = new VideoVO();
				
				videoVO.setTitle(rs.getString(1));
				videoVO.setOpenDate(rs.getString(2));
				videoVO.setVideoHits(rs.getInt(3));
				
				videolist.add(videoVO);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(conn, pstmt, null);
		}
		return videolist;
	}
	
	public List<VideoVO> ListVideo(VideoVO videoVO2){
		conn = this.getConnection();
		StringBuffer query = new StringBuffer();
		
		List<VideoVO> listvideo = new ArrayList<VideoVO>();
		query.append("SELECT * FROM LIKECATEGORY"); 
		try {
			Statement pstmt = conn.createStatement();
			//결과를 담을 ResultSet 생성 후 결과 담기
			ResultSet rs = pstmt.executeQuery(query.toString());
			while(rs.next()) {
				VideoVO videoVO = new VideoVO();
				videoVO.setTitle(rs.getString(1));
				videoVO.setContents(rs.getString(2));
				videoVO.setCategory(rs.getString(3));
				videoVO.setLikeCategory(rs.getString(4));
				videoVO.setImageFileName(rs.getString(5));
				videoVO.setVideoFileName(rs.getString(6));
				videoVO.setAgeLimit(rs.getString(7));
				videoVO.setOpenDate(rs.getString(8));
				videoVO.setActors(rs.getString(9));
				videoVO.setDirector(rs.getString(10));
				
				listvideo.add(videoVO);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(conn, pstmt, null);
		}
		return listvideo;
	}
	
	/*
	 * public int selectCategory() { conn = this.getConnection(); StringBuffer query
	 * = new StringBuffer();
	 * 
	 * 
	 * int cate = 0; query.append("SELECT * FROM CATEGORY where CATEGORYNAME = ? ");
	 * try { Statement stmt = conn.createStatement(); //결과를 담을 ResultSet 생성 후 결과 담기
	 * ResultSet rs = stmt.executeQuery(query.toString()); while(rs.next()) {
	 * System.out.println("--" + rs.getInt(1)); cate = rs.getInt(1);
	 * 
	 * } } catch (SQLException e) { e.printStackTrace(); } finally {
	 * this.close(conn, pstmt, null); } return cate; }
	 * 
	 * public int selectLikeCategory(VideoVO videoVO) { conn = this.getConnection();
	 * StringBuffer query = new StringBuffer();
	 * 
	 * int cate = 0; query.
	 * append("SELECT LIKECATEGORYNO FROM CATEGORY where LIKECATEGORYNAME = ? ");
	 * 
	 * try { pstmt = conn.prepareStatement(query.toString()); pstmt.setString(1,
	 * videoVO.getLikeCategory()); cate = pstmt.executeUpdate();
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); } finally { this.close(conn,
	 * pstmt, null); } return cate; }
	 */
}


package kr.co.ezenac.manager;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Random;

import javax.servlet.*;
import javax.servlet.http.*;

import kr.co.ezenac.signup.SignUpDAO;

public class VideoManageController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/manager/adminboard.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		Random rd = new Random();
		
		//jsp의 name에서 가져오는 값임(연동이 되어야 그 jsp에서 입력된 값을 컨트롤러에 가져와서 db에 입력함)
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");
		int Category = Integer.parseInt(req.getParameter("Category"));
		int likeCategory = Integer.parseInt(req.getParameter("likeCategory"));
		String imageFileName = req.getParameter("imageFileName");
		System.out.println("<1->");
		System.out.println(imageFileName);
		String videoFileName = req.getParameter("videoFileName");
		System.out.println("<-2>");
		System.out.println(videoFileName);
		String ageLimit = req.getParameter("ageLimit");
		String openDate = req.getParameter("openDate");
		Timestamp postDate = Timestamp.valueOf(LocalDateTime.now());
		int videoHits = (0);
		System.out.println(videoHits);
		String actors = req.getParameter("actors");
		String director = req.getParameter("director");
			
		SignUpDAO mDao = SignUpDAO.getInstance();
		VideoVO videoVO = new VideoVO();
		
		String no1 = "1_" + Category + "_0";
		
		System.out.println("ddd"+Category);
		
		System.out.println("zzz"+likeCategory);
		String no2 = "1_" + likeCategory + "_0";
		
		
		//MAXNUM
		int maxnum = mDao.selectMaxVideoNum();

	
		videoVO.setVideoNum(maxnum+1);
		videoVO.setTitle(title);
		videoVO.setContents(contents);
		videoVO.setCategory(no1);
		videoVO.setLikeCategory(no2);
		videoVO.setImageFileName(imageFileName);
		videoVO.setVideoFileName(videoFileName);
		videoVO.setAgeLimit(ageLimit);
		videoVO.setOpenDate(openDate);
		videoVO.setPostDate(postDate);
		videoVO.setVideoHits(videoHits);
		videoVO.setActors(actors);
		videoVO.setDirector(director);
		
		System.out.println(videoVO.toString());

		int joinResult = mDao.upload(videoVO);
		System.out.println("what" + joinResult);
		if (joinResult == 1) {
			req.setAttribute("joinResult", joinResult);
			HttpSession session = req.getSession();
			session.setAttribute("videoNum", videoVO.getVideoNum());
			
			System.out.println("zzzzz");
			
			resp.sendRedirect(req.getContextPath() + "/manager/adminboard.jsp");
		} else {
			System.out.println("오류발생1");
		}
		
	}
	
}



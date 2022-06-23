package kr.co.ezenac.signup;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class myPageController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/login/mypage.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		String profileName = req.getParameter("profileName");
		String favorite = req.getParameter("mypage");
		SignUpDAO signupDao = SignUpDAO.getInstance();
		
		int registerNum = (int)session.getAttribute("registerNum");
		
		int profileNum = 3; //.getAttribute("profileID");
		
		int result = signupDao.mypageUpdate(
				profileNum,
				profileName,
				favorite);
			
		System.out.println(result); 
		
		if(result == 1) {
			List<ProfileVO> profiles = signupDao.getProfiles(registerNum);
			session.setAttribute("profiles", profiles);
			resp.sendRedirect(req.getContextPath() + "/login/profileChoice.jsp");
		}
		
	}
	
}
//request, session, dao 여기서 꺼내 씀
//욕심 : 뒤로가기, 보안 인증, 쿠키, 캐시, 헤더 언어(영어)
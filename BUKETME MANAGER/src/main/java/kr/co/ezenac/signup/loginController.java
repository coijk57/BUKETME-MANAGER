package kr.co.ezenac.signup;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;

public class loginController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/login/login.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		SignUpDAO signupDao = SignUpDAO.getInstance();
		int registerNum = signupDao.login(email,password);
		
		if (registerNum >= 1) {
			
			HttpSession session = req.getSession();
			session.setAttribute("sessionID", registerNum);
			
			List<ProfileVO> result = signupDao.getProfiles(registerNum);
			session.setAttribute("profiles", result);
			RequestDispatcher rd;
			if(result.isEmpty()) {
				resp.sendRedirect(req.getContextPath() + "/login/profileCreate.jsp");
			}
			
			else {
				resp.sendRedirect(req.getContextPath() + "/login/profileChoice.jsp");
			}
			
		} else {
			
			RequestDispatcher rd = req.getRequestDispatcher("/login/login.jsp");
			rd.forward(req, resp);
		}
		
	}
	
}

package kr.co.ezenac.signup;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class profileChoiceController extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/login/profileChoice.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		
		String email = req.getParameter("email"); //jsp의 input의 name 값을 가져옴(email 가져옴)
		String password = req.getParameter("password");
		String mem = req.getParameter("mem");
		
		SignUpDAO signupDao = SignUpDAO.getInstance();
		int registerNum = signupDao.login(email,password);
		
		if (registerNum >= 1) {
			HttpSession session = req.getSession();
			session.setAttribute("sessionID", registerNum);
			session.setAttribute("mem", mem);
			List<ProfileVO> result = signupDao.getProfiles(registerNum);
			
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

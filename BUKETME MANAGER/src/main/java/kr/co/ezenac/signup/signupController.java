package kr.co.ezenac.signup;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.servlet.*;
import javax.servlet.http.*;

public class signupController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/login/signup.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String phoneNum = req.getParameter("phoneNumber");
		String name = req.getParameter("name");
		String gender = req.getParameter("gender");
		int year = Integer.parseInt(req.getParameter("year"));
		int month = Integer.parseInt(req.getParameter("month"));
		int day = Integer.parseInt(req.getParameter("day"));
		Date birthday = Date.valueOf(LocalDate.of(year, month, day));
		String instrument = req.getParameter("instrument");
		
		Timestamp joinDate = Timestamp.valueOf(LocalDateTime.now());
		
		
		 
		
		SignUpDAO mDao = SignUpDAO.getInstance();
		
		//EMAILCHECK
		boolean emailcheck = mDao.isExistsEmail(email);
		if(emailcheck == true) {
			System.out.println("중복");
			resp.sendRedirect(req.getContextPath() + "/login/signup.jsp");
			return;
		}
		
		else {
			
		}
		
		//MAXNUM
		int maxid = mDao.selectMaxRegisterNum();

		SignUpVO signupVO = new SignUpVO();
		signupVO.setRegisterNum(maxid+1);
		signupVO.setManagerCheck(0);
		signupVO.setEmail(email);
		signupVO.setPassword(password);
		signupVO.setPhoneNum(phoneNum);
		signupVO.setName(name);
		signupVO.setGender(gender);
		signupVO.setBirthday(birthday);
		signupVO.setInstrument(instrument);
		signupVO.setJoinDate(joinDate);
		
		System.out.println(signupVO.toString());

		int joinResult = mDao.join(signupVO);
		System.out.println("dad" + joinResult);
		if (joinResult == 1) {
			req.setAttribute("joinResult", joinResult);
			HttpSession session = req.getSession();
			session.setAttribute("sessionID", email);
			session.setAttribute("registerNum", signupVO.getRegisterNum());
			
			System.out.println("afafa");
			
			resp.sendRedirect(req.getContextPath() + "/login/membership.jsp");
		} else {
			System.out.println("오류발생1");
		}
		
	}
	
}

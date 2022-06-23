package kr.co.ezenac.signup;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.servlet.*;
import javax.servlet.http.*;

public class MembershipController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/login/membership.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		int registerNum = (int)session.getAttribute("registerNum");
		
		String memcode = req.getParameter("memcode");
		int mem = 0;
		  if(memcode.equals("basic")) {
        	  mem = 1;
          }
          
          else if(memcode.equals("standard")) {
        	  mem = 2;
          }
          
          else if(memcode.equals("premium")) {
        	  mem = 4;
          }
		
		SignUpDAO mDao = SignUpDAO.getInstance();
		
		int memresult = mDao.membershipCode(mem,registerNum);
		System.out.println("멤버쉽  " + memresult);
		if (memresult == 1) {
			session.setAttribute("mem", mem);
			
			System.out.println("멤버쉽 완료ㅣㅣㅣㅣ");
			
			resp.sendRedirect(req.getContextPath() + "/login/cardInfo.jsp");
			return;
		} else {
			System.out.println("오류발생2");
		}
		
		
	}
	
}

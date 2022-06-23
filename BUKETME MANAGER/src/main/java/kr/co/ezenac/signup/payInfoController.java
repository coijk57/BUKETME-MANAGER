package kr.co.ezenac.signup;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class payInfoController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/login/profileChoice.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		
//		String cardnum = req.getParameter("cardnum");
//		String cardexdate = req.getParameter("cardexdate");
//		String name = req.getParameter("name");
//		String birthdate = req.getParameter("birthdate");
//		
//		SignUpDAO mDao = SignUpDAO.getInstance();
//
//		payInfoVO payinfoVO = new payInfoVO();
//		payinfoVO.setCardnum(cardnum);
//		payinfoVO.setCardexdate(cardexdate);
//		payinfoVO.setName(name);
//		payinfoVO.setBirthdate(birthdate);
//		
//		System.out.println(payinfoVO.toString());
//		
//		
//		int payresult = mDao.payInfo(payinfoVO);
//		System.out.println("dad" + payresult);
//		if (payresult == 1) {
//			req.setAttribute("payresult", payresult);
//			HttpSession session = req.getSession();
//			
//			int registerNum = (int)session.getAttribute("sessionID");
//			
//			System.out.println("bbbb");
//			
//			resp.sendRedirect(req.getContextPath() + "/login/profileChoice.jsp");
//		} else {
//			System.out.println("오류발생1");
//		}
		

		
	}
	
}

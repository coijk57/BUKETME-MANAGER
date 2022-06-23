package kr.co.ezenac.signup;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class cardInfoController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/login/cardInfo.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		int registerNum = (int)session.getAttribute("registerNum"); // 입력한 registerNum에 cardInfo의 값을 저장하기 위해 값을 가져옴
		
		String cardnum = req.getParameter("cardnum");
		String expiredate = req.getParameter("expiredate");
		String cardowner = req.getParameter("cardowner");
		String cardownerbirthday = req.getParameter("cardownerbirthday");
		
		SignUpDAO mDao = SignUpDAO.getInstance();
		cardInfoVO cardinfoVO = new cardInfoVO();
		cardinfoVO.setRegisternum(registerNum);
		cardinfoVO.setCardnum(cardnum);
		cardinfoVO.setExpiredate(expiredate);
		cardinfoVO.setCardowner(cardowner);
		cardinfoVO.setCardownerbirthday(cardownerbirthday);
		
		System.out.println(cardinfoVO.toString());
		int cardresult = mDao.cardInfo(cardinfoVO);
		System.out.println("카드  " + cardresult);
		if (cardresult == 1) {
			System.out.println("카드정보");
			resp.sendRedirect(req.getContextPath() + "/login/profileChoice.jsp");
			return;
		} else {
			System.out.println("오류발생2");
		}
	}
}
//request, session, dao 여기서 꺼내 씀
//욕심 : 뒤로가기, 보안 인증, 쿠키, 캐시, 헤더 언어(영어)
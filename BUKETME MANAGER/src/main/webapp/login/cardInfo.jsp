<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="../css/loginCss/cardInfo.css" />
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="../js/loginJS/payinfo.js"></script>
<title>결제정보</title>
</head>
<body>



	<div class="middleContainer">
		<div class="centerContainer">

			<%@ include file="../common/loginHeader.jsp"%>
			<div class="payInfoContainer">
				<div class="titleContainer">
					<h1 class="titleName">신용카드나 체크카드 등록</h1>
				</div>
				<form action="${pageContext.request.servletContext.contextPath}/cardInfo.do" method="post">

					<div class="writeInfoContainer">
						<h4>카드번호</h4>
						<input class="writeInfo" name="cardnum" id="cardnum" type="text"
							maxlength="16" placeholder="카드 번호">
						<h4>만료일</h4>
						<input class="writeInfo" name="expiredate" id="expiredate"
							type="text" maxlength="4" placeholder="만료일(월/연도:12/21)">
						<h4>이름</h4>
						<input class="writeInfo" name="cardowner" id="cardowner"
							type="text" placeholder="이름">
						<h4>생년월일</h4>
						<input class="writeInfo" name="cardownerbirthday"
							id="cardownerbirthday" type="text" maxlength="8"
							placeholder="생년월일(ex.19950202)">
					</div>

					<h4 class="allAgreeCheckbox">
						<input type="checkbox"> <span>19세 이상이며, 아래의 약관에 모두
							동의합니다.</span>

					</h4>
					<div class="agreeList">
						<div class="agreeListContent">
							<input type="checkbox"> <span>플랫폼명 이용 약관 및 개인정보
								처리방침에 동의합니다.</span>

						</div>
						<div class="agreeListContent">
							<input type="checkbox"> <span>본인의 개인정보를 제 3자에 제공하는
								데에 동의합니다.</span>

						</div>
						<div class="agreeListContent">
							<input type="checkbox"> <span>본인의 개인 정보를 결제 서비스
								업체에 제공하는 데에 <br>동의합니다.
							</span>

						</div>
					</div>
					<button class="membershipStartBtn">유료 멤버십 시작</button>
				</form>
			</div>
		</div>
	</div>

	<%@ include file="../common/footer.jsp"%>
</body>
</html>
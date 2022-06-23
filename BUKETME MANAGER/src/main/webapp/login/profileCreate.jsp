<%@page import="kr.co.ezenac.signup.SignUpDAO"%>
<%@page import="kr.co.ezenac.signup.FavoriteVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	SignUpDAO dao =SignUpDAO.getInstance(); // 하나의 객체 생성 후 고정으로 계속 사용함
	List<FavoriteVO> favorites = dao.listFavorites();
	/* System.out.println(favorites); */
	request.setAttribute("favorites", favorites);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>프로필 추가</title>
<link rel="stylesheet" href="../css/loginCss/profileCreate.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="../js/loginJS/favorite.js"></script>
</head>
<body>

	<%@ include file="../common/loginHeader.jsp"%>

	<div id="profile-main">
		<section id="section">
			<div id="profileadd">
				<form
					action="${pageContext.request.servletContext.contextPath}/ProfileCreate.do"
					method="post">
					<p id="add">프로필을 추가</p>
					<p>버켓미를 시청할 사용자를 등록하려면 프로필을 추가하세요.</p>
					<hr>
					<img id="man" src="../img/man.png" alt="프로필 사진"
						name="profileImageName" /> <input id="Write" type="text"
						name="profileName"><br>
					<hr>
					<input type="hidden" class="favorite-input" name="favorite" />
					<div class="signup-form-detail">
						<h1 class="min_title">취향 설정하기</h1>
						<div class="like-list">
						
						<c:forEach var="favorite" items="${favorites}" >
		                	
			            <div class="list-area" id = "list-area-${favorite.getLikeCategoryNo()}">
			            	
				            <h3 class="like">
				            	<c:out value="${favorite.getLikeCategoryName()}" />
				            </h3>
				            
			            </div>
			               
		                </c:forEach>
							<!-- 반복문을 이용해 테이블의 카테고리 값을 출력 -->
							<!-- <div class="list-area">
								<h3 class="like">밝은분위기</h3>
							</div>
							<div class="list-area">
								<h3 class="like">스릴넘치는</h3>
							</div>
							<div class="list-area">
								<h3 class="like">달달한</h3>
							</div>
							<div class="list-area">
								<h3 class="like">잔잔한</h3>
							</div>
							<div class="list-area">
								<h3 class="like">역사적인</h3>
							</div>
							<div class="list-area">
								<h3 class="like">감동적인</h3>
							</div>
							<div class="list-area">
								<h3 class="like">외계인</h3>
							</div>
							<div class="list-area">
								<h3 class="like">괴물</h3>
							</div>
							<div class="list-area">
								<h3 class="like">귀신</h3>
							</div>
							<div class="list-area">
								<h3 class="like">초자연적인</h3>
							</div>
							<div class="list-area">
								<h3 class="like">시간여행</h3>
							</div>
							<div class="list-area">
								<h3 class="like">실화바탕</h3>
							</div>
							<div class="list-area">
								<h3 class="like">불륜</h3>
							</div>
							<div class="list-area">
								<h3 class="like">복수혈전</h3>
							</div>
							<div class="list-area">
								<h3 class="like">리얼리티</h3>
							</div>
							<div class="list-area">
								<h3 class="like">따듯한</h3>
							</div> -->
						</div>
					</div>

					<div id="input">
						<input id="next" type="submit" value="다음"> 
					</div>
				</form>
			</div>
		</section>
	</div>
	<br>
	<%@ include file="../common/footer.jsp"%>

</body>
</html>
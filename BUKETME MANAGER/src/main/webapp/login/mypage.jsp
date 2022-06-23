<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.stream.Collector"%>
<%@page import="java.util.Arrays"%>
<%@page import="kr.co.ezenac.signup.SignUpDAO"%>
<%@page import="kr.co.ezenac.signup.FavoriteVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	SignUpDAO dao = SignUpDAO.getInstance();
	List<FavoriteVO> favorites = dao.listFavorites();
	/* System.out.println(favorites); */
	request.setAttribute("favorites", favorites);
	String myFavoriteNums = "3,6,9"; // db에서 가져오기
/* 	List<Integer> myFavoriteNums = 
	Arrays.asList(myFavorites.split(","))
	.stream()
	.map(o->Integer.parseInt(o))
	.collect(Collectors.toList()); */
	
	request.setAttribute("myFavoriteNums", myFavoriteNums);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>마이페이지</title>
	<link rel="stylesheet" href="../css/UserMainCss/mypage.css">
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="../js/mypage.js"></script>
	
</head>

<body>

<div id="wrapper">

	<div class="header">
	<!-----------------헤더파일 불러오기 ----------------->
	<%@ include file="../common/managerHeader.jsp" %>
	</div>
	<form action="${pageContext.request.servletContext.contextPath}/myPage.do"
					method="post">
	<input type="hidden" class="mypage-input" name="mypage" value="${myFavoriteNums}"/>
	
	<div class="content">
		<div class="mypage_body">
			<div class="mypage_content">
				<div class="mypage_form_main">
					<section>
						<h1 class="title">마이페이지</h1>
						<div class="line"></div>
					</section>
		
					<section>
						<div class="mypage_content_area">
						
							<div class="profile_img_circle">
								<div class="profile_img_filebox">
									<img class="base_img" src="../img/man.png">
									<!--<label for="file">프로필 선택</label> 
						    		 <input type="file" id="file" class="profile_img_file">
						    		
						    		<div class="file_input_div">
									<input type="button" value="파일 찾기" class="file_input_button" />
									<input type="file" class="file_input_hidden" onchange="javascript: document.getElementById('file2').value = this.value" />
									</div>
									<input type="text" id="file2" class="file_input_textbox"  name="imageFileName" readonly="readonly">
						    		 -->
						    	</div>
							</div>
							
							<input type="text" name="profileName" class="profile_name" placeholder="프로필명" required>
							
							<div class="top_button_wrap">
								<!-- <input onclick="location.href='mypage_keepMembership.jsp'" class="top_button" type="button" value="구독킵하기" /> -->
								<!-- <input onclick="location.href='mypage_quitMembership.jsp'" id="quitjoin_btn" class="top_button" type="button" value="계정탈퇴" /> -->
							</div>
							
							<!-- <div class="line"></div>
							
							<div class="selectbox">
								<select name="관람등급" class="select">
  									<option value="전체이용가" selected="selected">전체이용가</option>
 									<option value="12세 이상 관람가">12세 이상 관람가</option>
  									<option value="15세 이상 관람가">15세 이상 관람가</option>
  									<option value="청소년 관람불가">청소년 관람불가</option>
								</select>
							<span class="icoArrow"><img src="../img/arrow_icon.png" alt="select" width="18px" height="10px"></span>
							</div>
							
							<div class="membershipContainer">
	                			<div class="membershipContent">
	                    			<div class="membershipInfoPrice">월 17,000원</div>
	                    			<div class="membershipInfoName">
	                        			프리미엄 멤버십
	                    			</div>
	                			</div>
	                			<button onclick="location.href='mypage_membership.jsp'" type="button" class="membershipContentMod">변경</button>
	            			</div>
	            			
	            			<div class="line"></div> -->
	            			
	            			<div class="signup-form-detail">
                            	<h1 class="min_title">취향 설정하기</h1>
                            	<ul class="like-list">
                            	<!-- 반복문을 이용해 테이블의 카테고리 값을 출력 -->
                            		<c:forEach var="favorite" items="${favorites}">
						            <div class="list-area" id = "list-area-${favorite.getLikeCategoryNo()}">
							            <h3 class="like">
							            	<c:out value="${favorite.getLikeCategoryName()}" />
							            </h3>
						            </div>
					                </c:forEach>
                        		</ul>
                    		</div>
                    		
                    		<div class="line"></div>
							
						</div>
					</section>
					
					<div class="mypage_button_area">
									<input class="button" type="submit" value="저장하기" />
								</div>
				
				</div>
			</div>
		</div>
	</div>
	</form>
	
	<div class="footer">
	<!-----------------푸터파일 불러오기 ----------------->
	<%@ include file="../common/footer.jsp" %>
	</div>
	
</div>
</body>
</html>
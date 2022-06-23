<%@page import="kr.co.ezenac.signup.ProfileVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	response.setContentType("text/html; charset=utf8");
    List<ProfileVO> profile =  (List<ProfileVO>)session.getAttribute("profiles");
    request.setAttribute("profile", profile);
   	int mem=(int)session.getAttribute("mem"); /* 세션에 저장된 mem 값을 가져오기 / mem이라는 변수에 세션 값 대입 */
   	request.setAttribute("mem", mem);/* request.setAttribute("객체명=변수", 객체=데이터값); Object x = request.getAttribute("객체명"); //  데이터 입력 */
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>프로필 선택</title>
    <link rel="stylesheet" href="../css/loginCss/profile.css">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
	    $(function() {
			$(".create").on("click", function() {
				location.href="./profileCreate.jsp";
		    });
		}); 
	    /*id: #, class: .*/
	   /*  console.log(mem); */
    </script>
</head>
<body>

	<%@ include file="../common/loginHeader.jsp" %>
	
	<div id="profile-main">
	<form action="${pageContext.request.servletContext.contextPath}/ProfileChoice.do" method="post">
        <section id="section">
            <p id="ProfileChoice">
                프로필을 선택 하세요
            </p>
            <ul class="profile-list">
            
            	<c:choose>
            		<c:when test="${empty profile}"> <!-- profile은 리스트 -->
	                	<div class="profile-area create">
		                    <img id="plus" src="../img/plus.png" alt="프로필 생성"/>
		                    <p>프로필 추가</p>
		                </div>
	                </c:when>
	                <c:when test="${!empty profile}">
	                	<c:forEach var="list" items="${profile}"><!-- list는 변수, 변수가 붙어야 실행 가능 -->
		                	<div class="profile-area">
			                    <img class="man" src="../img/man.png' />" alt="프로필 사진"/> 
			                	<div class="profile-name"><c:out value="${list.getProfileName()}" /></div> <!-- page import="kr.co.ezenac.signup.ProfileVO"로 인해 getProfileName() 가져옴-->
			                </div>
		                </c:forEach>
						<c:if test="${profile.size() < mem}">
							<div class="profile-area create">
			                    <img id="plus" src="../img/plus.png" alt="프로필 생성"/>
			                    <p>프로필 추가</p>
			                </div>
						</c:if>
	                </c:when> 
            	</c:choose>
            	 
            </ul>
        </section>
        </form>
    </div>
	
	<%@ include file="../common/footer.jsp" %>

</body>
</html>
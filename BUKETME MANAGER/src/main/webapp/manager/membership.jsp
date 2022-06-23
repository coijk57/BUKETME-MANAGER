<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="page" value="5" />
<%!String[][] records = { 
			{"남", "name1@gmail.com", "베이직", "2022.05.09", "76일","구독 중"},
			{"남", "name2@naver.com", "스탠다드", "2022.03.08", "14일","구독 중"}, 
			{"남", "name3@hanmail.net", "베이직", "2022.03.21", "27일","구독 중"},
			{"남", "name4@gmail.com", "베이직", "2022.02.06", "0일","구독 해지"}, 
			{"남", "name5@daum.net", "스탠다드", "2022.07.03", "131일","구독 중"},
			{"남", "name6@gmail.com", "프리미엄", "2022.04.02", "39일","구독 중"}, 
			{"남", "name7@gmail.com", "베이직", "2022.04.05", "42일","구독 중"}
	};
int size = 0;
	
%>
<%
request.setCharacterEncoding("UTF-8");
pageContext.setAttribute("records", records);
size = records.length;
pageContext.setAttribute("size", size);
pageContext.setAttribute("currentPage", request.getParameter("currentPage"));
if(request.getParameter("currentPage")==null){
	pageContext.setAttribute("currentPage", 1);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원관리</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="../css/managerCss/membership.css">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
	
<script type="text/javascript" src="../js/managerJS/searchFilterSelect.js"></script>

</head>
<body>
	
	<%@ include file="../common/managerHeader.jsp" %>
	
	<div class="mainBox">
    
    	<%@ include file="../common/managerSide.jsp" %>
    	
		<div class="mainBoxInside">
			<div id="mainWrapper">
				<ul>
					<li>
						<div class="board_search">
							<!-- <div class="filter">필터</div> -->
							<div class="list_title">회원관리</div>
							<!-- <div class="search_area">
								<div class="board_searchBox">
						            <input class="board_searchText" type="text" placeholder="search">
						            <a class="board_searchBtn" href="#">
						                <span class="board_list_userTitleIcon color">
						                    <i class="fas fa-search fa-lg">
						                    </i>
						                </span>
						            </a>
						        </div>
							</div> -->
						</div>
					</li>
					<li>
						<ul id="ulTable">
							<li>
								<ul>
									<!-- <li>No</li> -->
									<li><input type="checkbox" /></li>
									<li>성별</li>
									<li>이메일</li>
									<li>멤버쉽</li>
									<li>구독기간</li>
									<li>구독일</li>
									<li>구독상태</li>
									<!-- <li>적용</li> -->
								</ul>
							</li>
		
							<c:forEach var="record" items="${records}"
								begin="${(currentPage-1)*page}" end="${currentPage*page-1}">
								<li>
									<ul id="notice">
										<li><input type="checkbox" /></li>
										<c:forEach var="item" items="${record}">
											<li><c:out value="${item}" /></li>
										</c:forEach>
									</ul>
								</li>
							</c:forEach>
						</ul>
					</li>
					<li>
						<div class="sub-btn-area">
							<input class="sub-cancel" type="button" value="구독해지" />
						</div>
					</li>		
		
					<li>
						<div id="divPaging">
		
							<c:forEach begin="1" end="${Math.ceil(size/page)}" var="item">
								<a href="<c:url value="../manager/membership.jsp" >            
							  <c:param name="currentPage" value="${item}"></c:param>
							  </c:url>"
									style="<c:if test = "${currentPage == item}"> font-weight:bold;</c:if>">
									<c:out value="${item}" /></a>
							</c:forEach>
						</div>
					</li>
		
				</ul>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<button class="btn btn-outline-secondary dropdown-toggle"
							type="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">제목</button>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">제목</a>
							<a class="dropdown-item" href="#">내용</a>
						</div>
					</div>
					<input type="text" class="form-control" aria-label="Text input with dropdown button">
				</div>
			</div>
		</div>
	</div>

</body>
</html>
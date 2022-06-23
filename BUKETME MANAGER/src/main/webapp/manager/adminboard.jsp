<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.stream.Collector"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Random"%>
<%@page import="kr.co.ezenac.signup.SignUpDAO"%>
<%@page import="kr.co.ezenac.manager.VideoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="page" value="5" />
<% String[][] records = { 
			 { "../img/movie/dp.jpg", "DP", "공개", "2021-02-13", "81"}, 
			{ "../img/개미는 뚜뚠.png", "개미는 뚠뚠", "공개", "2021-02-13", "81"},
			{ "../img/국민 영수증.png", "국민 영수증", "공개", "2021-02-13", "43"},
			{ "../img/도시 어부.png", "도시 어부", "공개", "2021-11-01", "120"},
			{ "../img/어거스트 러쉬.png", "어거스트 러쉬", "공개", "2021-12-03", "20"},
			{ "../img/치코와 리타.png", "치코와 리타", "공개", "2021-11-03", "326"},
			{ "../img/movie/matrix.jpg", "매트릭스", "공개", "2021-01-08", "221"},
			{ "../img/movie/movetoheaven.jpg", "무브 투 해븐", "공개", "2021-12-01", "30"},
			{ "../img/movie/narcos.jpg", "narcos", "공개", "2021-02-03", "209"},
			{ "../img/movie/paperhouse.jpg", "종이의 집", "공개", "2021-12-11", "311"},
			{ "../img/movie/projectpower.jpg", "프로젝트 파워", "공개", "2021-11-01", "113"},
			{ "../img/Logo.png", "모가디슈", "공개", "2021-11-01", "999"}
	};  
Random rd = new Random();
request.setAttribute("rd", rd);
request.setAttribute("records", records);
int size = 0;

request.setCharacterEncoding("UTF-8");

SignUpDAO dao = SignUpDAO.getInstance();
List<VideoVO> videolist = dao.VideoList();
request.setAttribute("videolist", videolist);
/* pageContext.setAttribute("records", records);
size = records.length;
pageContext.setAttribute("size", size); */
pageContext.setAttribute("currentPage", request.getParameter("currentPage"));
if(request.getParameter("currentPage")==null){
	pageContext.setAttribute("currentPage", 1);
}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 제이쿼리 최신버전============================================================================================================================= -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- ===================================================================================================================================== -->

<!-- 참조 css ============================================================================================================================= -->
<link href="../css/managerCss/layout.css" rel="stylesheet">
<link href="../css/managerCss/adminboardlist.css" rel="stylesheet">
<!-- ===================================================================================================================================== -->

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

<title>컨텐츠 관리</title>
</head>
<body>    

	<%@ include file="../common/managerHeader.jsp" %>
	
	<div class="mainBox">
		<%@ include file="../common/managerSide.jsp" %>
		
		<div class="mainBoxInside">
			<div class="board_list_wrap">
				<div class="board_search">
					<div class="list_title">콘텐츠 업로드 리스트</div>
				</div>
				<div class="board_list">
					<div class="board_list_head">
						<div class="checkbox"><input type="checkbox" value=""></div>
						<div class="contents">제목</div>
						<div class="public">공개상태</div>
						<div class="date">날짜</div>
						<div class="view">조회수</div>
					</div>
					
<%-- 					<c:forEach var="video" items="${videolist}">
						            <div class="list-area" id = "list-area-${video.getVideoNum()}">
							            <h3 class="like">
							            	<c:out value="${video.getTitle()}" />
							            	<c:out value="공개" />
							            	<c:out value="${video.getOpenDate()}" />
							            	<c:out value="${video.getVideoHits()}" />
							            	
							            </h3>
						            </div>
					                </c:forEach> --%>
					
					
					<div class="board_list_body">
						<c:forEach var="record" items="${videolist}"  >
							<div class="item">
								<div class="checkbox"><input type="checkbox" value=""></div>
								<div class="contents">
									<a href="./AdminVideoManage.jsp"><img class="board_list_contentsimg" src='<c:out value="${records[rd.nextInt(12)][0]}" />'></a>
									<a href="javascript:;"><c:out value="${record.getTitle()}" /></a>
								</div>
								<div class="public"><c:out value="공개" /></div>
								<div class="date"><c:out value="${record.getOpenDate()}" /></div>
								<div class="view"><c:out value="0" /></div>
							</div>
						</c:forEach>										
					</div>
					
					
				</div>
<%-- 				<div class="paging">
					<a href="javascript:;" class="bt first">처음 페이지</a>
					<a href="javascript:;" class="bt prev">이전 페이지</a>
					
					<c:forEach begin="1" end="${Math.ceil(size/page)}" var="item">
						<a href="<c:url value="../manager/adminboard.jsp" >            
						<c:param name="currentPage" value="${item}"></c:param>
						</c:url>" class="num" 
							style="<c:if test = "${currentPage == item}"> font-weight:bold;</c:if>">
						<c:out value="${item}" /></a>
					</c:forEach>
					
					<a href="javascript:;" class="bt next">다음 페이지</a>
					<a href="javascript:;" class="bt last">마지막 페이지</a>
				</div> --%>
				
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<button class="btn btn-outline-secondary dropdown-toggle"
							type="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">제목</button>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">제목</a>
							
						</div>
					</div>
					<input type="text" class="form-control"
						aria-label="Text input with dropdown button">
				</div>
				
			</div>
		</div>
	</div>
	
</body>
</html>

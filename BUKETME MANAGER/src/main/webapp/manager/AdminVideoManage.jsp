<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.stream.Collector"%>
<%@page import="kr.co.ezenac.signup.SignUpDAO"%>
<%@page import="kr.co.ezenac.manager.VideoVO"%>
<%@page import="java.util.List"%>   
<%@page import="java.util.Arrays"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%  
request.setCharacterEncoding("UTF-8");  
   
SignUpDAO dao = SignUpDAO.getInstance();
List<VideoVO> listvideo = dao.ListVideo();
request.setAttribute("listvideo", listvideo);    
    
String videoFileName = request.getParameter("videoFileName"); 
String imageFileName = request.getParameter("imageFileName"); 
String title = request.getParameter("title"); 
String openDate = request.getParameter("openDate"); 
String director = request.getParameter("director"); 
String ageLimit = request.getParameter("ageLimit"); 
String actors = request.getParameter("actors"); 
String contents = request.getParameter("contents"); 

%>      
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콘텐츠 관리 - 수정, 삭제</title>
<link rel="stylesheet" href="../css/managerCss/AdminVideoManage.css">
<script type="text/javascript" src="../js/managerJS/selectBoxChange.js"></script>
</head>
<body>

<%@ include file="../common/managerHeader.jsp" %>

<div class="mainBox">
    
    <%@ include file="../common/managerSide.jsp" %>
    
    <div class="mainBoxInside">

		<div id="AdminPost">
			<div id="UpdateContentInfo">
			<form action="${pageContext.request.servletContext.contextPath}/VideoManage.do" method="post">
				<h1 class="info-title">컨텐츠 정보</h1>
								<div id="UploadThumbnail">
					<div id="Upload" class="button" onclick="onclick=document.all.file.click()">
						<h4>동영상 파일</h4>
						<!-- <div class="filebox" >
						    <label for="file1">파일찾기</label>
						</div>
						<input type="file" id="file1" class="movie_file" name="videoFileName" /><br><br> -->
						
 
						<div class="file_input_div">
						<input type="button" value="파일 찾기" class="file_input_button" />
						<input type="file" class="file_input_hidden" onchange="javascript: document.getElementById('file1').value = this.value" />
						</div>
						<input type="text" id="file1" class="file_input_textbox"  name="videoFileName" readonly="readonly" value="videoFileName">
					</div>
					
					
					
					<div id="Thumbnail" class="button" onclick="onclick=document.all.file.click()">
						<h4>영상 썸네일</h4>
						<!-- <div class="filebox">
						    <label for="file2">파일찾기</label>
						</div>
						<input type="file" id="file2" class="thumbnail_file" name="imageFileName"><br><br> -->
						
						<div class="file_input_div">
						<input type="button" value="파일 찾기" class="file_input_button" value=""/>
						<input type="file" class="file_input_hidden" onchange="javascript: document.getElementById('file2').value = this.value" />
						</div>
						<input type="text" id="file2" class="file_input_textbox"  name="imageFileName" readonly="readonly" value="imageFileName">
					</div>
				</div>
				<div id="ContentInfo">
					<div class="content-info-area">
						<div class="content-info-detail">
							<h4>제목</h4>
							<input id="MovieName" type="text" placeholder="제목" value="title">
							<h4>공개일</h4>
							<input id="ReleaseDate" type="text" placeholder="공개일" value="openDate">
							<h4>장르</h4>
							<select id="Genre" name="Category" onchange="showValue(this)">
			                    <option disabled selected>장르</option>
			                    <option value="1">한국 드라마</option>
			                    <option value="2">미국 시리즈</option>
			                    <option value="3">영국 드라마</option>
			                    <option value="4">아시아 드라마</option>
			                    <option value="5">유럽 시리즈</option>
			                    <option value="6">애니</option>
			                    <option value="7">코미디</option>
			                    <option value="8">로맨스</option>
			                    <option value="9">액션&어드벤처</option>
			                    <option value="10">스릴러</option>
			                    <option value="11">스포츠</option>
			                    <option value="12">SF&판타지</option>
			                    <option value="13">호러</option>
			                    <option value="14">범죄</option>
			                    <option value="15">버라이어티/예능</option>
			                    <option value="16">다큐시리즈</option>
			                    <option value="17">키즈</option>
			                </select>
			                <h4>취향</h4>
							<select id="Genre" name="likeCategory" onchange="showValue(this)">
			                    <option disabled selected>취향</option>
			                    <option value="18" >밝은분위기</option>
			                    <option value="19">스릴넘치는</option>
			                    <option value="20">달달한</option>
			                    <option value="21">잔잔한</option>
			                    <option value="22">역사적인</option>
			                    <option value="23">감동적인</option>
			                    <option value="24">외계인</option>
			                    <option value="25">괴물</option>
			                    <option value="26">귀신</option>
			                    <option value="27">초자연적인</option>
			                    <option value="28">시간여행</option>
			                    <option value="29">실화바탕</option>
			                </select>
						</div>
						
						<div class="content-info-detail">
							<h4>제작자</h4>
							<input id="Producer" type="text" placeholder="제작자" value="director">
							<h4>연령 제한</h4>
							<input id="Agelimit" type="text" placeholder="연령 제한" value="ageLimit">
							<h4>출연 배우</h4>
							<input id="actor" type="text" placeholder="배우 이름" value="actors">	
						</div>
					</div>
						
					<div class="content-intro">
						<h4>영화 소개</h4>
						<input id="MovieIntroduct" type="text" placeholder="영화 소개" value="contents">
					</div>
					
					<div class="content-btn-area">
						<input id="Check" class="content-btn" type="Submit" value="확인">
						<input id="Cancel" class="content-btn" type="reset" value="취소">
					</div>
					
				</div>
				</form>
			</div>
			
			<div id="ViewCountRatings">
				<div id="ViewCount">
					<h1 class="info-title">조회수</h1>
				    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
				    <script type="text/javascript">
				      google.charts.load('current', {'packages':['corechart']});
				      google.charts.setOnLoadCallback(drawChart1);
				
				      function drawChart1() {
				        var data = google.visualization.arrayToDataTable([
				          ['Month', '모가디슈'],
				          ['11월',  1000],
				          ['12월',  1170],
				          ['1월',  660],
				          ['2월',  1030]
				        ]);
				
				        var options = {
				          title: '월별 조회수',
				          curveType: 'function',
				          legend: { position: 'bottom' }
				        };
				
				        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
				
				        chart.draw(data, options);
				      }
				    </script>
				    <div id="curve_chart" style="width: 350px; height: 250px"></div>
					
				</div>
				
				<div id="Ratings">
					<h1 class="info-title">평점</h1>	
					<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
				    <script type="text/javascript">
				      google.charts.load('current', {'packages':['bar']});
				      google.charts.setOnLoadCallback(drawChart2);
				
				      function drawChart2() {
				        var data = google.visualization.arrayToDataTable([
				          ['Score', '평점 분포'],
				          ['5점', 1000],
				          ['4점', 1170],
				          ['3점', 660],
				          ['2점', 1030],
				          ['1점', 360]
				        ]);
				
				        var options = {
				          chart: {
				            title: '평점 Test',
				            subtitle: '점수별 평점 분포',
				          },
				          bars: 'horizontal' // Required for Material Bar Charts.
				        };
				
				        var chart = new google.charts.Bar(document.getElementById('barchart_material'));
				
				        chart.draw(data, google.charts.Bar.convertOptions(options));
				      }
				    </script>
				        <div id="barchart_material" style="width: 350px; height: 250px;"></div>
				</div>
				
			</div>
		</div>

	</div>
</div>

</body>
</html>
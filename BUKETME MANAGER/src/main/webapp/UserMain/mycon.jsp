<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 폰트 어썸 CDN=========================================================================================================================================================================================================================================== -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- ===================================================================================================================================================================================================================================================== -->

<!-- ==================================================================================================================================================================================================================================================================================== -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://stephenpontes.com/misc/permanent/jquery.flexslider-min.js" type="text/javascript"></script>
	<script type="text/javascript" src="../js/maincontentslist.js"></script>
<!-- ==================================================================================================================================================================================================================================================================================== -->

<!-- 참조 slick(슬라이드)파일 경로======================================================================================================================================================================================================================================================================= -->
	<link rel="stylesheet" type="text/css" href="../css/slick/slick.css"/>
	<link rel="stylesheet" type="text/css" href="../css/slick/slick-theme.css"/>
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript" src="../css/slick/slick.min.js"></script>
	<script type="text/javascript" src="../js/maincontentslist.js"></script>
<!-- 참조 slick(슬라이드)파일 경로======================================================================================================================================================================================================================================================================= -->

<!-- 참조 css파일 경로======================================================================================================================================================================================================================================================================= -->
	<link href="../css/UserMainCss/mycon.css" rel="stylesheet">
	<link href="../css/UserMainCss/moviemodal.css" rel="stylesheet">
<!-- ==================================================================================================================================================================================================================================================================================== -->
<title>마이 콘텐츠</title>
</head>
<body>

<!--==============모달창 폼======================================================================================  -->
	<a href="#x" class="overlay" id="moviedetail"></a>
	<div class="popup">
<!-- 		<div class="popup_wrapper"> -->
			<div class="modalvideo">
				<video class="trailers" muted="muted" controls="controls" autoplay="autoplay" loop="loop">
					<source src="../video/mainpagebackground/spider.mov" type="video/mp4">
				</video>
			</div>
			<div class="explain_wrapper">
				<div class="modalvideo_explain">
					<p>
						‘미스테리오’의 계략으로 세상에 정체가 탄로난 스파이더맨 ‘피터 파커’는 하루 아침에 평범한 일상을 잃게 된다.
						문제를 해결하기 위해 ‘닥터 스트레인지’를 찾아가 도움을 청하지만 뜻하지 않게 멀티버스가 열리면서 각기 다른 차원의 불청객들이 나타난다.
						‘닥터 옥토퍼스’를 비롯해 스파이더맨에게 깊은 원한을 가진 숙적들의 강력한 공격에 ‘피터 파커’는 사상 최악의 위기를 맞게 되는데…
					</p>
				</div>
				<div class="modalvideo_explain2">
					<p>출연 : 톰 홀랜드, 토비 매과이어, 앤드류 가필드...</p>
					<p>장르 : SF 영화, 미국 영화, 액션&어드벤처</p>
					<p>영화 특징 : 긴장감 넘치는, 흥미진진</p>
					<div class="button_wrapper">
						<button onclick="location.href='usermain.jsp'" type="button" class="modalbtn"><i class="fas fa-exclamation-circle"></i> 상세 정보</button>
					</div>
				</div>
			</div>
<!-- 		</div> -->
            <a class="close" href="#close"></a>
    </div>
<!--==============모달창 폼======================================================================================  -->


<%-- 	<%@ include file="../UserHeader/header.jsp" %> --%>
	<div class="main_wrapper">
<!-- 	<div class="main_wrapper"> -->
		<h1>마이 콘텐츠</h1>
		<div class="movie_list_wrapper">
			<div class="usermovie_list">
				<div class="movie_list_title">
					<div>
					<a href="javascript:;" target="_blank">
						홍길동님이 시청 중인 콘텐츠 >		
					</a>
					<a class="more" href="javascript:;" target="_black"> 모두 보기</a>
					</div>
				</div>
				<div class="movie_contents_list">
					<a href="#moviedetail" id="moviedetail">
						<img class="imgsize" src="../img/movie/dp.jpg">
					</a>
					<a href="#moviedetail" id="moviedetail">
						<img class="imgsize" src="../img/movie/레인.jpg">
					</a>
					<a href="#moviedetail" id="moviedetail">
						<img class="imgsize" src="../img/movie/설국열차.jpg">
					</a>
					<a href="#moviedetail" id="moviedetail">
						<img class="imgsize" src="../img/movie/헌터스.jpg">
					</a>
					<a href="#moviedetail" id="moviedetail">
						<img class="imgsize" src="../img/movie/고요의바다.jpg">
					</a>
					<a href="#moviedetail" id="moviedetail">
						<img class="imgsize" src="../img/movie/지옥.jpg">
					</a>
				</div>
			</div>
		</div>
		
				<div class="movie_list_wrapper">
			<div class="put_list">
				<div class="movie_list_title">
					<div>
					<a href="javascript:;" target="_blank">
						아직 찜한 콘텐츠가 없습니다.			
					</a>
					<a class="more" href="javascript:;" target="_black"> 모두 보기</a>
					</div><br><br><br><br><br><br>
					<!--
					<div>
					<a class="more" href="javascript:;" target="_black"> 모두 보기</a>
					</div>
					-->
				</div>
				<div class="movie_contents_list">
					<a href="#" target="_blank">
						<img class="" src="">
					</a>	
				</div>
			</div>
		</div>
		
				<div class="movie_list_wrapper">
			<div class="finish_list">
				<div class="movie_list_title">
					<div>
					<a href="javascript:;" target="_blank">
						내가 시청 완료한 콘텐츠 >		
					</a>
					<a class="more" href="javascript:;" target="_black"> 모두 보기</a>
					</div>
				</div>
				<div class="movie_contents_list">
					<a href="#moviedetail" id="moviedetail">
						<img class="imgsize" src="../img/movie/범인은바로너.jpg">
					</a>
					<a href="#moviedetail" id="moviedetail">
						<img class="imgsize" src="../img/movie/승리호.jpg">
					</a>
					<a href="#moviedetail" id="moviedetail">
						<img class="imgsize" src="../img/movie/새콤달콤.jpg">
					</a>	
				</div>
			</div>
		</div>
		
		
	</div>
	<!-- 123 -->
	<%-- <%@ include file="../footertest.jsp" %> --%>
</body>
</html>
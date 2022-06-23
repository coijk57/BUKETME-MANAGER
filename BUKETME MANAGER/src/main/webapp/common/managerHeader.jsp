<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="../css/managerCss/style.css" />
	<title>매니저 헤더</title>
</head>
<body>

	<div class="header">
	    <a href="#" class="logo-area">
	        <span class="logo-icon">
	            BuketMe
	        </span>
	    </a>
	    <div class="title-bar__column">
	        <div class="searchBox">
	            <input class="searchText" type="text" placeholder="search">
	            <a class="searchBtn" href="#">
	                <span class="userTitleIcon color">
	                    <i class="fas fa-search fa-lg">
	                    </i>
	                </span>
	            </a>
	        </div>
	        <span class="userTitleIcon"><img src="../img/man.png" class="userProfileImage"></span>
	        <span class="userTitleIcon">
	                <div class="dropDownBox">
	                  <button class="dropDownbtn">
	                    <i class="fas fa-caret-down fa-lg" id="downIcon"></i>
	                  </button>
	                  <div class="dropDownContent">
	                    <a href="#"><img src="../img/man.png" class="userProfileImageSub"> 홍길동</a>
	                    <a href="#">프로필 관리</a>
	                    <a href="#">마이페이지</a>
	                    <a href="#">고객센터</a>
	                    <a href="#">로그아웃</a>
	                  </div>
	                </div>
	            </span>
	    </div>
	</div>

<script
        src="https://kit.fontawesome.com/6478f529f2.js"
        crossorigin="anonymous">
</script>
</body>
</html>
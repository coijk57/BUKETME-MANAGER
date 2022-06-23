<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="../css/managerCss/style.css" />
	<title>매니저 사이드바</title>
</head>
<body>

	<div class="sideBox">
        <div class="toDoListBox">
            <h3 class="toDoListTitle">TO DO LIST</h3>
            <div id="todoList"></div>
            <div id="completedList" class="completedList"></div>
            <div class="insetToDoListBox">
                <button type="button" id="plusList" class="plusList">+</button>
                <input
                        id="insertText"
                        class="insertText"
                        placeholder="toDoList"
                />
            </div>
        </div>
        <div class="navigationBar">
            <ul class="navMenu">
                <li class="Menu"><a class="MenuLink" href="../manager/adminDashBoard.jsp">대시 보드</a></li>
                <li class="Menu"><a class="MenuLink" href="../manager/adminboard.jsp">콘텐츠 관리</a></li>
                <li class="Menu">
                    <a class="MenuLink" href="../manager/boardList.jsp">
                        <span class="notificationPoint"></span>
                        Q&A
                    </a>
                </li>
                <li class="Menu"><a class="MenuLink" href="../manager/membership.jsp">회원관리</a></li>
                <li class="Menu"><a class="MenuLink" href="../manager/manager2.jsp">관리기록</a></li>
            </ul>
        </div>
    </div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="../js/managerJS/toDoList.js"></script>

</body>
</html>
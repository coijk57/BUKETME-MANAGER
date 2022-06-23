<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="../css/loginCss/signup.css">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="../js/loginJS/signup.js"></script>
<script type="text/javascript" src="../js/loginJS/membership.js"></script>

</head>
<body>
	<div id="wrapper">
		<div class="signup-wrapper">

			<%@ include file="../common/loginHeader.jsp"%>

			<div class="content">
				<div class="signup-body">
					<div class="signup-content">
						<form
							action="${pageContext.request.servletContext.contextPath}/signup.do" method="post">
							<div class="signup-form-main">
								<section>
									<h1 class="title">회원가입</h1>
								</section>

								<section>
									<h4>이메일</h4>
									<input type="text" class="input-field" name="email"
										placeholder="이메일을 입력하세요." required>
									<h4>비밀번호</h4>
									<input type="password" class="input-field" name="password"
										placeholder="●●●●●●●●" required>
									<h4>비밀번호 확인</h4>
									<input type="password" class="input-field"
										placeholder="●●●●●●●●" required>
									<h4>이름</h4>
									<input type="text" class="input-field" placeholder="이름을 입력하세요." name="name"
										required>
									<h4>전화번호</h4>
									<input type="text" class="input-field" name="phoneNumber"
										placeholder="010-****-****" required> <!-- <input
										type="button" class="button" value="인증번호 받기"> <input
										type="text" class="input-field btn-field"
										placeholder="인증번호를 입력하세요" required> <input
										type="button" class="button" value="확인"> -->
									<div class="gen" >
									   <input type="hidden" class="gender-input" name="gender">
										<h4>성별</h4>
										<h2 class="gender male">남자</h2>
										<h2 class="gender female">여자</h2>
									</div>
									<br>
									<br>
									<br>

									<div class="bir">
										<h4>생년월일</h4>
										<span class="birth-area" style="display: flex;"> <span
											class="signup-input-birth"> <input
												id="signup-birth-yy" type="text" placeholder="년(4자)" name="year"></input>
										</span> <span class="signup-input-birth" style="margin-left: 10px;">
												<select id="signup-birth-mm" class="selectbox" name="month"
												onchange="">
													<option value="month">월</option>
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
													<option value="9">9</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
											</select>
										</span> <span class="signup-input-birth" style="margin-left: 10px;">
												<input id="signup-birth-dd" type="text" placeholder="일" name="day"></input>
										</span>
										</span>
									</div>
								</section>
							</div>

							<div class="signup-form-detail device-area">
								   <input type="hidden" class="device-input" name="instrument">
								<h3 class="detail-comment">자주 이용하는 기기를 선택해주세요.</h3>
                        <ul class="device-list">
                            <li class="list-item TV">
                                <img class="device-img" width="800" height="400" alt="TV" data-ll-status="loaded" src="https://cnbl-cdn.bamgrid.com/assets/00fb59319fa715222100d8a84d11bc7e23a42970b4f413c9e85166d0cfba9346/original">
                                <h3>TV</h3>
                            </li>
                            <li class="list-item COM">
                                <img class="device-img" width="800" height="400" alt="Computer" data-ll-status="loaded" src="https://cnbl-cdn.bamgrid.com/assets/d73b7c534afd2af2a454dbd47bd6c766c70e334ce8137084e9cd25c2644dd267/original">
                                <h3>컴퓨터</h3>
                            </li>
                            <li class="list-item TABLET">
                                <img class="device-img" width="800" height="400" alt="Mobile Table" data-ll-status="loaded" src="https://cnbl-cdn.bamgrid.com/assets/66475056e769443ef9a491a48dfa44059c8964890ae9ef7c4f69f322693c59d8/original">
                                <h3>스마트폰 & 태블릿</h3>
                            </li>
                            <li class="list-item CONSOLE">
                                <img class="device-img" width="800" height="400" alt="Game Console" data-ll-status="loaded" src="https://cnbl-cdn.bamgrid.com/assets/51b639d2ebe97ee175975c29d42a90b0e043713856db8e5d6d9fb87b2b3a48c0/original">
                                <h3>게임 콘솔</h3>
                            </li>
                        </ul>
							</div>			
							<div class="signup-button-area">
									<input class="button first-button" type="submit" value="다음" />
									<input class="button" type="button" value="취소" />
								</div>
						</form>
					</div>
				</div>
			</div>

			<%@ include file="../common/footer.jsp"%>

		</div>
	</div>
</body>
</html>
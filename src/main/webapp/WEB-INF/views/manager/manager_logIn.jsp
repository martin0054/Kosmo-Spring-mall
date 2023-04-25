<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../setting.jsp"%>

<html>
<meta charset="utf-8" name="viewport"
	content=" width = divice-width, initial-scale=1">
<body onload="m_logInFocus();">
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<%@ include file="../form/header.jsp"%>
	<%@ include file="../form/left_layout_introduce.jsp"%>


	<!--  body   -->
	<div class="wrap">
		<div class="body">
			<div>
				<a><img src="${path}images/방문ㄳ.JPG"></a>
			</div>
			<div style="height: 30px"></div>

			<hr width="800px" align="center">

			<div style="height: 40px"></div>

			<!-- 로그인 -->
			<div class="login">
				<form action="loginPro.ma" method="post" name="m_logInform"
					onsubmit="return m_logInCheck();"  class="login_form">
					<c:if test="${sessionScope.maId == null}">
						<!-- 첫 진입 , 로그인 실패 -->
						<table>

							<p class="h_log" align="center">로 그 인</p>

							<tr>
								<th colspan="2">
									<c:choose>
										<c:when test="${selectCnt == -1}">
											<!-- 로그인 실패  -->
											비밀번호가 틀렸습니다. 다시 확인해주세요.😥😥
										</c:when>
	
										<c:when test="${selectCnt == 0}">
											<!-- 비가입  -->
											존재하지 않는 아이디입니다. 다시 확인해주세요.😥😥 
										</c:when>
	
										<c:when test="${selectCnt == 2}">
											<!-- 방문한 경우, 로그아웃   -->
											😍방문을  환영합니다.🎉
										</c:when>
	
										<c:otherwise>
											😫😫뭔가 문제가 있는게야 😫😫
										</c:otherwise>
									</c:choose>
								</th>
							</tr>
							<tr>
								<td><input id="userId" type="text"  placeholder="ID" type="text" name="id"
									maxlength="20"></td>
							</tr>
							<tr>
								<td><input id="userPwd" type="password"  placeholder="Password"  type="text" name="pwd"
									maxlength="20"></td>
							</tr>
							<tr>
								<!-- submit인 경우 폼에서 액션으로 지정한 페이지"loginPro.do"로 이동 
						button인 경우  "window.location='signInForm.do'" 지정해서 이동한다.-->
								<th colspan="2" >
									<input class="button" type="submit"	value="로그인" id="submit"> 
								</th>
							</tr>
							<tr>
								<th  colspan="2" >
									<input class="button" type="button" value="고객" id=manager
									onclick="window.location='logIn.do'">
								</th>
							</tr>
						</table>
					</c:if>

					<c:if test="${sessionScope.maId != null}">
						<!-- 로그인 성공, 로그아웃, 회원탈퇴, 회원정보 수정 -->
						<table>
							<tr>
								<td align="center" style="width: 300px"><span>${sessionScope.maId}</span>님
									안녕하세요!</td>
							</tr>
							<tr>
								<th>
									<input class="button" type="button" value="로그아웃"
									onclick="window.location='logout.do'">
								</th>
							</tr>
						</table>
					</c:if>
				</form>
			</div>

		</div>
	</div>
	<!-- body 끝 -->

	<%@ include file="../form/footer.jsp"%>
</body>
</html>
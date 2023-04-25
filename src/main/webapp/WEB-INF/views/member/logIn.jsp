<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../setting.jsp" %>

<html>
<script src="${path}js/save_cookie.js">
  $(document).ready(function(){
	    var userInputId = getCookie("userInputId");//저장된 쿠기값 가져오기
	    $("input[name='id']").val(userInputId); 
	     
	    if($("input[name='id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
	                                           // 아이디 저장하기 체크되어있을 시,
	        $("#idSaveCheck").prop("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	     
	    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 발생시
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
	            var userInputId = $("input[name='id']").val();
	            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("userInputId");
	        }
	    });
	     
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("input[name='id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            var userInputId = $("input[name='id']").val();
	            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	        }
	    });
	});
	 
</script>
<body onload="logInFocus();">
	<%request.setCharacterEncoding("UTF-8");%>
	
<%@ include file="../form/header.jsp"%>
<%@ include file="../form/left_layout_introduce.jsp"%>

	<div class="wrap">
		<div class="body">
			<div class = "banner">
				<div class="banner1"> 회원 가입  </div>
				<div class="banner2"> 회원 가입을 합시다!</div>
			</div>
		<div style="height:40px"></div>

		<hr width="800px" align="center">

		<div style="height: 40px"></div>

			<!-- 로그인 -->
			<div class="login">
				<form action="loginPro.do" method="post" name="logInform"
					onsubmit="return logInCheck();"  class="login_form">
					<c:if test="${sessionScope.memId == null}">
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
	
										<c:when test="${selectCnt == 1}">
										<!-- 회원가입 성공한 경우 -->
											회원가입을 축하합니다. 로그인하세요. 
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
								<td>
									<input id="userId" type="text"  placeholder="ID" type="text" name="id" maxlength="20" autocomplete="off">
								</td>
							</tr>
							<tr>
								<td><input id="userPwd" type="password"  placeholder="Password"  type="text" name="pwd" maxlength="20"></td>
							</tr>
							
						</table>
						
						<table>
						
					</table>
						
						<table>	
							<tr>
								<th colspan="2">
									<input class="button" type="submit"	value="로그인" id="submit"> 
									아이디 저장 <input type="checkbox" id="idSaveCheck"> 
								</th>
							</tr>
							<tr>
							 	<th colspan="2" align="center">
									<input class="button" type="button" value="회원가입" id="welcom" 
									onclick="window.location='signInForm.do'">
									<input class="button" type="button" value="관리자" id=manager
									onclick="window.location='manager_logIn.ma'">
								</th>
							</tr>
						</table>
					</c:if>

					<c:if test="${sessionScope.memId != null}">
					<input type="hidden" id="id" value="${sessionScope.memId}">
						<!-- 로그인 성공, 로그아웃, 회원탈퇴, 회원정보 수정 -->
						<script type="text/javascript">
							alert(document.getElementById("id").value + " 님반갑습니다!");
							window.location="0_Main.do";
						</script>
					</c:if>
				</form>
			</div>

		</div>
	</div>
	<!-- body 끝 -->

	<%@ include file="../form/footer.jsp"%>
</body>
</html>
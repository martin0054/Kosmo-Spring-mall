<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../setting.jsp" %>

<html>
<body onload="findPwdFocus();">

	<%request.setCharacterEncoding("UTF-8");%>
	
<%@ include file="../form/header.jsp"%>
<%@ include file="../form/left_layout_introduce.jsp"%>

<div class="wrap">
	<div class="body">
		<div class = "banner">
			<div class="banner1"> pwd 찾기   </div>
			<div class="banner2"> pwd 를 잊으셨나요?</div>
		</div>
	<div style="height:40px"></div>

	<hr width="800px" align="center">

	<div style="height: 40px"></div>

	<c:choose>
		<c:when test="${pwd=='not'}">
			<script type="text/javascript">
			errorAlert("이메일 인증 실패하였습니다. 메일을 다시 확인하세요");
			</script>
		</c:when>
		
		<c:when test="${not empty pwd}">
			<script type="text/javascript">
				alert("이메일 인증 성공!\n회원님의 비밀번호는 ${pwd}입니다.!");
				window.location='logIn.do';
			</script>
			
		</c:when>
		
		<c:otherwise>
		<form class="login_form" action="findPwdPro.do" method="post" name="findPwd" >
			<input type="hidden" name="obtain" value="${obtain}">
			<input type="hidden" name="hiddenEmail" value="0">
			
			<table class ="hi">
				<tr>
					<th class="ess">아이디를 입력하세요</th>
					<td class="tb2"><input id="userId" type="text" name="memId"></td>
				</tr>
				
				<tr>
					<th class="ess">이메일을 입력하세요</th>
					<td class="tb2">
		           		<input id="userPwd" class="input" type="text" name="email1"	maxlength="50" style="width: 150px" placeholder ="메일입력" >
		               	@ 
						<input id="userPwd" class="input" type="text" name="email2" maxlength="20" style="width: 150px">
						
		                <select class="input" name="email3" onchange="selectEmailChk2();">
							<option value="0">직접입력</option>
							<option value="naver.com">네이버</option>
							<option value="gmail.com">구글</option>
							<option value="nate.com">네이트</option>
							<option value="daum.net">다음</option>
						</select>
						<input type="button" class="button" value="이메일 인증" onclick="findPwdCheck();">
					</td>
				</tr>
				<tr>
					 <th class="ess">메일 인증 확인 //${obtain}// </th>
	 				 <td class="tb2">
	 				 	<input id="userId" type="text" name="mailOk" size="10"style="width: 150px">
	 					<input type="button" class="button" value="이메일 인증확인" onclick="mailCo1();">
 					 </td>
				</tr>	
				<tr>
					<th colspan="2">
						<input class="button" type="submit"  value="비밀번호 찾기">
						<input class="button" type="reset" value="취소" onclick="self.close()">
					</th>								
				</tr>
			</table>
		</form>	
		</c:otherwise>
	</c:choose>

	</div>
</div>

	<%@ include file="../form/footer.jsp"%>
</body>
</html>
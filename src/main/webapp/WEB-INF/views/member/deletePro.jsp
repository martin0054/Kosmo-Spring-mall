<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>

<html>
<body>
	<h2>회원탈퇴 - 처리페이지</h2>
	
	<!-- id, pwd 일치 -->	
	<c:if test="${selectCnt==1}">
	
		<!-- 삭제 실패 -->
		<c:if test="${deleteCnt==0}">
			<script type="text/javascript">
				errorAlert(msg_deleteError)
			</script>
		</c:if>
		
		<!-- 삭제 성공 - 세션삭제 => selectCnt = 2(방문환영) => main,jsp로 이동  -->
		<c:if test="${deleteCnt!=0}">
		<%
			request.getSession().invalidate(); //모든 세션 삭제 
		%>	
			<script type="text/javascript">
				setTimeout(function(){
					alert("탈퇴처리 되었습니다.");
					window.location="main.do"; //selectCnt ==2(컨트롤러 49~52행)
				},1000);
			</script>
		
		</c:if>
	</c:if>
	
	<!-- id, pwd 불일치  -->	
	<c:if test="${selectCnt!=1}">
		<script type="text/javascript">
				errorAlert(msg_passwdError);
		</script>
	</c:if>
</body>
</html>
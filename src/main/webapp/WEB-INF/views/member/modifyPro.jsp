<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../setting.jsp" %>

<html>
<body>
	<h2>회원정보 수정  - 처리페이지</h2>

	<!-- update실패 -->
	<c:if test="${updateCnt==0 }">
		<script type="text/javascript">
		errorAlert(msg_updateError);
		</script>
	</c:if>
	
	<!-- update성공 --> 
	<c:if test="${updateCnt!=0 }">	
	<script type="text/javascript">
			setTimeout(function(){
				alert("회원정보가 수정 되었습니다.");
				window.location="main.do"; 
			},1000);
		</script>
	</c:if>

</body>
</html>
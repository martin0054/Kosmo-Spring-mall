<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<html>
<body>
	<c:if test="${cnt==1}">
		<script type="text/javascript">
			setTimeout(function() {
				alert("이메일 인증에 성공하였습니다.");
				window.location="main.do";
			}, 500);
		</script>
	</c:if>

	<c:if test="${cnt!=1}">
	<script type="text/javascript">
		errorAlert("이메일 인증에 실패하였습니다. 잠시 후 다시 시도해주세요.");
	</script>
	</c:if>
</body>
</html>
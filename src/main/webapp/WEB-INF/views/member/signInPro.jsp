<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>

<html>
<body>
	<c:if test="${insertCnt ==0 }">
		<script type="text/javascript">
		errorAlert(msg_insertError);
		</script>
	</c:if>	
	
	<!-- insert성공 => main에 selectCnt == 1 가지고 간다. -->
	<c:if test="${insertCnt !=0 }">
		<c:redirect url="mainSuccess.do?insertCnt=${insertCnt}"/>
	</c:if>	
</body>
</html>
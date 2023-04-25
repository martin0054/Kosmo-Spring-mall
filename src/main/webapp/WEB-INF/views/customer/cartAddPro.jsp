<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../setting.jsp" %>
<html>
<body>
	<c:if test="${insertCnt>=1}">
		<script type="text/javascript">
			setTimeout(function() {
				if(confirm("장바구니에 담겼습니다. 확인하시겠습니까?")){
					window.location="cartList.by";
				} else {
					window.history.back();
				}
			}, 500);
		</script>
	</c:if>

	<c:if test="${insertCnt!=1}">
	<script type="text/javascript">
		errorAlert(msg_cartAddError);
	</script>
	</c:if>
</body>
</html>
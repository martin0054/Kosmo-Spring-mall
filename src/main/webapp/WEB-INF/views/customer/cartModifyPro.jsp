<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../setting.jsp" %>
<html>
<body>
	<c:if test="${updateCnt>=1}">
		<script type="text/javascript">
			setTimeout(function() {
				alert("장바구니 수량이 변경되었습니다.");
				window.location="cartList.by";
			}, 500);
		</script>
	</c:if>

	<c:if test="${updateCnt!=1}">
	<script type="text/javascript">
		errorAlert(msg_cartModifyError);
	</script>
	
	
	</c:if>
</body>
</html>
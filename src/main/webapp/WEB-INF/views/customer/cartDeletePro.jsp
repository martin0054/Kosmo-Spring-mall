<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../setting.jsp" %>
<html>
<body>
	<c:if test="${deleteCnt>=1}">
		<script type="text/javascript">
			setTimeout(function() {
				if(confirm("장바구니에서 삭제 되었습니다. 확인하시겠습니까?")){
					window.location="cartList.by";
				} else {
					window.location="mainMenu.do";
				}
			}, 500);
		</script>
	</c:if>

	<c:if test="${deleteCnt!=1}">
	<script type="text/javascript">
		errorAlert(msg_cartDeleteError);
	</script>
	</c:if>
</body>
</html>
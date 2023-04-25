<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../setting.jsp" %>
<html>
<body>
	<c:if test="${BuyRefundCnt >=1}">
		<script type="text/javascript">
			setTimeout(function() {
				if(confirm("환불요청이 취소되었습니다. 확인하시겠습니까?")){
					window.location="stateSelect.by?state_code=2";
				} else {
					window.history.back();
				}
			}, 500);
		</script>
	</c:if>

	<c:if test="${BuyRefundCnt!=1}">
	<script type="text/javascript">
		errorAlert(msg_buyRefundCancelError);
	</script>
	</c:if>
</body>
</html>
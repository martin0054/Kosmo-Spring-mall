<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../setting.jsp" %>
<html>
<body>
	<c:if test="${buyCnt ==0 || buyCnt ==null }">
		<!-- 재고수량0 -->
		<c:if test ="${stockCount==0}">
			<script type="text/javascript">
				errorAlert("매진 되었습니다. \n관리자에 문의하세요")
				window.history.back();
			</script>
		</c:if>
		<!-- 재고 존재  -->
		<c:if test ="${stockCount!=0}">
			<script type="text/javascript">
				errorAlert(${stockCount} + "개 구매 가능합니다. \n다시 입력하세요.")
				window.history.back();
			</script>
		</c:if>
	</c:if>

	<c:if test="${buyCnt ==1 && buyCnt !=null}">
		<script type="text/javascript">
			setTimeout(function() {
				if(confirm("주문되었습니다. 확인하시겠습니까?")){
					window.location="orderList.by";
				} else {
					window.history.back();
				}
			}, 500);
		</script>
	</c:if>







</body>
</html>
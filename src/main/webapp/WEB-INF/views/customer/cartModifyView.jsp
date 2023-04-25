<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../setting.jsp"%>

<html>
<meta charset="utf-8" name="viewport"
	content=" width = divice-width, initial-scale=1">
<script src = "/0_lee.hanrim.dakbal/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">



//장바구니 변경
function modifyCart(count){
	
	var s_no = parseInt($("s_no " + count)).val();
	var cartCount = parseInt($("c_count " + count)).val();
	alert(" s_no : " + s_no);
	alert(" cartCount : " + cartCount);
	
	var amount = /^[0-9]{1,4}$/;
	var countChk = amount.test(cartCount);
	
	if (cartCount == 0) {
		alert("수량을 잘못 입력하였습니다.12");
		return false;
	}
	else if (!countChk) {
		alert("수량을 잘못 입력하였습니다11.");
		
		return false;
	}
	document.cartListForm.action="cartModifyPro.by";
		
	document.cartListForm.submit();
} 
</script>
<body>

<form action="carModifyPro.by" method="post" name="carModifyForm" >
	<fieldset style="width : 300px;">
	<label>수량 변경 </label>
	<table>
		<tr>
			<th>상품이름</th>
			<td> ${cdto.s_name}</td>
		</tr>
		<tr>
			<th>상품가격</th>
			<td > <fmt:formatNumber type="number" maxFractionDigits="3" value="${cdto.s_price*1.2}" />원</td>
			
		</tr>
		<tr>
			<td align="right">수량 변경</td><td><input type="number" name="modyC_count" min="0" value="${vo.c_Count}" required></td>
		</tr>
		<tr>
			<th>총액</th>
			<td> <fmt:formatNumber type="number" maxFractionDigits="3" value="${cdto.s_price*1.2*cdto.c_count}" />원</td>
		</tr>
		
		<tr>
			<td colspan="4"align="center">
				<input type = "submit" class="button" value="완료">
				<input type = "button" class="button" value="닫기" onclick="self.close();">
			</td>
		</tr>
	</table>
	</fieldset>
</form>
	
<%@ include file="../form/footer.jsp"%>
</body>
</html>
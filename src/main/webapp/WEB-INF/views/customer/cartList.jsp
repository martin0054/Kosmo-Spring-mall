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

<% request.setCharacterEncoding("UTF-8"); %>
	
<%@ include file="../form/header.jsp"%>
<%@ include file="../form/left_layout_mypage.jsp"%>

<div class="wrap">
	<div class = "body">
		<div class = "banner">
			<div class="banner1"> 장바구니 목록 을 조회 합시다!.! </div>
			<div class="banner2">장바구니 목록 을 조회 합시다!.!</div>
		</div>
		<div style="height:50px"></div>
		
		<table style="width:900px" align="center" class="cartTbl">
		<tr>
			<th colspan="6" align="center" style="height:25px">
				장바구니 목록(상품 수량 : ${cnt}) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</th>
		</tr>
		
		<tr>
			<th style="width:50px">
				선택<input type="checkbox" name="allCheck" onclick="allChk(this);">
			</th>
			<th style="width:50px"> 번호</th>
			<th style="width:100px">고객 아이디</th>
			<th style="width:100px">상품이름</th>
			<th style="width:100px">상품가격</th>
			<th style="width:100px">수량</th>
			<th style="width:100px">총 가격</th>
		</tr>	

		<c:if test="${cnt>0}">
		
		<form method="post" name="cartListForm" >
			
			<c:forEach var ="cdto" items="${cdtos}" varStatus="status">
				<input type="hidden" name="s_no" id="s_no" value="${cdto.s_no}">
				<input type="hidden" name="s_price" id="s_price" value="${cdto.s_price}">
				<input type="hidden" name="sell_price" value="${cdto.s_price*1.2}">
				<input type="hidden" name="s_takedate" value="${cdto.s_takedate }">
				<input type="hidden" name="c_no" id = "c_no" value="${cdto.c_no}">
				<input type="hidden" name="totalPrice" value="${cdto.s_price*1.2*cdto.c_count}">
		<tr>
			<td style="width:50px">
			<input type="checkbox" name="check" value="${cdto.c_no}">
			 </td>
			 <td style="width:50px">	
			 	${number}	
				<c:set var="number" value="${number-1}"/>
			</td>
			<td style="width:100px;"> ${cdto.m_id}</td>
			<td style="width:100px;"> ${cdto.s_name}</td>
			<td style="width:100px;"> <fmt:formatNumber type="number" maxFractionDigits="3" value="${cdto.s_price*1.2}" />원</td>
			<td> 
				 <input type ="text" name="c_count" id="c_count" readonly  value="${cdto.c_count}"style="width:50px;" >개
				 <input type = "button" value="변경" id="mody" onclick = "window.open('cartModifyView.by','수량변경','menubar=no width=500 height=600');">
			</td>
			<td> <fmt:formatNumber type="number" maxFractionDigits="3" value="${cdto.s_price*1.2*cdto.c_count}" />원</td>
		</tr>	
			</c:forEach>
		</form>
		<tr>
			<td>
				<input type = "button" class="button" value="구매" onclick = "return cartBuy();">
			</td>
			<td>
			</td>
			<td>
				<input type = "button" class="button" value="삭제" onclick = "return cartdelete();">
			</td>
			<th>
				<input class="button" type="button" value="더 담을래!"
				onclick="window.location='mainMenu.do'">
			</th>
		</tr>	
		</c:if>
			
		<c:if test="${cnt < 1}">
		<tr><th>&nbsp;</th></tr>
		<tr><th>&nbsp;</th></tr>
		
		<tr>
			<th colspan="6" align="center">장바구니에 추가 된 상품이 없습니다.
				<input class="button" type="button" value="추가 하고 싶다!"
				onclick="window.location='mainMenu.do'">
							</th>
			
		</tr>
		</c:if>
		
	</table>

	<!-- 페이지 컨트롤  -->
	<table style="width:1000px" align="center">
		<tr>
			<th align="center">
				<c:if test="${cnt>0 }">
					<!-- 처음[◀◀] /이전 블록 [◀] -->
					<c:if test="${startPage > pageBlock }">
						<a href="cartList.by">[ ◀◀ ]</a>
						<a href="cartList.by?pageNum=${startPage-pageBlock }">[ ◀  ]</a>
					</c:if>
					
					<!-- 블록내의 페이지 번호  -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i ==  currentPage}">
							<span><b>[${i}]</b></span>
						</c:if>
						
						<c:if test="${i !=  currentPage}">
							<a href="cartList.by?pageNum=${i}">[${i}]</a>
						</c:if>
					</c:forEach>
					
					<!-- 다음 블록 [▶] /마지막  [▶▶] -->
					<c:if test="${pageCount > endPage }">
						<a href="cartList.by?pageNum=${startPage+pageBlock }">[ ▶ ]</a>
						<a href="cartList.by?pageNum=${pageCount}">[ ▶▶ ]</a>
					</c:if>
					
				</c:if>
			</th>
		</tr>
	</table>
	
	</div>
</div>
	
<%@ include file="../form/footer.jsp"%>
</body>
</html>
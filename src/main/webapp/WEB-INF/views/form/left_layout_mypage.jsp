<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../setting.jsp"%>

<html>
<body >
<% request.setCharacterEncoding("UTF-8"); %>
	
<div style="height:30px;clear:both"></div>

<div class="wrap">
	<div class ="left_layout">
		<div><h2>마이 페이지</h2></div>
		<ul>
			<li><a href="">회원정보</a></li>
			<li><a href="modifyForm.do">회원정보수정</a></li>
			<li><a href="deleteForm.do">회원탈퇴</a></li>
			<li><a href="cartList.by">장바구니</a></li>
			<li><a href="orderList.by">주문조회</a></li>
		</ul>
	
		<div style="padding-top:80px;padding-bottom:40px"><img src="${path}images/소개/C_S.JPG"></div>
		<div style="padding-bottom:40px"><a href=""><img src="${path}images/소개/입금.JPG"></a></div>
	</div>
</div>
	


</body>
</html>
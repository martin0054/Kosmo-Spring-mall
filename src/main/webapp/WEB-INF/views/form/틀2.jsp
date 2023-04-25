<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../setting.jsp"%>

<html>
<meta charset="utf-8" name="viewport"
	content=" width = divice-width, initial-scale=1">
<body onload="mainFocus();">
<% request.setCharacterEncoding("UTF-8"); %>
	
<%@ include file="../form/header.jsp"%>
<%@ include file="../form/left_layout_borad.jsp"%>
	
	<!-- 간격 띄워주기, float 초기화? -->
<div style="height:30px;clear:both"></div>

<!--  left_layout  -->
<div class="wrap">
	<div class ="left_layout">
		<div><h2>뿅</h2></div>
		<ul>
			<li><a href="stockMange.ma">재고관리</a></li>
			<li><a href="orderMange.ma">주문관리</a></li>
			<li><a href="finally.ma">결산</a></li>
		</ul>
	
		<div style="padding-top:80px;padding-bottom:40px"><img src="${IPath}/소개/C_S.JPG"></div>
		<div style="padding-bottom:40px"><a href=""><img src="${IPath}/소개/입금.JPG"></a></div>
	</div>
</div>

<!-- 오시는길   -->
<div class="wrap">
	<div class = "body">
		<div class = "banner">
			<div class="banner1"> 결산 </div>
			<div class="banner2"> 결산을 확인해 봅시다!</div>
		</div>
		<div style="height:50px"></div>
	</div>
</div>
	
<%@ include file="../form/footer.jsp"%>
</body>
</html>
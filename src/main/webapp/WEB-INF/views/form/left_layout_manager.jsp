<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../setting.jsp"%>

<html>
<body >
<% request.setCharacterEncoding("UTF-8"); %>
	
<div style="height:30px;clear:both"></div>

<div class="wrap">
	<div class ="left_layout">
		<div><h2>관리자 페이지</h2></div>
		<ul>
			
			<li><a href="managerPage.ma">관리자 페이지</a></li>
			<li><a href="memerManage.ma">회원관리</a></li>
			<li><a href="stockManage.ma">재고관리</a></li>
			<li><a href="orderManage.ma">주문관리</a></li>
			<li><a href="settlement.ma">결산</a></li>
			<li><a href="boardList.bo">게시판</a></li>
		</ul>
	
		<div style="padding-top:80px;padding-bottom:40px"><img src="${path}images/소개/C_S.JPG"></div>
		<div style="padding-bottom:40px"><a href=""><img src="${path}images/소개/입금.JPG"></a></div>
	</div>
</div>

</body>
</html>
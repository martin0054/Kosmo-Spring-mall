<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../setting.jsp"%>

<html>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
	
<%@ include file="../form/header.jsp"%>
<%@ include file="../form/left_layout_manager.jsp"%>
	

<div class="wrap">
	<div class = "body">
		<div class = "banner">
			<div class="banner1"> 결산 </div>
			<div class="banner2"> 결산을 확인해 봅시다!</div>
		</div>
		<div style="height:30px"></div>
		<hr width=850px;>
		<div style="height:30px"></div>
	</div>
	<table align="center">
		<tr>
		  	<td >총 매출액 :<fmt:formatNumber type="number" maxFractionDigits="3" value="${totalPrice}" />원</td>
		  	<td>순 이익 :<fmt:formatNumber type="number" maxFractionDigits="3" value="${totalPrice*0.2}" />원
		  	<td>총 판매건수 :${orderCnt}건</td>
	  	</tr>
	  	<tr>	
	<%-- 		<%@ include file="../chart/char1.jsp"%> --%>
	  	</tr>
	  	<tr>
	  		<td>
	  		 상태별 건수 현황
	  		</td>
	  	</tr>
	  	<tr>
	<%-- 		<%@ include file="../chart/char2.jsp"%> --%>
	  	</tr>
	  	<tr>
	  		<td>
	  		상품별 매출 현황 : 하고 싶다
	  		</td>
	  	</tr>
	  	<%-- <tr>
			<%@ include file="../chart/char3.jsp"%>
	  	</tr> --%>
	</table>
	<div style="height:30px"></div>
	<hr width=850px;>
	<div style="height:30px"></div>
</div>
	
<%@ include file="../form/footer.jsp"%>
</body>
</html>
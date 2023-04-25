<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../setting.jsp"%>

<html>
<meta charset="utf-8" name="viewport"
	content=" width = divice-width, initial-scale=1">
<body>
<% request.setCharacterEncoding("UTF-8"); %>
	
<%@ include file="../form/header.jsp"%>
<%@ include file="../form/left_layout_manager.jsp"%>
	

<div class="wrap">
	<div class = "body">
		<div class = "banner">
			<div class="banner1"> 관리자 페이지  </div>
			<div class="banner2"> 일 하자!</div>
		</div>
		<div style="height:30px"></div>
		<hr width=850px;>
		<div style="height:30px"></div>
	</div>
	
	<table align="center">
		<tr>
			<th colspan="2">
				<div>
					<a href="memerManage.ma" >
						<img src="${path}images/icon/memCnt.JPG" width ="150px" height ="150px" style="margin-right:50px;">
						
						<li><span>회원 수</span></li>
						
						<em><span>${memCnt}</span></em>
					</a>
				</div>
			</th>		
		
			<th colspan="2">
				<div>
					<a href="stateSelect.ma?state_code=2">
						<img src="${path}images/icon/sellCnt.JPG"  width ="150px" height ="150px" style="margin-right:50px;">
						<li><span>판매 건수</span></li>
						<em><span>${orderCnt }</span></em>
					</a>
				</div>
			</th>		
		
			<th colspan="2">
				<div>
					<a href="stateSelect.ma?state_code=4">
						<img src="${path}images/icon/cancelList.JPG" width ="150px" height ="150px" style="margin-right:50px;">
						<li><span>환불 건수 </span></li>
						<em><span>${refundCnt}</span></em>
					</a>
				</div>
			</th>		
			<th colspan="2">
				<div>
					<a href="#">
					<img src="${path}images/icon/money.JPG"  width ="150px" height ="150px" style="margin-right:50px;">
						<li><span>판매액/순수익</span></li>
						<em><span>
						<fmt:formatNumber type="number" maxFractionDigits="3" value="${totalPrice}" />원
						<fmt:formatNumber type="number" maxFractionDigits="3" value="${totalPrice*0.2}" />원
						</span></em>
					</a>
				</div>
			</th>		
		</tr>
	</table>

	<div style="height:30px"></div>
	<hr width=850px;>
	<div style="height:30px"></div>
	
	<%-- <%@ include file="../stock/stockLisk.jsp"%> --%>
	
</div>
	
<%@ include file="../form/footer.jsp"%>
</body>
</html>
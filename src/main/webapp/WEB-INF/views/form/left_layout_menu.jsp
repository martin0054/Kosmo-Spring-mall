<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../setting.jsp"%>

<html>
<body >
<% request.setCharacterEncoding("UTF-8"); %>
	
<div style="height:30px;clear:both"></div>

<div class="wrap">
	<div class="left_layout">
		<div>
			<h2>메뉴&주문</h2>
		</div>
		<ul>
			<li><a href="mainMenu.do">전체메뉴</a></li>
			<c:forEach var="sdto" items="${sdtos}">	
				<li>
					<a href="detailMenu.do?s_no=${sdto.s_no}&pageNum=${pageNum}&number=${number}">${sdto.s_name}
					</a>
				</li>
			</c:forEach>	
		</ul>

		<div style="padding-top: 80px; padding-bottom: 40px"> <img src="${path}images/소개/C_S.JPG">
		</div>
		<div style="padding-bottom: 40px"> <a href=""><img src="${path}images/소개/입금.JPG"></a>
		</div>
	</div>
</div>
	


</body>
</html>
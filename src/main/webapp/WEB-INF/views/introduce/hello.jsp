<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../setting.jsp"%>

<html>
<meta charset="utf-8" name="viewport"
	content=" width = divice-width, initial-scale=1">
<body>
<% request.setCharacterEncoding("UTF-8"); %>

<%@ include file="../form/header.jsp"%>
<%@ include file="../form/left_layout_introduce.jsp"%>

<!--  인 사 말   -->
<div class="wrap">
	<div class = "body">
		<div class = "banner">
			<div class="banner1"> 인사말 </div>
			<div class="banner2"> 방문을 환영 합니다!</div>
		</div>
		<ul>
			<li><img src ="${path}images/소개/인사말2.JPG" ></li>		
		</ul>
	</div>
	<div style="height:70px"></div>
</div>

<%@ include file="../form/footer.jsp"%>
</body>
</html>
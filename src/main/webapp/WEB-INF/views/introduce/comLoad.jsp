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
	
<div class="wrap">
	<div class = "body">
		<div><a><img src="${path}images/오시는길/오시는길.JPG"></a></div>
		
		<div style="height:50px"></div>

		<div>
<!-- * 카카오맵 - 지도퍼가기 -->
<!-- 1. 지도 노드 -->
<div id="daumRoughmapContainer1591749875042" class="root_daum_roughmap root_daum_roughmap_landing"></div>

<!--
	2. 설치 스크립트
	* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
-->
<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

<!-- 3. 실행 스크립트 -->
<script charset="UTF-8">
	new daum.roughmap.Lander({
		"timestamp" : "1591749875042",
		"key" : "yq65",
		"mapWidth" : "700",
		"mapHeight" : "400"
	}).render();
</script>
		</div>	
			
		<div style="height:50px"></div>
		
		<div align = "center"><a><img src="${path}images/오시는길/약도.JPG" ></a></div>

	<div style="height:70px"></div>
	</div>
</div>
	
<%@ include file="../form/footer.jsp"%>
</body>
</html>
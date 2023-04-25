<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../setting.jsp"%>   
   
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
	<!--  header_layout -->
<div class="wrap">
	<div class="header_layout">



		<div class="logo">
			
			<a href="#" onclick = "location.href='${path}0_Main.do'" >
				<img src="${path}images/메인/헤더/해더 로고.JPG" >
			</a>
		</div>

		<div class="callcenter">
			<img src="${path}images/메인/헤더/해더 전화번호.JPG">
			<ul class = "header_Sub">
			
				<c:if test="${sessionScope.memId != null}">
					<li><span>${sessionScope.memId}</span>님	안녕하세요!</li>
					<li><input class="h_button" type="button" value="장바구니"  onclick="window.location='cartList.by'"></li>
					<li><input class="h_button" type="button" value="주문조회"  onclick="window.location='orderList.by'"></li>
					<li><input class="h_button" type="button" value="마이페이지"  onclick="window.location='myPage.do'"></li>
					<li><input class="h_button" type="button" value="로그아웃" onclick="window.location='logout.do'"></li>
								
				</c:if>
				
				<c:if test="${sessionScope.memId == null && sessionScope.maId == null}">
					<li><input class="h_button" type="button"	value="로그인" 
								onclick="window.location='logIn.do'"></li>
					<li><input class="h_button" type="button" value="회원가입" 
								onclick="window.location='signInForm.do'"></li>
					<li><input class="h_button" type="button" value="ID찾기"  
								onclick="window.location='findID.do'"></li>
					<li><input class="h_button" type="button" value="PWD찾기"  
								onclick="window.location='findPwd.do'"></li>
				</c:if>
				
				<c:if test="${sessionScope.maId != null}">
					
					<li><span>${sessionScope.maId}</span>님	일하세요!</li>
					<li><input class="h_button" type="button" value="관리자 페이지 "
								onclick="window.location='managerPage.ma'"></li>
					<li><input class="h_button" type="button" value="로그아웃" 
								onclick="window.location='logout.do'"></li>
								
				</c:if>
				
			</ul>
		</div>
	</div>
</div>
<!-- header_layout 끝 -->


<!-- header_menu -->

<div class="header_menu">
		<ul class="wrap">
	
<!-- 방문자 -->	
		<c:if test="${sessionScope.memId == null && sessionScope.maId == null}">
			<li><a href="logIn.do"style="border-left:1px solid #6a6a6a"> 로그인 </a></li>
			<li><a> 로그인후 이용 가능 하십니다.</a></li>
			<li><a href="signInForm.do"style="border-left:1px solid #6a6a6a"> 회원가입 </a></li>
		</c:if>	
<!-- 고객 -->	
		<c:if test="${sessionScope.maId == null && sessionScope.memId != null }">
			<li><a href="hello.do"style="border-left:1px solid #6a6a6a">원앙 에프엔비 소개</a></li>
			<li><a href="mainMenu.do">메뉴 &amp; 주문</a></li>
			<li><a href="boardList.bo">질문 게시판</a></li>
		</c:if>
<!-- 관리자 -->
		<c:if test="${sessionScope.maId != null}">
			<%-- <li><a href="${path}memerMange.ma">회원관리</a></li> --%>
			<li><a href="stockManage.ma" style="border-left:1px solid #6a6a6a">재고관리</a></li>
			<li><a href="orderManage.ma">주문관리</a></li>
			<li><a href="settlement.ma">결산</a></li>
		</c:if>
		</ul>
		
<div style="clear:both"></div>
</div>
</body>
</html>
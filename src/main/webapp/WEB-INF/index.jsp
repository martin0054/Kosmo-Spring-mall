<%-- <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri ="http://www.springframework.org/security/tags" %>

<html>
<body>

	<sec:authorize access ="isAuthenticated()"><!-- 현재 사용자가 인증된 경우  -->
		<sec:authentication property="name"/> 환영합니다. <!-- 현재 접속된 사용자의 인증정보를 보여줌 -->
	 </sec:authorize>
	
	<ul>
		<li><a href="<c:url value='0_main/0_Main'/>">메인</a></li>
		<li><a href="<c:url value='customer/myPage'/>"> 마이페이지</a></li>
		<li><a href="<c:url value='manager/managerPage'/>">관리자페이지 </a></li>
		<li><a href="<c:url value='manager/managerPage'/>"> 관리자페이지(a)</a></li>
	
	<!-- 인증된 경우에만 , 즉 로그인한 경우에만 로그아웃 링크 출력  -->
	<sec:authorize access="isAuthenticated()">
		<li><a href="<c:url value ='j_spring_security_logout'/>">j_spring_security_logout</a></li>
		<li><a href="<c:url value ='home/logout'/>">logout</a></li>
	</sec:authorize>
	</ul>

</body>
</html> --%>
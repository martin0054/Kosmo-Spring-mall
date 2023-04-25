<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<link href = "${path}css/singnInForm.css"  rel = "stylesheet" type = "text/css" >	

<html>
<meta charset="utf-8" name="viewport"
	content=" width = divice-width, initial-scale=1">
<body>
<% request.setCharacterEncoding("UTF-8"); %>
	
<%@ include file="../form/header.jsp"%>
<%@ include file="../form/left_layout_mypage.jsp"%>

<div class="wrap">
	<div class = "body">
		<div class = "banner">
			<div class="banner1"> 마이페이지 </div>
			<div class="banner2"> 마이페이지 입니다.!</div>
		</div>
		<div style="height:50px"></div>
	</div>		
		<div style="height:50px"></div>
		
	<table align="center">
		<tr>
			<th colspan="2">
				<div>
					<a href="${path}cartList.by" >
						<img src="${path}images/icon/cartList.JPG" width ="150px" height ="150px" style="margin-right:50px;">
						
						<li><span>장바구니 수량 </span></li>
						
						<em><span>${cartCnt}</span></em>
					</a>
				</div>
			</th>		
		
			<th colspan="2">
				<div>
					<a href="${path}orderList.by">
						<img src="${path}images/icon/orderList.JPG"  width ="150px" height ="150px" style="margin-right:50px;">
						<li><span>구매 수량</span></li>
						<em><span>${buyCnt }</span></em>
					</a>
				</div>
			</th>		
		
			<th colspan="2">
				<div>
					<a href="${path}stateSelect.by?state_code=3">
						<img src="${path}images/icon/cancelList.JPG" width ="150px" height ="150px" style="margin-right:50px;">
						<li><span>환불 수량 </span></li>
						<em><span>${refuntCnt}</span></em>
					</a>
				</div>
			</th>		
			<th colspan="2">
				<div>
					<a href="${path}myPage.do">
					<img src="${path}images/icon/money.JPG"  width ="150px" height ="150px" style="margin-right:50px;">
						<li><span>구매 총액</span></li>
						<em><span>
						<fmt:formatNumber type="number" maxFractionDigits="3" value="${total.o_count*total.totalPrice}" />원
						</span></em>
					</a>
				</div>
			</th>		
		</tr>
	</table>
	<div style="height:30px"></div>
	<hr width=850px;>
	<div style="height:30px"></div>
	
	<table class ="myTbl" align="center">
		<tr>
			<th class="ess" colspan="2" style="text-align:center">가입 정보</th>
		</tr>
		<tr>
			<th class="ess">아이디 </th>
			<td class="tb2">${memVo.id}</td>
		</tr>
		<tr>
			<th class="ess">패스워드 </th>
			<td class="tb2">${memVo.pwd}</td>
		</tr>
		<tr>
			<th class="ess">   이름  </th>
			<td class="tb2">${memVo.name}</td>
		</tr>
		
		<tr>
			<th class="ess">   성별</th>
			<td class="tb2">${memVo.sex}</td>
		</tr>

		<tr>
			 <th class="ess"> 생년월일</th>
			<td class="tb2">${memVo.birth}</td>
		</tr>

		<tr>
			<th class="ess">핸드폰번호</th>
			<td class="tb2">${memVo.hp}</td>
		</tr>
		
		<tr>
          		<th class="ess"> 주소 </th>
          
          	 <td class="tb2">${memVo.address}</td>
		</tr>

		<tr>
			<th class="ess"> 이메일</th>
			<td class="tb2">${memVo.email}</td>
		</tr>

		<tr>
			 <th class="ess">가입 일자</th>
			<td class="tb2"><fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm"  value="${memVo.reg_date}"/> </td>
		</tr>

		<tr>
           <th class="ess"> 가입경로</th>
           <td class="tb2"> ${memVo.howCom} </td>
		</tr>
	
		<tr>
            <th class="ess"> 직업</th>
            <td class="tb2">${memVo.job}</td>
       	 </tr>
	</table>
</div>		
<div style="height:100px"></div>		
<%@ include file="../form/footer.jsp"%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../setting.jsp"%>

<html>
<meta charset="utf-8" name="viewport"
	content=" width = divice-width, initial-scale=1">
<script src = "/0_lee.hanrim.dakbal/js/jquery-3.5.1.min.js"></script>

<body>
<% request.setCharacterEncoding("UTF-8"); %>
	
<%@ include file="../form/header.jsp"%>
<%@ include file="../form/left_layout_mypage.jsp"%>

<div class="wrap">
	<div class = "body">
		<div class = "banner">
			<div class="banner1"> 주문 목록 조회  </div>
			<div class="banner2"> 주문 목록 을 조회 합시다!.!</div>
		</div>
		<div style="height:50px"></div>
		
		<table style="width:900px" align="center" class="orderListTbl">
			<tr>
				<th colspan="8" align="center" style="height: 25px">
				<c:choose>
					<c:when test="${param.state_code==null  || param.state_code== '0'}"> 
						전체
					</c:when>
					<c:when test="${param.state_code==1}"> 
						구매 요청
					</c:when>
					<c:when test="${param.state_code==2}"> 
						구매 승인
					</c:when>
					<c:when test="${param.state_code==3}"> 
						환불 요청
					</c:when>
					<c:when test="${param.state_code==4}"> 
						환불 승인
					</c:when>
				</c:choose> 
				목록(목록 수량 : ${orderStatedCnt} /전체 수량 : ${cnt})
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
				<th>
					<div align="left">
						<select style="height: 35px;" name="stateSelect"
							onchange="window.location='stateSelect.by?state_code='+this.value">
							<c:if test="${state_code == null || state_code == '0'}">
								<option value="0" selected>전체</option>
								<option value="1">구매요청</option>
								<option value="2">구매승인</option>
								<option value="3">환불요청</option>
								<option value="4">환불승인</option>
							</c:if>

							<c:if test="${state_code != null && state_code != '0'}">
								<option value="0">전체</option>
								<c:if test="${state_code == '1' }">
									<option value="1" selected>구매요청</option>
								</c:if>
								<c:if test="${state_code != '1' }">
									<option value="1">구매요청</option>
								</c:if>
								<c:if test="${state_code == '2' }">
									<option value="2" selected>구매승인</option>
								</c:if>
								<c:if test="${state_code != '2' }">
									<option value="2">구매승인</option>
								</c:if>
								<c:if test="${state_code == '3' }">
									<option value="3" selected>환불요청</option>
								</c:if>
								<c:if test="${state_code != '3' }">
									<option value="3">환불요청</option>
								</c:if>
								<c:if test="${state_code == '4' }">
									<option value="4" selected>환불승인</option>
								</c:if>
								<c:if test="${state_code != '4' }">
									<option value="4">환불승인</option>
								</c:if>
							</c:if>
						</select>
					</div>

				</th>
			</tr>
		<tr>
			<th style="width:50px">
				선택<input type="checkbox" name="allCheck" onclick="allChk(this);">
			</th>
			<th style="width:100px;"> 번호 </th>
			<th style="width:100px">상품이름</th>
			<th style="width:100px">상품가격</th>
			<th style="width:100px">수량</th>
			<th style="width:100px">총 가격</th>
			<th style="width:100px">주문 날짜</th>
			<th style="width:100px">주문 상태</th>
		</tr>	

		<c:if test="${cnt>0}">
		
		<form method="post" name="orderListForm" >
			
			<c:forEach var ="odto" items="${odtos}" varStatus="status">
					<!-- ------------------ ${state_code== null || state_code == '0'} ------------------ -->
			<c:if test="${state_code== null || state_code == '0'}">
				<input type="hidden" name="stc_no" id="stc_no" value="${odto.stc_no}">
				<input type="hidden" name="me_id" id="me_id" value="${odto.me_id}">
				<input type="hidden" name="stc_no" id="stc_no" value="${odto.stc_no}">
				<input type="hidden" name="s_price" id = "s_price" value="${odto.s_price}">
				<input type="hidden" name="o_date" value="${odto.o_date }">
				<input type="hidden" name="sell_price" value="${odto.s_price*1.2}">
				<input type="hidden" name="totalPrice" value="${odto.s_price*1.2*odto.o_count}">
				<tr>
					<td style="width:50px"><input type="checkbox" name="check" value="${odto.o_no}" > </td>
					
					<td style="width:100px;">${number}<c:set var="number" value="${number-1}"/></td>	
				
					<td align="center">	<img src="${IPath}/ga/${odto.image}"  style="width: 100PX; hight: 100px"></td>
				
					<td style="width:100px"> <fmt:formatNumber type="number" maxFractionDigits="3" value="${odto.s_price*1.2}" />원</td>
				
					<td style="width:100px"> ${odto.o_count}</td>
				
					<td style="width:100px"> <fmt:formatNumber type="number" maxFractionDigits="3" value="${odto.s_price*1.2*odto.o_count}" />원</td>
					
					<td style="width:100px"><fmt:formatDate value="${odto.o_date}" pattern="yy.MM.dd/hh:mm" /></td>
					
					<td>
						<c:choose>
							<c:when test="${odto.state_code==1}"> 
								구매 요청
							</c:when>
							<c:when test="${odto.state_code==2}"> 
								구매 승인
							</c:when>
							<c:when test="${odto.state_code==3}"> 
								환불 요청
							</c:when>
							<c:when test="${odto.state_code==4}"> 
								환불 승인
							</c:when>
						</c:choose>
					</td>
				</tr>	
			</c:if>
			<!-- ------------------${state_code != null && state_code == odto.state_code} ------------------ -->
			<c:if test="${state_code != null && state_code == odto.state_code}">
				<input type="hidden" name="stc_no" id="stc_no" value="${odto.stc_no}">
				<input type="hidden" name="me_id" id="me_id" value="${odto.me_id}">
				<input type="hidden" name="stc_no" id="stc_no" value="${odto.stc_no}">
				<input type="hidden" name="s_price" id = "s_price" value="${odto.s_price}">
				<input type="hidden" name="o_date" value="${odto.o_date }">
				<input type="hidden" name="sell_price" value="${odto.s_price*1.2}">
				<input type="hidden" name="totalPrice" value="${odto.s_price*1.2*odto.o_count}">
				<tr>
					<td style="width:50px"><input type="checkbox" name="check" value="${odto.o_no}" > </td>
					
					<td style="width:100px;">${number}<c:set var="number" value="${number-1}"/></td>	
				
					<td align="center">	<img src="${IPath}/ga/${odto.image}"  style="width: 100PX; hight: 100px"></td>
				
					<td style="width:100px"> <fmt:formatNumber type="number" maxFractionDigits="3" value="${odto.s_price*1.2}" />원</td>
				
					<td style="width:100px"> ${odto.o_count}</td>
				
					<td style="width:100px"> <fmt:formatNumber type="number" maxFractionDigits="3" value="${odto.s_price*1.2*odto.o_count}" />원</td>
					
					<td style="width:100px"><fmt:formatDate value="${odto.o_date}" pattern="yy.MM.dd/hh:mm" /></td>
					
					<td>
						<c:choose>
							<c:when test="${odto.state_code==1}"> 
								구매 요청
							</c:when>
							<c:when test="${odto.state_code==2}"> 
								구매 승인
							</c:when>
							<c:when test="${odto.state_code==3}"> 
								환불 요청
							</c:when>
							<c:when test="${odto.state_code==4}"> 
								환불 승인
							</c:when>
						</c:choose>
					</td>
				</tr>	
				</c:if>
			</c:forEach>
		</form>

		<tr><td></td></tr>
		<tr>
			<td align="right">
				<c:if test="${param.state_code==1}">
					<input type = "button"  class="button" value="구매요청 취소" onclick = "return buyCancel();">
				</c:if>
				<c:if test="${param.state_code==2}">
					<input type = "button"  class="button" value="환불요청" onclick = "return BuyRefund();">
				</c:if>
				 <c:if test="${param.state_code==3}">
					<input type = "button"  class="button" value="환불요청 취소" onclick = "return BuyRefundCancel();">
				</c:if>
			</td>
			<td colspan="2">
				<input class="button" type="button" value="더 살래!" onclick="window.location='mainMenu.do'">
			<td>
		</tr>
	
		</c:if>
		<c:if test="${cnt < 1}">
		<tr><th>&nbsp;</th></tr>
		<tr><th>&nbsp;</th></tr>

		<tr>
			<th colspan="6" align="center">주문 된 상품이 없습니다.
				<input class="button" type="button" value="나도 먹고 싶다!"
					onclick="window.location='mainMenu.do'">
			</th>
		</tr>
		</c:if>
	</table>

	<!-- 페이지 컨트롤  -->
	<table style="width:1000px" align="center">
		<tr>
			<th align="center">
				<c:if test="${cnt>0 }">
					<!-- 처음[◀◀] /이전 블록 [◀] -->
					<c:if test="${startPage > pageBlock }">
						<a href="orderList.by">[ ◀◀ ]</a>
						<a href="orderList.by?pageNum=${startPage-pageBlock }">[ ◀  ]</a>
					</c:if>
					
					<!-- 블록내의 페이지 번호  -->
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i ==  currentPage}">
							<span><b>[${i}]</b></span>
						</c:if>
						
						<c:if test="${i !=  currentPage}">
							<a href="orderList.by?pageNum=${i}">[${i}]</a>
						</c:if>
					</c:forEach>
					
					<!-- 다음 블록 [▶] /마지막  [▶▶] -->
					<c:if test="${pageCount > endPage }">
						<a href="orderList.by?pageNum=${startPage+pageBlock }">[ ▶ ]</a>
						<a href="orderList.by?pageNum=${pageCount}">[ ▶▶ ]</a>
					</c:if>
					
				</c:if>
			</th>
		</tr>
	</table>
	
	</div>
</div>
	
<%@ include file="../form/footer.jsp"%>
</body>
</html>
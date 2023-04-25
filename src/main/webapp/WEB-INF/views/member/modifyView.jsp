<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../setting.jsp" %>
<link href = "${path}css/singnInForm.css"  rel = "stylesheet" type = "text/css" >
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<html>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function adrressSRH1() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<body onload="modifyfocus();">

<% request.setCharacterEncoding("UTF-8"); %>
<%@ include file="../form/header.jsp"%>
<%@ include file="../form/left_layout_mypage.jsp"%>


<!--  수정   -->
<div class="wrap">
	<div class = "body">
			<div class = "banner">
			<div class="banner1"> 회원 수정  </div>
			<div class="banner2"> 회원 정보를 수정 합시다!</div>
		</div>
		<div style="height:40px"></div>
		<div align ="center" ><img src ="${path}images/회원가입/회원가입.PNG" ></div>
	</div>
	
	<div style="height:10px"></div>
	<hr width="900px">
</div>


<c:if test="${selectCnt==1}">
	<form class="wrap" action="modifyPro.do" method="post" name="modifyForm"
		onsubmit="return modifyCheck();">

		<input type="hidden" name="hiddenId" value="0">

		<table class ="hi">
			
		  <tbody>	
		
			<tr>
				<th colspan="2">회원정보를 수정하세요!!</th>
			</tr>
			<tr>
				<th class="ess">아이디  </th>
				<td class="tb2">${vo.getId()}</td>
			</tr>
			<tr>
				<th class="ess">패스워드 </th>
				<td class="tb2"><input class="input" type="password" name="pwd"
					maxlength="20" value="${vo.getPwd()}"></td>
			</tr>
			<tr>
				<th class="ess">   패스워드 확인  </th>
				<td class="tb2"><input class="input" type="password" name="repwd"
					maxlength="20" value="${vo.getPwd()}"></td>
			</tr>

			<tr>
				<th class="ess">   이름  </th>
				<td class="tb2">${vo.getName()}</td>
			</tr>
			
			<tr>
				<th class="ess">   성별</th>
				<td class="tb2">${vo.getSex()}</td>
			</tr>

			<tr>
				 <th class="ess"> 생년월일</th>
				<td class="tb2">${vo.getBirth()}</td>
			</tr>

			<tr>
				<th class="ess">핸드폰번호</th>
				<td class="tb2">
										
					<c:if test="${vo.getHp() == null}">
						<input class="input" type="text" name="hp1" maxlength="3"
						style="width: 30px" onkeyup="m_nextHp1();">
						- 
						<input class="input" type="text" name="hp2" maxlength="4"
						style="width: 40px" onkeyup="m_nextHp2();"> 
						- 
						<input class="input" type="text" name="hp3" maxlength="4"
						style="width: 40px" onkeyup="m_nextHp3();"> 	
					</c:if>
					
					<!--   테이블 : '010 - xxxx - xxxx' | 입력화면 : hp1 - hp2- hp3 (쪼개져있음) -->
					<c:if test="${vo.getHp() != null}">
						<c:set var="hpArr" value="${fn:split(vo.getHp(),'-')}"/>
					
					<input class="input" type="text" name="hp1" maxlength="3"
						style="width: 30px" onkeyup="m_nextHp1();" value="${hpArr[0]}">
					- 
					<input class="input" type="text" name="hp2" maxlength="4"
						style="width: 40px" onkeyup="m_nextHp2();" value="${hpArr[1]}">
					- 
					<input class="input" type="text" name="hp3" maxlength="4"
						style="width: 40px" onkeyup="m_nextHp3();" value="${hpArr[2]}">
					</c:if>
				</td>
			</tr>
			
			<tr>
           		<th class="ess" rowspan="2">  주소 </th>
	          
	          	 <td class="tb2">
					<input type="text" id="sample6_postcode" placeholder="우편번호" name="postcode" class="input">
					<input class="input"type="button" onclick="adrressSRH1();" value="우편번호 찾기"> <br> <br>
					<input type="text" id="sample6_address"  name="address1" placeholder="주소" class="input"><br>
				</td>
			</tr>
			
			<tr>
				<td class="tb2">				
					<input type="text" id="sample6_detailAddress" name="address2" placeholder="상세주소" class="input" onchange="m_addinput">
					<input type="text" id="sample6_extraAddress" placeholder="참고항목">
					<input type="hidden" name="address">
				</td>
			</tr>

			<tr>
				<th class="ess"> 이메일</th>
				<td class="tb2">
					<c:set var="emailArr" value="${fn:split(vo.getEmail(),'@')}" />
					<input class="input" type="text" name="email1" maxlength="10" style="width: 60px" value="${emailArr[0]}">
					 @ 
					<input class="input" type="text" name="email2" maxlength="20" style="width: 70px" value="${emailArr[1]}"> 
					<select class="input" name="email3" onchange="m_selectEmailChk();">
						<option value="0">직접입력</option>
						<option value="naver.com">네이버</option>
						<option value="gmail.com">구글</option>
						<option value="nate.com">네이트</option>
						<option value="daum.net">다음</option>
					</select>
				</td>
			</tr>

			<tr>
				 <th class="ess">가입 일자</th>
				<td class="tb2"><fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${vo.getReg_date()}"/> </td>
			</tr>

			<tr>
	           <th class="ess"> 가입경로</th>
	           
	           <td class="tb2">
					${vo.getHowCom()}
				</td>
			</tr>
		
			<tr>
            <th class="ess"> 직업</th>
            <td class="tb2">
                <select class="input" name="job">
                    <option value="0">== 직업선택 ==
                    <option value="학생">학생
                    <option value="주부">주부
                    <option value="직장인">직장인
                    <option value="유튜버">유뷰버
                    <option value="개인사업자">개인사업자
                    <option value="none">없음
                </select>
             </td>
        </tr>
			
		</tbody>	
			<tr>
				<th colspan="3"><input class="button" type="submit"
					value="정보수정"> <input class="button" type="reset"
					value="초기화"> <input class="button" type="button"
					value="수정취소" onclick="window.location='logIn.do'">
				</th>
			</tr>
		</table>
	</form>
</c:if>

<c:if test="${selectCnt!=1}">
	<script type="text/javascript">
		errorAlert(msg_passwdError);
	</script>
</c:if>

 <%@ include file="../form/footer.jsp" %>

</body></html>
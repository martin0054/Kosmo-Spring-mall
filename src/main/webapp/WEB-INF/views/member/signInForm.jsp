<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp" %>
<link href = "${path}css/singnInForm.css"  rel = "stylesheet" type = "text/css" >
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<html>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function adrressSRH() {
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
<body onload="signInfocus();">

<% request.setCharacterEncoding("UTF-8"); %>
<%@ include file="../form/header.jsp"%>
<%@ include file="../form/left_layout_introduce.jsp"%>

<div class="wrap">
	<div class = "body">
		<div class = "banner">
			<div class="banner1"> 회원 가입  </div>
			<div class="banner2"> 회원 가입을 합시다!</div>
		</div>
		<div style="height:40px"></div>
		<div align ="center" ><img src ="${path}images/회원가입/회원가입.PNG" ></div>
	</div>
	<div style="height:10px"></div>
	<hr width="900px">
</div>

<!--  회원가입   -->

<form class="wrap" action="signInPro.do" method="post" name="signInForm"
		onsubmit="return signInCheck();">
		<input type="hidden" name="obtain" value="${obtain}">
		<input type="hidden" name="hiddenEmail" value="0">
		<input type="hidden" name="hiddenId" value="0">
			
	<table class ="hi">
	
	  <tbody>
		
	     <tr>
         	<th class="ess">
				<span class="p">*</span> 아이디
		   </th>
			
			<td class="tb2">
				<input class="input" type="text" name="id" maxlength="20" placeholder="ID를 입력하세요 " >
				<input class="inputButton" name="dupChk" type="button" value="중복확인"
					onclick="confirmId();">
			</td>
		 </tr>
	
         <tr>
			<th class="ess">
				<span class="p">*</span> 패스워드
			</th>
           
			<td class="tb2">
				<input class="input" type="password" name="pwd" maxlength="20" placeholder="PWD를 입력하세요 ">&nbsp;<small>(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)</small>
			</td>
		 </tr>

         <tr>
           <th class="ess">
				<span class="p">*</span> 패스워드 확인
		   </th>
           
           <td class="tb2">
				<input class="input" type="password" name="repwd" maxlength="20" placeholder="한번 더!">
		   </td>
		 </tr>
			  
		<tr>
			<th class="ess">
				<span class="p">*</span> 이름
			 </th>
			
			<td class="tb2">
				<input  class="input" type="text" name="name" value="" placeholder="이름을 알려주세요 ">
			</td>
		</tr>
		
         <tr>
           <th class="ess">
           		<span class="p">*</span>성별
		 </th>
           <td class="tb2">
				남성 <input type="radio" name="sex" value="남성" style="border:0" checked="">  
				여성 <input type="radio" name="sex" value="여성" style="border:0">
		   </td>
        
         </tr>
         
         <tr>
           <th class="ess">
           		<span class="p">*</span>생년월일
           </th>
           <td class="tb2">
              <input class="input" type="text" name="birth" size="10" maxlength="8" value="" onkeyup="nextbirth();">&nbsp;&nbsp;
	       </td>
         </tr>
	        
         <tr>
         	<th class="ess">핸드폰번호</th>
           
            <td class="tb2">
				<input class="input" type="text" name="hp1" maxlength="3"
					style="width: 30px" onkeyup="nextHp1();"> 
				- 
				<input class="input" type="text" name="hp2" maxlength="4"
					style="width: 40px" onkeyup="nextHp2();"> 
				- 
				<input class="input" type="text" name="hp3" maxlength="4"
					style="width: 40px" onkeyup="nextHp3();">
		   </td>
         </tr>
         
        <tr>
           <th class="ess" rowspan="2">
           	<span class="p">*</span> 주소
           </th>
	          
           <td class="tb2">
				<input type="text" id="sample6_postcode" placeholder="우편번호" name="postcode" class="input">
				<input class="input"type="button" onclick="adrressSRH();" value="우편번호 찾기"> <br> <br>
				<input type="text" id="sample6_address"  name="address1" placeholder="주소" class="input"><br>
			</td>
		</tr>
		<tr>
			<td class="tb2">				
				<input type="text" id="sample6_detailAddress" name="address2" placeholder="상세주소" class="input" onchange="addressIn();">
				<input type="text" id="sample6_extraAddress" placeholder="참고항목">
				<input type="hidden" name="address">
			</td>
		</tr>
        
        <tr>
           <th class="ess"><span class="p">*</span>이메일</th>
           <td class="tb2">
           		<input class="input" type="text" name="email1"	maxlength="50" style="width: 120px" placeholder ="메일도 알려줘요" >
               	@ 
				<input class="input" type="text" name="email2" maxlength="20" style="width: 70px">
				
                <select class="input" name="email3" onchange="selectEmailChk();">
					<option value="0">직접입력</option>
					<option value="naver.com">네이버</option>
					<option value="gmail.com">구글</option>
					<option value="nate.com">네이트</option>
					<option value="daum.net">다음</option>
				</select>
				<input type="button" value="이메일 인증" onclick="mailConfirm();">	
           </td>
       </tr>
       <tr>
       		 <th class="tb2">메일 인증 확인 //${obtain}//</th>
 			 <td class="tb2"><input type="text" name="mailOk" size="10">
 			 <input type="button" value="이메일 인증확인" onclick="mailCo();"></td>
       </tr>
       <tr>
           <th class="ess"><span class="p">*</span>가입경로</th>
           
           <td class="tb2">
				 <select name ="howCom" class="input" >
                    <option value="0">== 가입경로 ==
                    <option value="youtube">유튜브
                    <option value="serch">포탈사이트검색
                    <option value="blog">블로그
                    <option value="around">주위소개                  
                    <option value="etc">기타
                </select>
			</td>
		</tr>
       
         <tr>
            <th class="ess">직업</th>
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
			
			<tr class="ess">
				<td colspan="3" align ="center">
					<input class="input" type="submit" value="회원가입">
					<input class="input" type="reset" value="초기화"> 
					<input class="input" type="button" value="가입취소"
					onclick="history.back()">
            	</td>     
			</tr>
	</table>
</form>

 <%@ include file="../form/footer.jsp" %>

</body></html>
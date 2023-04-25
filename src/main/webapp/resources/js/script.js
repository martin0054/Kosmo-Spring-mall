/**
 * validation check
 */




var msg_id = "아이디를 입력하세요!!";
var msg_pwd = "비밀번호를 입력하세요!!";
var msg_rePwd = "비밀번호를 다시 입력해주세요.";
var msg_pwdChk = "비밀번호가 일치하지 않습니다.";
var msg_name = "이름을 입력하세요.";
var msg_gender = "성별을 선택하세요.";
var msg_birth = "생년월일 을 입력하세요.";
var msg_address = "우편번호를 입력하세요.";
var msg_d_address = "상세 주소를 입력하세요.";
var msg_email1 = "이메일을 입력하세요.";
var msg_how = "가입경로를 선택하세요.";

var msg_pwdChk = "비밀번호 형식에 맞지 않습니다.";
var msg_nameChk = "이름 형식에 맞지 않습니다.";
var msg_birthChk = "생일 형식에 맞지 않습니다.";
var msg_emailChk = "이메일 형식이 일치하지 않습니다.";
var msg_hpChk = "연락처 형식에 맞지 않습니다.";

var pwdErorr = "비밀번호가 일치하지 않습니다. \n확인후 다시 시도하세요."
var updateErorr = "글 수정에 실패 했습니다. \n확인후 다시 시도하세요."
var deleteErorr = "글 삭제에 실패 했습니다. \n확인후 다시 시도하세요."
var insertErorr = "글쓰기에 실패 했습니다. \n확인후 다시 시도하세요."

		
var msg_confirmId = "중복확인을 해주세요.";
var msg_insertError = "회원가입에 실패했습니다.\n확인후 다시 시도하세요."
var msg_updateError = "회원정보수정에 실패했습니다.\n확인후 다시 시도하세요."
var msg_deleteError = "회원탈퇴 에 실패했습니다.\n확인후 다시 시도하세요."
var msg_passwdError = "입력하신 비밀번호가 일치하지 않습니다.\n확인후 다시 시도하세요."
var msg_cartDeleteError = "장바구니 삭제에 실패했습니다.\n확인후 다시 시도하세요."
var msg_cartModifyError = "장바구니 수량 변경에 실패했습니다.\n확인후 다시 시도하세요."
var msg_cartAddError = "장바구니 추가에 실패했습니다.\n확인후 다시 시도하세요."
var msg_buyError = "구매에 실패했습니다.\n확인후 다시 시도하세요."
var msg_buyRefundError = "환불 요청에 실패했습니다.\n확인후 다시 시도하세요."
var msg_buyRefundCancelError = "환불 요청 취소에 실패했습니다.\n확인후 다시 시도하세요."
var msg_buyCanceError = "구매 취소에 실패했습니다.\n확인후 다시 시도하세요."
	
var m_updateError = "관리자 - 회원정보 수정에 실패했습니다.\n확인후 다시 시도하세요."
var m_deleteError = "관리자 - 회원삭제 에 실패했습니다.\n확인후 다시 시도하세요."

var m_stockUpdateError = "관리자 - 재고 수정에 실패 했습니다.\n확인후 다시 시도하세요."
var m_stockDeletError = "관리자 - 재고 삭제에 실패 했습니다.\n확인후 다시 시도하세요."
	
var m_buyOkError = "관리자 - 구매 승인에 실패 했습니다.\n확인후 다시 시도하세요."
var m_refundOKError = "관리자 - 구매 승인에 실패 했습니다.\n확인후 다시 시도하세요."

var updateErorr = "글 수정에 실패 했습니다. \n확인후 다시 시도하세요."
var deleteErorr = "글 삭제에 실패 했습니다. \n확인후 다시 시도하세요."
var insertErorr = "글쓰기에 실패 했습니다. \n확인후 다시 시도하세요."
	
	
// 에러메시지
function errorAlert(errorMsg) {
	alert(errorMsg)
	window.history.back();// 이전페이지로 이동

}


//============ 글 삭제 ============
function pwdFocus() {
	document.pwdForm.pwd.focus();
}
//=========== pwd 찾기 ============
function findPwdFocus() {
	document.findPwd.memId.focus();
}
//============ ID 찾기 ============
function findIdFocus() {
	document.findID.email1.focus();
}


// ============ 로그인 페이지 ============
//고객 
function logInFocus() {
	document.logInform.id.focus();
}

function logInCheck() {
	if (!document.logInform.id.value) {
		alert(msg_id);
		document.logInform.id.focus();
		return false;
	} else if (!document.logInform.pwd.value) {
		alert(msg_pwd);
		document.logInform.pwd.focus();
		return false;
	}
}
//관리자 
function m_logInFocus() {
	document.m_logInform.id.focus();
}

function m_logInCheck() {
	if (!document.m_logInform.id.value) {
		alert(msg_id);
		document.m_logInform.id.focus();
		return false;
	} else if (!document.m_logInform.pwd.value) {
		alert(msg_pwd);
		document.m_logInform.pwd.focus();
		return false;
	}
}

// ============ 회원가입 페이지 ============
function signInfocus() {
	document.signInForm.id.focus();
}


function addinput(){
	var add1 = document.signInForm.postcode.value;
	var add2 = document.signInForm.address1.value;
	var add3 = document.signInForm.address2.value;
	
	var address = "[" + add1 + "] " + add2 + " " + add3;
	
	document.signInForm.address.value = address;
}

function signInCheck() {
	var nameReg = /^[가-힣]{2,4}$/; // 한글 2~4자
	var pwdReg = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,16}$/; // 영어 대소문자, 숫자/특수문자중 2가지
																// 10~16
	var birthReg = /^[0-9]{8}$/; // 숫자 8자리
	var hp1Reg = /^[0-9]{3}$/; // 숫자 3자리
	var hpReg = /^[0-9]{4}$/; // 숫자 4자리
	var emailReg = /^[a-zA-Z0-9]{4,16}$/; // 한글 제외 모두
		
	var nameChk = nameReg.test(document.signInForm.name.value);
	var pwdChk = pwdReg.test(document.signInForm.pwd.value);
	var birthChk = birthReg.test(document.signInForm.birth.value);
	var hp1Chk = hp1Reg.test(document.signInForm.hp1.value);
	var hp2Chk = hpReg.test(document.signInForm.hp2.value);
	var hp3Chk = hpReg.test(document.signInForm.hp3.value);
	var emailChk = emailReg.test(document.signInForm.email1.value);
	
	// id
	if (!document.signInForm.id.value) {
		alert(msg_id);
		document.signInForm.id.focus();
		return false;
	// pwd 
	} else if (!document.signInForm.pwd.value) {
		alert(msg_pwd);
		document.signInForm.pwd.focus();
		return false;
	// repwd 
	} else if (!document.signInForm.repwd.value) {
		alert(msg_rePwd);
		document.signInForm.repwd.focus();
		return false;
	//불일치 
	} else if (document.signInForm.pwd.value != document.signInForm.repwd.value) {
		alert(msg_pwdChk);
		document.signInForm.repwd.value = "";
		document.signInForm.repwd.focus();
		return false;
	// name
	} else if (!document.signInForm.name.value) {
		alert(msg_name);
		document.signInForm.name.focus();
		return false;
	
	// gender
	} else if (!document.signInForm.sex.value) {
		alert(msg_gender);
		document.signInForm.sex.focus();
		return false;
		
	// birth
	} else if (!document.signInForm.birth.value) {
		alert(msg_birth);
		document.signInForm.birth.focus();
		return false;
		return false;
	// howCom 
	} else if (!document.signInForm.howCom.value) {
		alert(msg_how);
		document.signInForm.howCom.focus();
		return false;
	
	//정규식
	} else if (!nameChk) {
		alert(msg_nameChk);
		document.signInForm.name.value = "";
		document.signInForm.name.focus();
		return false;

	} else if (!pwdChk) {
		alert(msg_pwdChk);
		document.signInForm.pwd.value = "";
		document.signInForm.repwd.value = "";
		document.signInForm.pwd.focus();
		return false;

	} else if (!birthChk) {
		alert(msg_birthChk);
		document.signInForm.birth.value = "";
		document.signInForm.birth.focus();
		return false;

	} else if (!hp1Chk) {
		alert(msg_hpChk);
		document.signInForm.hp1.value = "";
		document.signInForm.hp1.focus();
		return false;

	} else if (!hp2Chk) {
		alert(msg_hpChk);
		document.signInForm.hp2.value = "";
		document.signInForm.hp2.focus();
		return false;
	
	} else if (!hp3Chk) {
		alert(msg_hpChk);
		document.signInForm.hp3.value = "";
		document.signInForm.hp3.focus();
		return false;

	} else if (!emailChk) {
		alert(msg_emailChk);
		document.signInForm.email1.value = "";
		document.signInForm.email1.focus();
		return false;
		
	// email1	
	} else if (!document.signInForm.email1.value) {
		alert(msg_email1);
		document.signInForm.email1.focus();
		return false;
	}

	// email2값이 null이면 && 직접입력이면 => msg_emailChk, email2로 이동
	else if (!document.signInForm.email2.value
			&& document.signInForm.email3.value == 0) {
		alert(msg_emailChk);
		document.signInForm.email2.focus();
		return false;
	}

	// 중복확인 버튼을 클릭하지 않는 경우
	if (document.signInForm.hiddenId.value == "0") {
		alert(msg_confirmId);
		document.signInForm.dupChk.focus();
		return false;
	}
}

// 중복 확인 버튼 클릭시 서브창 open
function confirmId() {
	// id값 미입력시
	if (!document.signInForm.id.value) {
		alert(msg_id);
		document.signInForm.id.focus();
		return false;
	}
	var url = "confirmId.do?id=" + document.signInForm.id.value;
	window.open(url, "confirm", "menubar=no, width=350 height=300")
}
// ============ 중복확인 페이지 confirmId.do ============
// 중복 확인창 포커스
function confirmIdFocus() {
	document.confirmForm.id.focus();
}

// 중복 확인창에서 id 입력여부
function confirmIdCheck() {
	if (!document.confirmForm.id.value) {
		alert(msg_id);
		document.confirmForm.id.focus();
		return false;
	}
}
function setId(id) {
	opener.document.signInForm.id.value = id; // 부모쪽에 값을넘기고
	opener.document.signInForm.hiddenId.value = 1; // 중복확인버튼 클릭함(=1)으로 바꾸고
	self.close();// 자신의 창 닫기

}

// ============ 회원가입 ============
function nextbirth() {
	if (document.signInForm.birth.value.length >= 8) {
		document.signInForm.hp1.focus();
	}
}

function nextHp1() {
	if (document.signInForm.hp1.value.length >= 3) {
		document.signInForm.hp2.focus();
	}
}

function nextHp2() {
	if (document.signInForm.hp2.value.length >= 4) {
		document.signInForm.hp3.focus();
	}
}

function nextHp3() {
	if (document.signInForm.hp3.value.length >= 4) {
		document.signInForm.email1.focus();
	}
}

function selectEmailChk() {
	// 직접입력 - email2 초기화
	if (document.signInForm.email3.value == 0) {
		document.signInForm.email2.readOnly = false;
		document.signInForm.email2.value = "";
		document.signInForm.email2.focus();
	} else {
		// 직접입력이 아닌경우
		document.signInForm.email2.readOnly = true;
		document.signInForm.email2.value = document.signInForm.email3.value;
	}
}

function selectEmailChk2() {
	// 직접입력 - email2 초기화
	if (document.findPwd.email3.value == 0) {
		document.findPwd.email2.readOnly = false;
		document.findPwd.email2.value = "";
		document.findPwd.email2.focus();
	} else {
		// 직접입력이 아닌경우
		document.findPwd.email2.readOnly = true;
		document.findPwd.email2.value = document.findPwd.email3.value;
	}
}
function selectEmailChk3() {
	// 직접입력 - email2 초기화
	if (document.findID.email3.value == 0) {
		document.findID.email2.readOnly = false;
		document.findID.email2.value = "";
		document.findID.email2.focus();
	} else {
		// 직접입력이 아닌경우
		document.findID.email2.readOnly = true;
		document.findID.email2.value = document.findID.email3.value;
	}
}

//메일 인증 - 회원가입
function mailConfirm(){
	var a=confirm("인증메일 보내시겠습니까?");
	if(a){
		if(document.signInForm.email1.value&&document.signInForm.email2.value){
			alert("인증 메일을 발송했습니다.");
			var email=document.signInForm.email1.value+"@"+document.signInForm.email2.value;
			var obtain=document.signInForm.obtain.value;
			window.open("mailConfirm.do?obtain="+obtain+"&email="+email,"e_chk","menubar=no, width=350, height=400");
		}else{
			alert("이메일을 작성해주세요!!");
		}
	}else{
		alert("취소되었습니다.");
	}
}

//이메일 키 확인 - 회원가입
function mailCo(){
	var num=0;
	var select="";
	if(num==0){
		if(document.signInForm){select=document.signInForm}
		//보낸키 ==입력키
		if(select.obtain.value==select.mailOk.value){
			alert("인증 되었습니다.");
			select.hiddenEmail.value = 1;
			num = 1;
		}else{
			alert("인증 실패!");
		}
	}else if(num==1){
		alert("이미 인증 했습니다..");
	}
}


//메일 인증 - 비밀번호 찾기
function findPwdCheck(){
	var a=confirm("인증메일 보내시겠습니까?");
	if(a){
		if(document.findPwd.email1.value&&document.findPwd.email2.value){
			alert("인증 메일을 발송했습니다.");
			var email=document.findPwd.email1.value+"@"+document.findPwd.email2.value;
			var obtain=document.findPwd.obtain.value;
			window.open("mailConfirm.do?obtain="+obtain+"&email="+email,"e_chk","menubar=no, width=350, height=400");
		}else{
			alert("이메일을 작성해주세요!!");
		}
	}else{
		alert("취소되었습니다.");
	}
}

//메일 인증 - 아이디찾기
function findIdCheck(){
	var a=confirm("인증메일 보내시겠습니까?");
	if(a){
		if(document.findID.email1.value&&document.findID.email2.value){
			alert("인증 메일을 발송했습니다.");
			var email=document.findID.email1.value+"@"+document.findID.email2.value;
			var obtain=document.findID.obtain.value;
			window.open("mailConfirm.do?obtain="+obtain+"&email="+email,"e_chk","menubar=no, width=350, height=400");
		}else{
			alert("이메일을 작성해주세요!!");
		}
	}else{
		alert("취소되었습니다.");
	}
}

//이메일 키 확인 - 비번찾기
function mailCo1(){
	var num=0;
	var select="";
	if(num==0){
		if(document.findPwd){
			select=document.findPwd
			//보낸키 ==입력키
			if(select.obtain.value==select.mailOk.value){
				alert("인증 되었습니다.");
				select.hiddenEmail.value = 1;
				num = 1;
			}else{
				alert("인증 실패!");
			}
		}
	}else if(num==1){
		alert("이미 인증 했습니다!");
	}
}

//메일 키 확인 - 아이디찾기
function mailCo2(){
	var num=0;
	var select="";
	if(num==0){
		if(document.findID){
			select=document.findID
			//보낸키 ==입력키
			if(select.obtain.value==select.mailOk.value){
				alert("인증 되었습니다.");
				select.hiddenEmail.value = 1;
				num = 1;
			}else{
				alert("인증 실패!");
			}
		}
	}else if(num==1){
		alert("이미 인증 했습니다!");
	}
}
// ============ 회원 탈퇴 ,수정 페이지 ============

function passwdFocus() {
	document.passwdform.pwd.focus();
}

function passwdCheck() {
	if (!document.passwdform.pwd.value) {
		alert(msg_pwd);
		document.passwdform.pwd.focus();
		return false;
	}
}



// ============ 회원 수정 페이지 ============

function modifyfocus() {
	document.modifyForm.pwd.focus();
}

function m_addinput(){
	var add1 = document.modifyForm.postcode.value;
	var add2 = document.modifyForm.address1.value;
	var add3 = document.modifyForm.address2.value;
	
	var address = "[" + add1 + "] " + add2 + " " + add3;
	
	document.signInForm.address.value = address;
}

function modifyCheck() {
	// 영어 대소문자, 숫자/특수문자 // 8~16
	var pwdReg = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,16}$/; 
	var hp1Reg = /^[0-9]{3,4}$/; // 숫자 3~4자리
	var hpReg = /^[0-9]{4}$/; // 숫자 4자리
	var emailReg = /^[a-zA-Z0-9]{4,16}$/; // 한글 제외 모두
	
	var pwdChk = pwdReg.test(document.modifyForm.pwd.value);
	var hp1Chk = hp1Reg.test(document.modifyForm.hp1.value);
	var hp2Chk = hpReg.test(document.modifyForm.hp2.value);
	var hp3Chk = hpReg.test(document.modifyForm.hp3.value);
	var emailChk = emailReg.test(document.modifyForm.email1.value);
	
	// pwd 
	if (!document.modifyForm.pwd.value) {
		alert(msg_pwd);
		document.modifyForm.pwd.focus();
		return false;
	// repwd 
	} else if (!document.modifyForm.repwd.value) {
		alert(msg_rePwd);
		document.modifyForm.repwd.focus();
		return false;
	//불일치 
	} else if (document.modifyForm.pwd.value != document.modifyForm.repwd.value) {
		alert(msg_pwdChk);
		document.modifyForm.repwd.value = "";
		document.modifyForm.repwd.focus();
		return false;
	// email1	
	} else if (!document.modifyForm.email1.value) {
		alert(msg_email1);
		document.modifyForm.email1.focus();
		return false;
	
	// email2값이 null이면 && 직접입력이면 => msg_emailChk, email2로 이동
	}else if (!document.modifyForm.email2.value
			&& document.modifyForm.email3.value == 0) {
		alert(msg_emailChk);
		document.modifyForm.email2.focus();
		return false;
	
	//정규식
	} else if (!pwdChk) {
		alert(msg_pwdChk);
		document.modifyForm.pwd.value = "";
		document.modifyForm.repwd.value = "";
		document.signmodifyFormInForm.pwd.focus();
		return false;
	
	} else if (!hp1Chk) {
		alert(msg_hpChk);
		document.modifyForm.hp1.value = "";
		document.modifyForm.hp1.focus();
		return false;
	
	} else if (!hp2Chk) {
		alert(msg_hpChk);
		document.modifyForm.hp2.value = "";
		document.modifyForm.hp2.focus();
		return false;
	
	} else if (!hp3Chk) {
		alert(msg_hpChk);
		document.modifyForm.hp3.value = "";
		document.modifyForm.hp3.focus();
		return false;
	}
}
function m_nextHp1() {
	if (document.modifyForm.hp1.value.length >= 3) {
		document.modifyForm.hp2.focus();
	}
}

function m_nextHp2() {
	if (document.modifyForm.hp2.value.length >= 4) {
		document.modifyForm.hp3.focus();
	}
}

function m_nextHp3() {
	if (document.modifyForm.hp3.value.length >= 4) {
		document.modifyForm.email1.focus();
	}
}

function m_selectEmailChk() {
	// 직접입력 - email2 초기화
	if (document.modifyForm.email3.value == 0) {
		document.modifyForm.email2.readOnly = false;
		document.modifyForm.email2.value = "";
		document.modifyForm.email2.focus();
	} else {
		// 직접입력이 아닌경우
		document.modifyForm.email2.readOnly = true;
		document.modifyForm.email2.value = document.modifyForm.email3.value;
	}
}

//전체 선택 
function allChk(all) {
	var chkAll = document.getElementsByName("check"); // check 배열을 가져온다.
	var check = all.checked;

	if (check) {
		for (var i = 0; i < chkAll.length; i++) {
			chkAll[i].checked = true;
		}
	} else {
		for (var i = 0; i < chkAll.length; i++) {
			chkAll[i].checked = false;
		}
	}
}

//============장바구니 ============

//장바구니 추가
function c_countChk(num){
	//정규식
	var count = /^[0-9]{1,4}$/;
	var countChk = count.test(document.detailMenu.c_count.value);
	var s_name = document.detailMenu.s_name.value
	var c_count = document.detailMenu.c_count.value
	
	if (c_count == 0) {
		alert("수량을 잘못 입력하였습니다.");
		
		c_count.focus();
		return false;
	}
	else if (!countChk) {
		alert("수량을 잘못 입력하였습니다.");
		c_count.focus();
		
		return false;
	}
	if(num == 1){
		
		alert("장바구니 에 '" + s_name + "' 를 " + c_count + " 개 추가하셨습니다." );
		
		document.detailMenu.action="cartAddPro.by";
			
		document.detailMenu.submit();
	}
	
}
//장바구니 구매
function cartBuy() {

	var chckList = document.getElementsByName("check");
	var cartBuy = "";
	
	for (var i = 0; i < chckList.length; i++) {
		if (chckList[i].checked) {
			cartBuy = cartBuy + "&cartBuy=" + chckList[i].value;
		}
	}
	if (!cartBuy) {
		alert("구매할 대상을 선택하세요.");
		return false;
	}else{
		var chk = confirm("구매 하시겠습니까?");
		
		if (chk) {
			document.cartListForm.action="BuyPro.by?" + cartBuy;
			
			document.cartListForm.submit();

		} else {
			alert("구매 취소 되었습니다.")
			return false;
		}
	}
	
}
//장바구니 삭제
function cartdelete(){

	var chckList = document.getElementsByName("check");
	var cartDelete = "";
	
	for (var i = 0; i < chckList.length; i++) {
		if (chckList[i].checked) {
			cartDelete = cartDelete +"&cartDelete=" + chckList[i].value;
		}
	}
	if (!cartDelete) {
		alert("삭제할 대상을 선택하세요.");
		return false;
	}else{
		var chk = confirm("삭제하시겠습니까?");
		
		if (chk) {
			document.cartListForm.action="cartDeletePro.by?" + cartDelete;
			
			document.cartListForm.submit();

		} else {
			alert("삭제 취소하였습니다.")
			return false;
		}
	}
}
//바로 구매
function nowBuy(){
	
	var s_no = document.detailMenu.s_no.value;
	var s_name = document.detailMenu.s_name.value;
	var c_count = document.detailMenu.c_count.value;
	var sell_price = document.detailMenu.s_price.value *1.2;

	var buyChk = confirm("'" + s_name + "' 을 " + c_count + "개 을 구매하시겠습니까?"
			+ "\n가격은 " + c_count*sell_price + " 입니다");

	if (buyChk) {
		document.detailMenu.action="BuyNowPro.by?s_no=" + s_no 	+ "&c_count=" + c_count + "&sell_price=" + sell_price;
		document.detailMenu.submit();
	} else {
		alert("구매를 취소하였습니다.")
		return false;
	}

}

//구매요청 취소 - 고객 
function buyCancel(){
	var chckList = document.getElementsByName("check");
	var buyCancel = "";
	
	for (var i = 0; i < chckList.length; i++) {
		if (chckList[i].checked) {
			buyCancel = buyCancel + "&buyCancel=" + chckList[i].value;
		}
	}
	if (!buyCancel) {
		alert("구매 취소할 대상을 선택하세요.");
		return false;
	}else{
		var chk = confirm("구매 취소 하시겠습니까?");
		
		if (chk) {
			document.orderListForm.action="BuyCancelPro.by?" + buyCancel;
			
			document.orderListForm.submit();

		} else {
			alert("구매 취소 되었습니다.")
			return false;
		}
	}
}

//환불요청 - 고객 
function BuyRefund(){
	var chckList = document.getElementsByName("check");
	var buyRefund = "";
	
	for (var i = 0; i < chckList.length; i++) {
		if (chckList[i].checked) {
			buyRefund = buyRefund + "&buyRefund=" + chckList[i].value;
		}
	}
	if (!buyRefund) {
		alert("환불할 대상을 선택하세요.");
		return false;
	}else{
		var chk = confirm("환불하시겠습니까?");
		
		if (chk) {
			document.orderListForm.action="BuyRefundPro.by?" + buyRefund;
			
			document.orderListForm.submit();
			
		} else {
			alert("환불 취소 되었습니다.")
			return false;
		}
	}
}

//환불요청취소 - 고객 
function BuyRefundCancel(){
	var chckList = document.getElementsByName("check");
	var buyRefundCancel = "";
	
	for (var i = 0; i < chckList.length; i++) {
		if (chckList[i].checked) {
			buyRefundCancel = buyRefundCancel + "&buyRefundCancel=" + chckList[i].value;
		}
	}
	if (!buyRefundCancel) {
		alert("환불취소 할 대상을 선택하세요.");
		return false;
		
	}else{
		var chk = confirm("환불요청을 취소 하시겠습니까?");
		
		if (chk) {
			document.orderListForm.action="BuyRefundCancelPro.by?" + buyRefundCancel;
			
			document.orderListForm.submit();
			
		} else {
			alert("환불 요청 취소가  취소 되었습니다.")
			return false;
		}
	}
}


// ------------------------ 관리자 ------------------
// 회원정보 수정 
function pwdFocus() {
	document.pwdForm.pwd.focus();
}


//구매 승인
function buyOk(){
	var chckList = document.getElementsByName("check");
	var buyOk="";
	
	for (var i = 0; i < chckList.length; i++) {
		if (chckList[i].checked) {
			buyOk = buyOk +"&buyOk=" + chckList[i].value;
		}
	}
	if (!buyOk) {
		alert("구매승인 대상을 선택하시요.");
		return false;
	}else{
		var chk = confirm("구매승인하시겠습니까?");
		
		if (chk) {
			document.orderManagerForm.action="buyOkPro.ma?" + buyOk;
			
			document.orderManagerForm.submit();

		} else {
			alert("구매승인 을 취소하였습니다.")
			return false;
		}
	}
}

//환불 승인
function refundOk(){
	var chckList = document.getElementsByName("check");
	var refundOk="";
	
	for (var i = 0; i < chckList.length; i++) {
		if (chckList[i].checked) {
			refundOk = refundOk +"&refundOk=" + chckList[i].value;
		}
	}
	if (!refundOk) {
		alert("환불승인 대상을 선택하시요.");
		return false;
	}else{
		var chk = confirm("환불승인 하시겠습니까?");
		
		if (chk) {
			document.orderManagerForm.action="refundOkPro.ma?" + refundOk;
			
			document.orderManagerForm.submit();
			
		} else {
			alert("환불승인을 취소하였습니다.")
			return false;
		}
	}
}

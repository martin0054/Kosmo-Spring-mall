<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../setting.jsp" %>

<html>
<body onload="passwdFocus();">
	<h2> 회원 탈퇴</h2>
	
	<form action="deletePro.do" method="post" name="passwdform"
		onsubmit="return passwdCheck();">
		<table>
			<tr>
				<th colspan="2">비밀번호를 입력하세요</th>
			</tr>

			<tr>
				<th>비밀번호</th>

				<td><input class="input" type="text" name="pwd" maxlength="20">
				</td>
			</tr>

			<tr>
				<th colspan="2"><input class="button" type="submit"
					value="회원탈퇴"> <input class="button" type="reset"
					value="탈퇴취소" onclick="window.history.back();"></th>
			</tr>
		</table>
	</form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../setting.jsp"%>

<html>
<script type="text/javascript">
var interval=3000;
var n=0;
var imgs = new Array(
		"${path}images/메인/베너/국물닭발.JPG",
		"${path}images/메인/베너/통닭발.JPG",
		"${path}images/메인/베너/근위.JPG",
		"${path}images/메인/베너/편육.JPG",
		"${path}images/메인/베너/송이불닭.JPG",
		"${path}images/메인/베너/S붉닭.JPG");

/* navigator : 현재 머물고있는 브라우저 정보 얻는 element
   appName : 웹브라우저 이름 / IE : 익스플로러 , 크롬 : Netscape*/
function rotate(){
	if(navigator.appName=="Netscape" && document.getElementById)
	{
	document.getElementById("slide").src=imgs[n];
	}
	else document.images.slide.src=imgs[n];
	(n==(imgs.length-1))? n=0  :n++;
	setTimeout("rotate()",interval);
	}
</script>

<body onload="rotate()">
<% request.setCharacterEncoding("UTF-8"); %>

<%@ include file="../form/header.jsp"%>

<!--- banner_menu - -->
<div class="banner_menu">
		<div style="height:656px width:1100px">
			<div class="main_img" onclick ="location.href= 'commn_menuOrder.html'">
			<img src="${path}images/메인/베너/국물닭발.JPG" id="slide" style="cursor: pointer">&nbsp;</div>
		</div>
</div>

	<div style="clear:both"></div>  


<div class="wrap">
<!-- banner_haccp -->
<div style="height:30px"></div>
		<div class="haccp">
			<div style="float:left;padding-right:19px"><img src="${path}images/메인/몸통/main1.HACCP.jpg" width="818" height="285" border="0"></div>
			<ul class ="sqMenu">
				<li><a href="0_Main.do"><img src="${path}images/메인/몸통/원앙.PNG"></a></li>
				<li><a href="comLoad.do"><img src="${path}images/메인/몸통/오시는길.PNG"></a></li>
			</ul>
			<ul class ="sqMenu1">
				<li><a href="conect.do"><img src="${path}images/메인/몸통/제휴문의.PNG"></a></li>
				<li><a href="boardList.bo"><img src="${path}images/메인/몸통/질문게시판.PNG"></a></li>
			</ul>
			<div style="clear:both;"></div>
		</div>


<!-- banner_몸통 -->
		<div style="margin:20px 0 50px;">
			<div><img src="${path}images/메인/몸통/main2.jpg"></div>
			<div><img src="${path}images/메인/몸통/main5.jpg"></div>
			<div><img src="${path}images/메인/몸통/main7.jpg"></div>
		</div>
		
</div>

<!-- 

	<div id="popUp">
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			align="center" style="border: 1px solid #000000">
			<tr>
				<td id="td">
			<tr>
				<td bgcolor="#000000" valign="top">
					<div id="popUpDiv" unselectable="on">
						*POP *
						<div style="position: absolute; right: 8px; top: 8px">
							<img src="image/bt_close.gif" border="0"
								onclick="HD.drag.close('popup_10')" style="cursor: pointer">
						</div>
					</div>
					<p align="center" style="margin: 0px;">
						<font color="#ff0000" face="돋움" size="5">팝업 입니다</font>
					</p>

				</td>
			</tr>

			<tr>
				<td height="20" bgcolor="#ffffff"
					style="padding-left: 10px; padding-right: 10px;">
			<tr>
				<td><a href="#none" onclick="closepopup('popUp');hide('popUp')"
					onfocus="this.blur()"><img></a></td>
			</tr>
		</table>
	</div>
 -->

	<%@ include file="../form/footer.jsp"%>
	
</body>
</html>
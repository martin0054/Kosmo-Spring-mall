package com.spring.dakbal.controller;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.WebAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dakbal.service.MemberServiceImpl;


@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Autowired
	MemberServiceImpl service;

	/*
	 * @Autowired StockServiceImpl stService ;
	 */
	
	// 첫 메인페이지
	@RequestMapping("0_Main.do")
	public String main() {
		logger.info("url ==>0_Main");
		
		return "0_main/0_Main";
	}
	
	// --------------------  인사말 --------------------

	//인사말
	@RequestMapping("hello.do")
	public String hello() {
		logger.info("url ==>hello");
		
		return "introduce/hello";
	}
	//오시는길
	@RequestMapping("comLoad.do")
	public String comLoad() {
		logger.info("url ==>comLoad");
		
		return "introduce/comLoad";
	}
	//제휴
	@RequestMapping("conect.do")
	public String conect() {
		logger.info("url ==>conect");
		
		return "introduce/conect";
	}

// --------------------  SingIn // LogIn --------------------

	//회원가입버튼
	@RequestMapping("signInForm.do")	
	public String signInForm(HttpServletRequest req, Model model) {
		logger.info("url ==>signInForm");
		
		service.mailConfirm(req, model);
		return "/member/signInForm";
	}
	//중복 확인 페이지 
	@RequestMapping("confirmId.do")
	public String confirmId(HttpServletRequest req, Model model) {
		logger.info("url ==>confirmId");
		
		service.confirmId(req, model);
		return "/member/confirmId";
	}
	//회원가입 처리
	@RequestMapping("signInPro.do")
	public String signInPro(HttpServletRequest req, Model model) {
		logger.info("url ==>signInPro");
		
		service.signInPro(req, model);
		return "/member/signInPro";
	}
	//회원 가입 성공 	
  	@RequestMapping("mainSuccess.do")
	public String mainSuccess(HttpServletRequest req, Model model) {
		logger.info("url ==>mainSuccess");
		
		int cnt = Integer.parseInt(req.getParameter("insertCnt"));
		model.addAttribute("selectCnt",cnt); //cnt = 1
		System.out.println("cnt : " +cnt);
		return "/member/logIn";
	}
  	//로그인  	
  	@RequestMapping("logIn.do")
  	public String logIn(HttpServletRequest req, Model model) {
  		logger.info("url ==>logIn");
  		
		model.addAttribute("selectCnt", 2); //환영합니다.
  		return "/member/logIn";
  	}
  //권한이 없는 사용자에게 안내 페이지 출력 - 403 에러
  	@RequestMapping("/user/denied.do")
  	public String denied(HttpServletRequest req, Model model, Authentication auth) {
  		logger.info("url ==> denied");
  		
  		AccessDeniedException exception = (AccessDeniedException) req.getAttribute(WebAttributes.ACCESS_DENIED_403);
  		
  		model.addAttribute("errMag", exception);
  		
  		return "/member/denied";
  	}
  	//로그인 처리 
  	@RequestMapping("loginPro.do")
  	public String loginPro(HttpServletRequest req, Model model) {
  		logger.info("url ==>loginPro");
  		
  		service.loginPro(req, model);
  		return "/member/logIn";
  	}
  	//로그아웃  	
  	@RequestMapping("logout")
  	public String logout(HttpServletRequest req, Model model) {
  		logger.info("url ==>logout");
  		
  		req.getSession().invalidate();
		model.addAttribute("selectCnt", 2); //환영합니다.
  		return "/member/logIn";
  	}
  	//회원탈퇴 폼
  	@RequestMapping("deleteForm.do")
  	public String deleteForm(HttpServletRequest req, Model model) {
  		logger.info("url ==>deleteForm");
  		
  		return "/member/deleteForm";
  	}
  	//회원 탈퇴 처리	
	@RequestMapping("deletePro.do")
  	public String deletePro(HttpServletRequest req, Model model) {
  		logger.info("url ==>deletePro");
  		
  		service.deletePro(req, model);
  		return "/member/deletePro";
  	}
  	//회원 정보 수정 폼
	@RequestMapping("modifyForm.do")
  	public String modifyForm(HttpServletRequest req, Model model) {
  		logger.info("url ==>modifyForm");
  		
  		return "/member/modifyForm";
  	}
	
  	//회원 정보 상세페이지	
	@RequestMapping("modifyView.do")
  	public String modifyView(HttpServletRequest req, Model model) {
  		logger.info("url ==>modifyView");
  		
  		service.modifyView(req, model);
  		return "/member/modifyView";
  	}
	
  	//회원 정보 처리 페이지 
	@RequestMapping("modifyPro.do")
  	public String modifyPro(HttpServletRequest req, Model model) {
  		logger.info("url ==>modifyPro");
  		
  		service.modifyPro(req, model);
  		return "/member/modifyPro";
  	}
	
// --------------------  이메일 인증  관련 --------------------	
	
	//이메일 확인하기
	@RequestMapping("mailConfirm.do")
	public String mailConfirm(HttpServletRequest req, Model model) {
		logger.info("url ==>mailConfirm");
		
		service.mailConfirm(req, model);
		return "/member/mail";
	}
	//id 찾기
	@RequestMapping("findID.do")
	public String findID(HttpServletRequest req, Model model) {
		logger.info("url ==>findID");
		
		service.mailConfirm(req, model);
		return "/member/findID";
	}
	//id 찾기 Pro
	@RequestMapping("findIDPro.do")
	public String findIDPro(HttpServletRequest req, Model model) {
		logger.info("url ==>findIDPro");
		
		service.findIDPro(req, model);
		return "/member/findID";
	}
	//pwd 찾기
	@RequestMapping("findPwd.do")
	public String findPwd(HttpServletRequest req, Model model) {
		logger.info("url ==>findPwd");
		
		service.mailConfirm(req, model);
		return "/member/findPwd";
	}
	//pwd 찾기 Pro	
	@RequestMapping("findPwdPro.do")
	public String findPwdPro(HttpServletRequest req, Model model) {
		logger.info("url ==>findPwdPro");
		
		service.findPwdPro(req, model);
		return "/member/findPwd";
	}

// --------------------  MyPage --------------------
					
//	//마이페이지
//	@RequestMapping("myPage.do")
//	public String myPage(HttpServletRequest req, Model model) {
//		logger.info("url ==>myPage");
//		
//		service.countList(req, model);
//		return "/customer/myPage";
//	}
	
// --------------------  menu --------------------		
//	
//	//전체 메뉴
//	@RequestMapping("mainMenu.do")
//	public String mainMenu(HttpServletRequest req, Model model) {
//		logger.info("url ==>mainMenu");
//		
//		stService.stockList(req, model);
//		return "/menu/mainMenu";
//	}
//	//메뉴 상세 
//	@RequestMapping("detailMenu.do")
//	public String detailMenu(HttpServletRequest req, Model model) {
//		logger.info("url ==>detailMenu");
//		
//		stService.stockList(req, model);
//		stService.detailStockForm(req, model);
//		return "/menu/detailMenu";
//	}
//	
}
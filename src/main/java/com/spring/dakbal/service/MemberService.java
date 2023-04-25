package com.spring.dakbal.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public interface MemberService {
	
	// 중복확인 처리 
	public void confirmId(HttpServletRequest req, Model model);
	
	// 회원가입처리
	public void signInPro(HttpServletRequest req, Model model);
	
	// 로그인 처리 
	public void loginPro(HttpServletRequest req,  Model model);

	// 회원 탈퇴 처리
	public void deletePro(HttpServletRequest req, Model model);
	
	// 회원 정보 상세 페이지 
	public void modifyView(HttpServletRequest req, Model model);
	
	// 회원정보 수정 처리 
	public void modifyPro(HttpServletRequest req, Model model);

	// 메일 인증
	//이메일 확인하기 , 메일코드보내기
	public void mailConfirm(HttpServletRequest req, Model model);
	
	// id찾기 pro
	public void findIDPro(HttpServletRequest req, Model model);
	
	// pwd찾기 pro
	public void findPwdPro(HttpServletRequest req, Model model);
	
//	// 마이페이지 수량  / 개인정보
//	public void countList(HttpServletRequest req, Model model);
}


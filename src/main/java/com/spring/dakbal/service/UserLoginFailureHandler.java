package com.spring.dakbal.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

//로그인이 실패한 경우 자동으로 실행
public class UserLoginFailureHandler implements AuthenticationFailureHandler{

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		request.setAttribute("errMsg", "아이디 또는 비밀번호가 일치하지 않습니다.");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/member/logIn.jsp");
		dispatcher.forward(request, response);
	}

}

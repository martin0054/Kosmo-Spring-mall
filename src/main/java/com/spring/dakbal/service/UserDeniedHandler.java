package com.spring.dakbal.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

//접근권한이 없는 경우 자동실행
public class UserDeniedHandler implements AccessDeniedHandler{
	//관리자페이지에 일반사용자가 접근 하거나, 허가받지 않은 사용자가 접근한 경우 에러메세지 출력
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		
		request.setAttribute("errMsg", "관리자만 접근할 수 있는 페이지 입니다.");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/member/denied.jsp");
		dispatcher.forward(request, response);
	}

}

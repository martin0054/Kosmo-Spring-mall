package com.spring.dakbal.persistence;

import java.util.Map;

import com.spring.dakbal.vo.MemberVo;

public interface MemberDAO {
	// 중복 확인 체크
	public int idCheck(String strId);
	
	// 회원가입 처리 페이지 
	public int insertMember(MemberVo vo);
	
	// 로그인 처리 페이지 ,회원 탈퇴 처리 페이지,회원정보 수정시 비밀번호 인증 
	public int idPwdChk(Map<String,Object> map);
	
	// 회원 탈퇴처리
	public int deleteMember(String strId);

	//회원정보 상세 처리 /마이페이지 본인정보 조회
	public MemberVo getMemeberInfo(String strId);

	//회원 상세 정보 -security
		public Map<String, Object> selectUser(String strId);
		
	// 회원정보 수정 처리
	public int updateMember(MemberVo vo);
	
	//이메일 확인하기 , 메일코드보내기
	public void sendMail(String email, String obtain);
	
	// id찾기 pro
	public String findIDPro(String email);

	// pwd찾기 pro
	public String findPwdPro(Map<String,Object> map);
	
	
//	// 장바구니수량 
//	public int cartCnt(String id);
//	
//	// 구매요청,승인 수량 state_code=1 ,2
//	public int buyCnt(String id);
//	
//	// 환불요청 수량 state_code=3 
//	public int refuntCnt(String id);
//	
	
}

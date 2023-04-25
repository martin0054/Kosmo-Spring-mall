package com.spring.dakbal.persistence;

import java.util.Map;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

import com.spring.dakbal.vo.MemberVo;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	String memDAOPath="spring.mvc.member_mybatis.persistence.MemberDAO.";

	//ID 중복확인 체크
	@Override
	public int idCheck(String strId) {
		return sqlSession.selectOne(memDAOPath+"idCheck",strId);
	}
	//회원가입 처리 
	@Override
	public int insertMember(MemberVo vo) {
		return sqlSession.insert(memDAOPath + "insertMember",vo);
	}
	//로그인 처리 페이지 ,회원 탈퇴 처리 페이지,회원정보 수정시 비밀번호 인증 
	@Override
	public int idPwdChk(Map<String,Object> map) {
		return	sqlSession.selectOne(memDAOPath + "idPwdChk",map);
	}
	//회원 탈퇴처리
	@Override
	public int deleteMember(String strId) {
		return sqlSession.delete(memDAOPath + "deleteMember",strId);
	}
	//회원정보 상세 처리 /마이페이지 본인정보 조회
	@Override
	public MemberVo getMemeberInfo(String strId) {
		return(MemberVo)sqlSession.selectOne(memDAOPath + "getMemeberInfo", strId);
	}
	
	//회원 상세 정보 -security
	@Override
	public Map<String, Object> selectUser(String strId) {
		return sqlSession.selectOne(memDAOPath + "selectUser", strId);
	}
	
	//회원정보 수정 처리 
	@Override
	public int updateMember(MemberVo vo) {
		return sqlSession.update(memDAOPath + "updateMember",vo);
	}
	
	//이메일 확인하기 , 메일코드보내기
	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public void sendMail(String email, String obtain) {
		 try{
	            MimeMessage message = mailSender.createMimeMessage();
	           
	            String content = "배송해서 팔아도 개이득! 맛 보장! 가격 보장! 원앙입니다. \n 이메일 인증 매일 입니다.! 인증키는 : " + obtain + " 입니다.";
	            /* "<a href='http://localhost:8081/member/emailChk.do?key=" + key +"'> 링크 </a>"; // 글 내용      */		    	    
	            
	            message.setSubject("원앙 메일 인증"); // 이메일 제목
	            message.setText(content, "UTF-8","text/html");
	            message.setFrom(new InternetAddress("admin@eoulim.com"));
	            
	            message.addRecipient(RecipientType.TO, new InternetAddress(email)); 
	    	    mailSender.send(message);
	            System.out.println("SEND");
	            
	        } catch(Exception e){
	            e.printStackTrace();
	    	}
		
	}
	//id찾기 pro
	@Override
	public String findIDPro(String email) {
		return sqlSession.selectOne(memDAOPath + "findIDPro",email);
	}
	
	//pwd찾기 pro
	@Override
	public String findPwdPro(Map<String, Object> map) {
		return sqlSession.selectOne(memDAOPath + "findPwdPro",map);
	}
//
//	//장바구니수량
//	@Override
//	public int cartCnt(String id) {
//		MemberDAO dao =sqlSession.getMapper(MemberDAO.class);
//		return dao.cartCnt(id);
//	}
//	
//	//구매요청,승인 수량 state_code=1 ,2
//	@Override
//	public int buyCnt(String id) {
//		MemberDAO dao =sqlSession.getMapper(MemberDAO.class);
//		return dao.buyCnt(id);
//	}
//	
//	//환불요청 수량 state_code=3,4
//	@Override
//	public int refuntCnt(String id) {
//		MemberDAO dao =sqlSession.getMapper(MemberDAO.class);
//		return dao.refuntCnt(id);
//	}
}

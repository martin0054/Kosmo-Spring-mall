package com.spring.dakbal.service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.dakbal.persistence.MemberDAO;
import com.spring.dakbal.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDAO dao;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;  //비밀번호 암호화 객체 
//	@Autowired
//	OrderDAO odao;
//	
	
	//중복 확인처리
	@Override
	public void confirmId(HttpServletRequest req, Model model){
		String strId= req.getParameter("id");
		
		int cnt = dao.idCheck(strId);
		
		model.addAttribute("cnt",cnt);
		model.addAttribute("id", strId);
	
	}

	//회원가입 처리
	@Override
	public void signInPro(HttpServletRequest req, Model model) {
		String beforPwd = req.getParameter("pwd");
		System.out.println("암호화 전의 비밀번호 : " + beforPwd);
		
		//비번 암호화
		String encryptPassword = passwordEncoder.encode(beforPwd);
		System.out.println("암호화 후의 비밀번호 : " + encryptPassword);
		
		MemberVo vo = null;
		
		vo.setId(req.getParameter("id"));
		vo.setPwd(encryptPassword);
		vo.setName(req.getParameter("name"));
		vo.setSex(req.getParameter("sex"));
		vo.setHowCom(req.getParameter("howCom"));
		vo.setJob(req.getParameter("job"));
		vo.setBirth(req.getParameter("birth"));
		//hp
		String hp = "";
		String hp1 = req.getParameter("hp1");
		String hp2 = req.getParameter("hp2");
		String hp3 = req.getParameter("hp3");
		
		//hp입력이 필수 가 이니므로 null 값이 들어 올 수있으므로
		if(!hp1.equals("")&& !hp2.equals("") && !hp3.equals("") ) {
			hp = hp1 + "-" + hp2 + "-" + hp3;
		}
		vo.setHp(hp);

		//email
		String email = "";
		String email1 = req.getParameter("email1");
		String email2 = req.getParameter("email2");
		
		//입력이 필수이므로 if 체크안함
		email = email1 + "@" + email2;
		vo.setEmail(email);
		
		//address
		String address = "";
		String postcode = req.getParameter("postcode");
		String address1 = req.getParameter("address1");
		String address2 = req.getParameter("address2");
				
		//입력이 필수이므로 if 체크안함
		address = postcode + address1 + address2;
				vo.setAddress(address);
		//reg_date
		vo.setReg_date(new Timestamp(System.currentTimeMillis()));
		
		//5단계. 회원가입 처리 
		int cnt = dao.insertMember(vo);
		
		model.addAttribute("insertCnt",cnt);
	}
	
	//로그인 처리 
	@Override
	public void loginPro(HttpServletRequest req, Model model) {
		String strId= req.getParameter("id");
		String strPwd= req.getParameter("pwd");
		
		//Map<key타입,value타입> map = new HashMap<key타입,value타입> ();
		Map<String,Object>  map = new HashMap<String, Object>();
		map.put("strId", strId);
		map.put("strPwd", strPwd);
		
		int selectCnt = dao.idPwdChk(map);
		
		if(selectCnt == 1) {
			req.getSession().setAttribute("memId", strId);
		}
		
		model.addAttribute("selectCnt",selectCnt);
	}
	
	//회원 탈퇴 처리 
	@Override
	public void deletePro(HttpServletRequest req, Model model) {
		String strId= (String)req.getSession().getAttribute("memId");
		String strPwd= req.getParameter("pwd");
		
		Map<String,Object>  map = new HashMap<String, Object>();
		map.put("strId", strId);
		map.put("strPwd", strPwd);
		
		int selectCnt = dao.idPwdChk(map);
		
		int deleteCnt = 0;
		if(selectCnt == 1) { //일치하면 
			deleteCnt = dao.deleteMember(strId);	//회원탈퇴
		}
		
		model.addAttribute("selectCnt",selectCnt);
		model.addAttribute("deleteCnt",deleteCnt);
	}
	
	//회원 정보 수정 페이지
	@Override
	public void modifyView(HttpServletRequest req, Model model) {
		String strId= (String)req.getSession().getAttribute("memId");
		String strPwd= req.getParameter("pwd");
		
		Map<String,Object>  map = new HashMap<String, Object>();
		map.put("strId", strId);
		map.put("strPwd", strPwd);
		
		int selectCnt = dao.idPwdChk(map);
		
		MemberVo vo = null;
		if(selectCnt == 1) { 
			vo = dao.getMemeberInfo(strId);
		}
		
		model.addAttribute("selectCnt",selectCnt);
		model.addAttribute("vo", vo);
	}
	
	
	//회원정보 수정 처리 
	@Override
	public void modifyPro(HttpServletRequest req, Model model) {
		MemberVo vo = null;
		vo.setId((String)req.getSession().getAttribute("memId"));
		vo.setPwd(req.getParameter("pwd"));
		vo.setJob(req.getParameter("job"));
		
		//hp
		String hp = "";
		String hp1 = req.getParameter("hp1");
		String hp2 = req.getParameter("hp2");
		String hp3 = req.getParameter("hp3");
		
		//hp입력이 필수 가 이니므로 null 값이 들어 올 수있으므로
		if(!hp1.equals("")&& !hp2.equals("") && !hp3.equals("") ) {
			hp = hp1 + "-" + hp2 + "-" + hp3;
		}
		vo.setHp(hp);

		//email
		String email = "";
		email = req.getParameter("email1") + "@" + req.getParameter("email2");
		vo.setEmail(email);
		
		//address
		String address = "";
		String postcode = req.getParameter("postcode");
		String address1 = req.getParameter("address1");
		String address2 = req.getParameter("address2");
				
		//입력이 필수이므로 if 체크안함
		address = postcode + address1 + address2;
				vo.setAddress(address);

		
		int updateCnt = dao.updateMember(vo);
		
		model.addAttribute("updateCnt",updateCnt);
	}
	
	//이메일 확인하기 , 메일코드보내기
	@Override
	public void mailConfirm(HttpServletRequest req, Model model) {
		String email=req.getParameter("email");
		model.addAttribute("email",email);
		
		System.out.println("email : "  + email);
		
		StringBuffer temp = new StringBuffer();
		Random rnd=new Random();
		for(int i = 0; i <6; i++) {
			int rIndex = rnd.nextInt(2);
			switch(rIndex){
			case 0 : //A~Z
				temp.append((char)((int) rnd.nextInt(26))+65);
			case 1:
				//0~9
				temp.append((rnd.nextInt(10)));
				break;
			}
		}
		String obtain=temp.toString();
		System.out.println("obtain : " + obtain);
		model.addAttribute("obtain", obtain);
		model.addAttribute("cnt",1);

		dao.sendMail(email,obtain);
		}

	//id찾기 pro
	@Override
	public void findIDPro(HttpServletRequest req, Model model) {
		String email1=req.getParameter("email1");
		String email2=req.getParameter("email2");
		String email=email1+"@"+email2;
		
		String memId=dao.findIDPro(email);
		
		if(!memId.equals("")) {
			model.addAttribute("memId", memId);
		}else {
			model.addAttribute("memId", "not");
		}	
	}

	//pwd찾기 pro
	@Override
	public void findPwdPro(HttpServletRequest req, Model model) {
		String email1=req.getParameter("email1");
		String email2=req.getParameter("email2");
		String email=email1+"@"+email2;
		
		String memId= req.getParameter("memId");
		Map<String,Object>  map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("memId", memId);
		
		String pwd = dao.findPwdPro(map);
		
		if(!pwd.equals("")) {
			model.addAttribute("pwd", pwd);
		}else {
			model.addAttribute("pwd", "not");
		}	
	}
//	
//	//마이페이지 수량  / 개인정보
//	@Override
//	public void countList(HttpServletRequest req, Model model) {
//		String sessionId = (String)req.getSession().getAttribute("memId");
//	
//		MemberVo vo = new MemberVo();
//		vo = dao.getMemeberInfo(sessionId);
//		model.addAttribute("memVo", vo);
//		
//		//장바구니수량 
//		int cartCnt = dao.cartCnt(sessionId);
//		//구매요청,승인 수량 state_code=1 ,2
//		int buyCnt = dao.buyCnt(sessionId);
//		//환불요청 수량 state_code=3
//		int refuntCnt=dao.refuntCnt(sessionId);
//		
//		//주문 결산 구매총액 - 마이페이지
//		OrderVo total = odao.total(sessionId);
//		
//		
//		model.addAttribute("cartCnt", cartCnt); 
//		model.addAttribute("buyCnt", buyCnt); 
//		model.addAttribute("refuntCnt", refuntCnt); 
//		model.addAttribute("total", total); 
//		
//		
//	}
	
}

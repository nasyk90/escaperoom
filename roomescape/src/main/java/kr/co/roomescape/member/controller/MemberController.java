package kr.co.roomescape.member.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.roomescape.dao.MemberDao;
import kr.co.roomescape.member.dto.MemberDto;

@Controller
public class MemberController {
	
	@Autowired
	public SqlSession sqlSession;
	
	@RequestMapping("/member/agree")
	public String agree()
	{
		return "/member/agree";
	}
	
	@RequestMapping("/member/member")
	public String member()
	{
		return "/member/member";
	}
	
	@RequestMapping("/member/member_ok")
	public String member_ok(MemberDto mdto)
	{
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		mdao.member_ok(mdto);
		return "redirect:/login/login";
	}
	
	//****회원정보 수정 member_update.jsp
	@RequestMapping("/member/member_update")
	public String member_update(HttpSession session, Model model)
	{
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		String email=session.getAttribute("email").toString();
		MemberDto mdto=mdao.member_update(email);
		model.addAttribute("mdto",mdto);
		return "/member/member_update";
	}

	//*****회원정보 수정 member_update.jsp=>DB update
	@RequestMapping("/member/member_update_ok")
	public String member_update_update_ok(MemberDto mdto,HttpSession session)
	{
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		mdto.setEmail(session.getAttribute("email").toString());
		mdao.member_update_ok(mdto);
		return "redirect:/login/mypage/mypage_main";
	}
	
	//*****휴면계정 신청
	@RequestMapping("/member/member_dor")
	public String member_dor(HttpSession session)
	{
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		mdao.member_dor(session.getAttribute("email").toString());
		//***** 휴면계정 신청 후 로그아웃
		session.invalidate();
		return "redirect:/main/index";
	}
	
	//*****탈퇴계정 신청
	@RequestMapping("/member/member_out")
	public String member_out(HttpSession session)
	{
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		mdao.member_out(session.getAttribute("email").toString());
		//*****탈퇴계정 신청 후 로그아웃
		session.invalidate();
		return "redirect:/main/index";
	}
	
	//*****email 중복체크
	@RequestMapping("/member/email_check")
	public void email_check(HttpServletRequest request, PrintWriter out)
	{
		MemberDao mdao=sqlSession.getMapper(MemberDao.class);
		String email=request.getParameter("email");
		int chk=mdao.email_check(email);
		System.out.println(chk);
		out.print(chk);
		
	}
	
	
}

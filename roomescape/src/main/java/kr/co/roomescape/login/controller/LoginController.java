package kr.co.roomescape.login.controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.roomescape.dao.LoginDao;
import kr.co.roomescape.dao.MemberDao;
import kr.co.roomescape.login.command.Login_okCommand;
import kr.co.roomescape.login.command.Pwd_search_okCommand;
import kr.co.roomescape.member.dto.MemberDto;

@Controller
public class LoginController {
	
	@Autowired
	public SqlSession sqlSession;
	
	//*******로그인 화면 login.jsp
	@RequestMapping("/login/login")  
	public String login(HttpServletRequest request, Model model)
	{
		model.addAttribute("chk",request.getParameter("chk"));
		return "/login/login";
	}
	
	//********login.jsp form => DB
	@RequestMapping("/login/login_ok")  
	public String login_ok(MemberDto mdto,HttpSession session)
	{
		LoginDao ldao=sqlSession.getMapper(LoginDao.class);
		Login_okCommand loc=new Login_okCommand();
		String url=loc.login_ok(ldao,mdto,session);
		/*MemberDto mdto2=ldao.login_ok(mdto);
		session.setAttribute("email", mdto2.getEmail());
		session.setAttribute("name", mdto2.getName());*/
		return url;
	}
	
	//*****휴면계정 원상복귀유무 확인  및 탈퇴회원 안내 member_rec.jsp 
	@RequestMapping("/login/member_rec")
	public String member_rec(HttpServletRequest request, Model model)
	{
		model.addAttribute("chk", request.getParameter("chk"));
		model.addAttribute("email", request.getParameter("email"));
		return "login/member_rec";
	}
	
	//*****휴면계정 원상복귀 member_rec.jsp=>DB update
	@RequestMapping("/login/member_rec_ok")
	public String member_rec_ok(HttpServletRequest request)
	{
		String email=request.getParameter("email");
		LoginDao ldao=sqlSession.getMapper(LoginDao.class);
		ldao.member_rec_ok(email);
		return "redirect:/login/login";
	}
	
	//******logout
	@RequestMapping("/login/logout")  
	public String logout(HttpSession session)
	{
		session.invalidate();
		return "redirect:/main/index";
	}
	
	//**********email(아이디)찾기 email_search.jsp
	@RequestMapping("/login/email_search")  
	public String email_search()
	{
		return "/login/email_search";
	}
	
	//*********email(아이디)찾기 email_search.jsp => DB검색
	@RequestMapping("/login/email_search_ok")  
 	public String email_search_ok(HttpServletRequest request,Model model)
	{
		LoginDao ldao=sqlSession.getMapper(LoginDao.class);
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		ArrayList<MemberDto> list=ldao.email_search_ok(name,phone);
		model.addAttribute("list",list);
		
		return "/login/email_search_ok";
	}
	
	//*******비밀번호 찾기 pwd_search.jsp
	@RequestMapping("/login/pwd_search")  
	public String pwd_search()
	{
		return "/login/pwd_search";
	}
	
	//*****비밀번호 찾기 아작스로 입력값 유무 확인
	@RequestMapping("/login/pwd_search_ok2")
	public void pwd_search_ok2(HttpServletRequest request, PrintWriter out)
	{
		LoginDao ldao=sqlSession.getMapper(LoginDao.class);
		String email=request.getParameter("email");
		int chk=ldao.pwd_search_ok2(email);
		System.out.println(chk);
		out.print(chk);
	}
	
/*	@RequestMapping("/login/email_search_ok2")
	public void email_search_ok2(HttpServletRequest request, PrintWriter out)
	{
		LoginDao ldao=sqlSession.getMapper(LoginDao.class);
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		int chk=ldao.email_search_ok2(name, phone);
		System.out.println(chk);
		out.print(chk);
	}*/
	
	//*******비밀번호 찾기 pwd_search.jsp=>메일로 비밀번호 변경url보내기
	@RequestMapping("/login/pwd_search_ok")  
	public String pwd_search_ok(HttpServletRequest request) throws Exception
	{
		Pwd_search_okCommand psoc=new Pwd_search_okCommand();
		psoc.pwd_search_ok(request);
		return "redirect:/login/login";
	}
	
	//*******비밀번호 바꾸기 pwd_change.jsp
	@RequestMapping("/login/pwd_change")  
	public String pwd_change(HttpServletRequest request, Model model)
	{
		model.addAttribute("email",request.getParameter("email"));
		return "/login/pwd_change";
	}
	
	//*********비밀번호 바꾸기 pwd_change.jsp => DB 수정
	@RequestMapping("/login/pwd_change_ok")  
	public String pwd_change_ok(MemberDto mdto)
	{
		LoginDao ldao=sqlSession.getMapper(LoginDao.class);
		String decode_email="";
		
		for(int i=0;i<mdto.getEmail().length();i++)
		{
			//***기존에 encode한것을 다시 돌려놓기
			decode_email=decode_email+(char)(mdto.getEmail().charAt(i)-2);
		}
		mdto.setEmail(decode_email);
		ldao.pwd_change_ok(mdto);
		
		return "redirect:/login/login";
	}
	
	//******mypage_main.jsp
	@RequestMapping("/login/mypage/mypage_main")
	public String mypage_main()
	{
		return "/login/mypage/mypage_main";
	}

}


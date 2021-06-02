package kr.co.roomescape.login.command;

import javax.servlet.http.HttpSession;

import kr.co.roomescape.dao.LoginDao;
import kr.co.roomescape.member.dto.MemberDto;

public class Login_okCommand {
	
	public String login_ok(LoginDao ldao,MemberDto mdto,HttpSession session)
	{
		MemberDto mdto2=ldao.login_ok(mdto);
		
		String url=null;
		
		//*****회원인지 아닌지 체크, 휴면계정,탈퇴회원에 따른 동작도 필요
		if(mdto2==null)  //****login.jsp에서 입력한 값이 DB(mdto)에 없으면 login.jsp으로 다시 이동(특저한 값(chk=1)을 가지고 이동) 
		{
			url="redirect:/login/login?chk=11";
		}
		else  //*****입력한 값이 DB(mdto)에 있을면 세션변수를 할당하고 index로 이동(로그인성공)
		{
			//*****state 정상회원:0, 휴면회원:1, 탈퇴회원:2
			switch(mdto2.getState())
			{
			    //*****정상회원
			    case 0:
				    session.setAttribute("email", mdto2.getEmail());
				    session.setAttribute("name", mdto2.getName());
				    String email=session.getAttribute("email").toString();
				    
				    //*****로그인과 동시에 lastday에 로그인한 날짜 update
				    ldao.login_ok_lastday(email);
				    url="redirect:/main/index";
				    break;
				    
				//*****휴면회원
			    case 1:url="redirect:/login/member_rec?chk=1&email="+mdto2.getEmail();break;
			    //*****탈퇴회원=>로그인 불가하며 탈퇴회원 안내하기
			    case 2:url="redirect:/login/login?chk=2";break;
			}
		}
		return url;
	}

}

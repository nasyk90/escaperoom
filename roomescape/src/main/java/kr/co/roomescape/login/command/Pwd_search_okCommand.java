package kr.co.roomescape.login.command;

import javax.servlet.http.HttpServletRequest;

import kr.co.roomescape.Mail_Send;

public class Pwd_search_okCommand {

	public void pwd_search_ok(HttpServletRequest request) throws Exception
	{
		Mail_Send ms=Mail_Send.getInstance();
		   
		String email=request.getParameter("email");
		String encode_email="";
		
		for(int i=0;i<email.length();i++)
		{
			   encode_email=encode_email+(char)(email.charAt(i)+2);
		}
		String subject="[Roomescape] 비밀번호 재설정 관련입니다";
		String body="비밀번호변경 : http://localhost/roomescape/login/pwd_change?email="+encode_email;
	    
		ms.setEmail(email, subject, body);
	}
}

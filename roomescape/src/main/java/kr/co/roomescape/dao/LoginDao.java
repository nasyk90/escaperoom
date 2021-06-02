package kr.co.roomescape.dao;

import java.util.ArrayList;

import kr.co.roomescape.member.dto.MemberDto;

public interface LoginDao {
	
	public MemberDto login_ok(MemberDto mdto);
	public ArrayList<MemberDto> email_search_ok(String name,String phone);
	//public int email_search_ok2(String name,String phone);
	public void pwd_change_ok(MemberDto mdto);
	public int pwd_search_ok2(String email);  //*****ajax로 입력한 이메일의 가입여부 확인 후 비밀번호 찾기
	public void login_ok_lastday(String email);  //*****로그인과 동시에 lastday에 로그인한 날짜 update
	public void member_rec_ok(String email);  //*****휴면계정 원상복귀


}

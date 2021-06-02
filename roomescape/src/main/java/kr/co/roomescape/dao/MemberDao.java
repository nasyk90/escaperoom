package kr.co.roomescape.dao;

import kr.co.roomescape.member.dto.MemberDto;

public interface MemberDao {
	
	public void member_ok(MemberDto mdto);
	public MemberDto member_update(String email);
	public void member_update_ok(MemberDto mdto);
	public void member_dor(String email);  //****휴면계정 신청
	public void member_out(String email);  //****탈퇴계정 신청
	public int email_check(String email);

}

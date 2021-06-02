package kr.co.roomescape.dao;

import java.util.ArrayList;
import kr.co.roomescape.reserve.dto.ReserveDto;
import kr.co.roomescape.theme.dto.ThemeDto;

public interface ReserveDao {

	public void reserve_ok(ReserveDto rdto);
	public ArrayList<ReserveDto> reserve_pass(String email);
	public void reserve_pass_ok(String id);
	public ArrayList<ThemeDto> get_list(); // 테마리스트 가져오기
	public String get_title(String theme); // 제목가져오기
	public Integer get_check(String theme,String intime,String reserve_day);
	public ArrayList<String> get_intime(String reserve_day,String theme);
}

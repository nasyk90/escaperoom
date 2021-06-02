package kr.co.roomescape.dao;

import java.util.ArrayList;

import kr.co.roomescape.theme.dto.ThemeDto;

public interface ThemeDao {
	// 테마 글쓰기
	public void theme_write_ok(ThemeDto tdto);
	// 테마 list,content
	public ArrayList<ThemeDto> theme();
	// 테마 삭제하기
	public void theme_delete(String id);
	
}

package kr.co.roomescape;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.roomescape.dao.ThemeDao;
import kr.co.roomescape.theme.dto.ThemeDto;

@Controller
public class MainController {

	@Autowired
	public SqlSession sqlSession;
	
	@RequestMapping("/main/index")
	public String main(HttpSession session, Model model,HttpServletRequest request)
	{
		ThemeDao tdao=sqlSession.getMapper(ThemeDao.class);
		ArrayList<ThemeDto> list=tdao.theme();
		model.addAttribute("list",list);
		model.addAttribute("chk",request.getParameter("chk"));
		return "/main/index";
	}
	
	@RequestMapping("/main/sogae")
	public String sogae()
	{ 
		return "/main/sogae";
	}
	
	@RequestMapping("/main/theme")
	public String theme(Model model,HttpServletRequest request)
	{
		String id=request.getParameter("id");
		if(id == null)
			id="1";
		ThemeDao tdao=sqlSession.getMapper(ThemeDao.class);
		ArrayList<ThemeDto> list=tdao.theme();
		model.addAttribute("list",list);
		return "/main/theme";
	}
	
}

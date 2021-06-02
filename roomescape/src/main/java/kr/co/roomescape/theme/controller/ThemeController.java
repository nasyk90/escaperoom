package kr.co.roomescape.theme.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.roomescape.dao.ThemeDao;
import kr.co.roomescape.theme.dto.ThemeDto;

@Controller
public class ThemeController {

	@Autowired
	public SqlSession sqlSession;
	
	@RequestMapping("/theme/theme_write")
	public String theme_write()
	{
		return "/theme/theme_write";
	}
	
	@RequestMapping("/theme/theme_write_ok")
	public String theme_write_ok(HttpServletRequest request) throws IOException
	{
		String path="C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\webapps\\roomescape\\WEB-INF\\views\\main\\main_img";
		int max=1024*1024*10;
		MultipartRequest multi=new MultipartRequest(request,path,max,"utf-8",new DefaultFileRenamePolicy());
		
		ThemeDao tdao=sqlSession.getMapper(ThemeDao.class);
		ThemeDto tdto=new ThemeDto();
		tdto.setTitle(multi.getParameter("title"));
		tdto.setDifficult(Integer.parseInt(multi.getParameter("difficult")));
		tdto.setContent(multi.getParameter("content"));
		tdto.setMimg(multi.getFilesystemName("mimg"));
		
		tdao.theme_write_ok(tdto);
		
		return "redirect:/theme/theme_write";
	}
	
	@RequestMapping("/theme/theme_delete")
	public String theme_delete(Model model)
	{
		ThemeDao tdao=sqlSession.getMapper(ThemeDao.class);
		ArrayList<ThemeDto> list=tdao.theme();
		
		model.addAttribute("list",list);
		return "/theme/theme_delete";
	}
	
	@RequestMapping("/theme/theme_delete_ok")
	public String theme_delete_ok(HttpServletRequest request)
	{
		String id=request.getParameter("id");
		ThemeDao tdao=sqlSession.getMapper(ThemeDao.class);
		
		tdao.theme_delete(id);
		return "redirect:/theme/theme_delete"; 
	}
}

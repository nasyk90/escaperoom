package kr.co.roomescape.reserve.controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.roomescape.dao.ReserveDao;
import kr.co.roomescape.reserve.dto.ReserveDto;



@Controller
public class ReserveController {

	@Autowired
	public SqlSession sqlSession;	
	
	@RequestMapping("/reserve/reserve")
	public String reserve(HttpServletRequest request,Model model,HttpSession session)
	{
		if(session.getAttribute("email")==null)
			return "redirect:../main/index?chk=99";
		else 
		{
			ReserveDao Rdao=sqlSession.getMapper(ReserveDao.class);
           model.addAttribute("list",Rdao.get_list());
		   return "/reserve/reserve";
		}
	}
	
	@RequestMapping("/reserve/reserve_info")
	public String reserve_info(HttpServletRequest request,Model model,HttpSession session)
	{
		ReserveDao Rdao=sqlSession.getMapper(ReserveDao.class);
        model.addAttribute("title",Rdao.get_title(request.getParameter("theme")));
 
		//model.addAttribute("name",session.getAttribute("name"));
		model.addAttribute("theme",request.getParameter("theme"));
		model.addAttribute("reserve_day",request.getParameter("reserve_day"));
		model.addAttribute("time",request.getParameter("time"));
		model.addAttribute("payment",request.getParameter("payment"));
		model.addAttribute("kk",request.getParameter("kk"));
		return "/reserve/reserve_info";
	}
	
	@RequestMapping("/reserve/reserve_insert")
	public String reserve_insert(ReserveDto rdto,HttpSession session)
	{
		rdto.setEmail(session.getAttribute("email").toString());
		rdto.setName(session.getAttribute("name").toString());
		ReserveDao Rdao=sqlSession.getMapper(ReserveDao.class);
		int chk=Rdao.get_check(rdto.getTheme(), rdto.getIntime(), rdto.getReserve_day());
		if(chk==0)
		{
			Rdao.reserve_ok(rdto);
			return "redirect:/reserve/reserve_ok";
		}else {
			return "redirect:/reserve/reserve_info?kk=1&theme="+rdto.getTheme()+"&reserve_day="+rdto.getReserve_day()+"&time="+rdto.getIntime();
		}
	}
	
	@RequestMapping("/reserve/reserve_ok")
	public String reserve_ok(ReserveDto rdto, HttpSession session)	
	{
		if(session.getAttribute("email")==null)
			return "redirect:../main/index?chk=99";
		else 
		{
			rdto.setEmail(session.getAttribute("email").toString());
			rdto.setName(session.getAttribute("name").toString());
			ReserveDao Rdao=sqlSession.getMapper(ReserveDao.class);
			int chk=Rdao.get_check(rdto.getTheme(), rdto.getIntime(), rdto.getReserve_day());
			if(chk==0)
			{	
			  return "/reserve/reserve_ok";
			}
			else
			  return "redirect:/reserve/reserve_info?kk=1&theme="+rdto.getTheme()+"&reserve_day="+rdto.getReserve_day()+"&time="+rdto.getIntime();
		}
	}
	
	@RequestMapping("/reserve/reserve_pass")
	public String reserve_pass(HttpSession session,HttpServletRequest request,ReserveDto rdto, Model model)
	{
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		String state=request.getParameter("state");
		String payment=request.getParameter("payment");
		ReserveDao Rdao=sqlSession.getMapper(ReserveDao.class);
		ArrayList<ReserveDto> list=Rdao.reserve_pass(session.getAttribute("email").toString());		
		model.addAttribute("list",list);
		return "/reserve/reserve_pass";
	}
	@RequestMapping("/reserve/reserve_pass_ok")
	public String reserve_pass_ok(HttpServletRequest request)
	{
		String id=request.getParameter("id");		
		ReserveDao rdao=sqlSession.getMapper(ReserveDao.class);
		rdao.reserve_pass_ok(id);
		return "redirect:/reserve/reserve_ok";
	}
	
	@RequestMapping("/reserve/check")
	public void check(PrintWriter out,HttpServletRequest request)
	{ 
		String reserve_day=request.getParameter("reserve_day");
		String theme=request.getParameter("theme");
		System.out.println(reserve_day+" "+theme);
		ReserveDao rdao=sqlSession.getMapper(ReserveDao.class);
        ArrayList<String> list=rdao.get_intime(reserve_day, theme);
        String intime="";
        for(int i=0;i<list.size();i++)
        	intime=intime+list.get(i)+"/";
        	
        out.print(intime);
	}
}

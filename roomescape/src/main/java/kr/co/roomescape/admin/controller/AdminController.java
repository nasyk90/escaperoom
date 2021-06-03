package kr.co.roomescape.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.roomescape.admin.command.Pro_write_okCommand;
import kr.co.roomescape.board.dto.FboardDto;
import kr.co.roomescape.board.dto.QboardDto;
import kr.co.roomescape.dao.AdminDao;
import kr.co.roomescape.reserve.dto.ReserveDto;

@Controller
public class AdminController {

	@Autowired
	public SqlSession sqlSession;
	
	@RequestMapping("/admin/pro_write")
	public String pro_write()
	{
		return "/admin/pro_write";
	}
	@RequestMapping("/admin/admin")
	public String admin()
	{
		return "/admin/admin";
	}
	@RequestMapping("/admin/pro_write_ok")
	public String pro_write_ok(HttpServletRequest request) throws IOException
	{
		String path="D:\\escape\\roomescape\\src\\main\\webapp\\WEB-INF\\views\\main\\main_img";
		int max=1024*1024*10;
		
		MultipartRequest multi=new MultipartRequest(request,path,max,"utf-8",new DefaultFileRenamePolicy());
		AdminDao adao=sqlSession.getMapper(AdminDao.class);
		Pro_write_okCommand poc=new Pro_write_okCommand();
		poc.pro_write_ok(multi,adao);
		return "redirect:/admin/pro_write";
	}
	// 관리자 자유게시판 글 삭제
	@RequestMapping("/admin/admin_board/admin_fboard")
	public String admin_fboard(Model model)
	{
		AdminDao adao=sqlSession.getMapper(AdminDao.class);
		ArrayList<FboardDto> list=adao.admin_fboard();
		
		model.addAttribute("list",list);
		return "/admin/admin_board/admin_fboard";
	}
	@RequestMapping("/admin/admin_board/fboard_delete")
	public String fboard_delete(HttpServletRequest request)
	{
		String id=request.getParameter("id");
		AdminDao adao=sqlSession.getMapper(AdminDao.class);
		adao.fboard_delete(id);
		return "redirect:/admin/admin_board/admin_fboard";
	}
	
	@RequestMapping("/admin/admin_board/ajax")
	@ResponseBody
	public String ajax(@RequestParam HashMap<String, Object> info) {
		System.out.println(info.get("VAL"));
		try {
			int cnt = Integer.parseInt((String)info.get("CNT"));
			String id = (String)info.get("VAL");
			String[] strArray = id.split(",");
			AdminDao adao=sqlSession.getMapper(AdminDao.class);
			
			for(int i=0; i<cnt; i++) {
				adao.fboard_delete(strArray[i]);
			}
			
			return "1";
		}catch (Exception e){
			return "0";
		}
		
	}
	
	// 관리자 QnA게시판 글 삭제
	@RequestMapping("/admin/admin_board/admin_qboard")
	public String admin_qboard(Model model)
	{
		AdminDao adao=sqlSession.getMapper(AdminDao.class);
		ArrayList<QboardDto> list=adao.admin_qboard();
		
		model.addAttribute("list",list);
		return "/admin/admin_board/admin_qboard";
	}
	@RequestMapping("/admin/admin_board/qboard_delete")
	public String qboard_delete(HttpServletRequest request)
	{
		String id=request.getParameter("id");
		AdminDao adao=sqlSession.getMapper(AdminDao.class);
		adao.qboard_delete(id);
		return "redirect:/admin/admin_board/admin_qboard";
	}
	
	// 관리자 예약확인
	@RequestMapping("/admin/reserve_select")
	public String reserve_select(Model model)
	{
		AdminDao adao=sqlSession.getMapper(AdminDao.class);
		ArrayList<ReserveDto> list=adao.reserve_select();
		model.addAttribute("list",list);
		return "admin/reserve_select";
	}
	// 관리자 예약취소신청 승인
	@RequestMapping("/admin/reserve_select_ok")
	public String reserve_select_ok(HttpServletRequest request)
	{
		String id=request.getParameter("id");
		AdminDao adao=sqlSession.getMapper(AdminDao.class);
		adao.reserve_select_ok(id);
		return "redirect:/admin/reserve_select";
	}
}

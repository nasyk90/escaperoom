package kr.co.roomescape.board.controller;

import java.io.Console;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.roomescape.board.command.FBoardCommand;
import kr.co.roomescape.board.command.GBoardCommand;
import kr.co.roomescape.board.command.QBoardCommand;
import kr.co.roomescape.board.dto.FboardDto;
import kr.co.roomescape.board.dto.GboardDto;
import kr.co.roomescape.board.dto.QboardDto;
import kr.co.roomescape.dao.BoardDao;

@Controller
public class BoardController {
	
	@Autowired
	public SqlSession sqlSession;
	
	// 자유게시판 리스트
	@RequestMapping("/board/f_board/f_board")
	public String f_board(HttpServletRequest request,Model model)
	{
		BoardDao dao=sqlSession.getMapper(BoardDao.class);
		FBoardCommand fbc=new FBoardCommand();
		fbc.f_board(request, dao, model);
		return "/board/f_board/f_board";
	}
	
	// 자유게시판 글쓰기
	@RequestMapping("/board/f_board/f_write")
	public String f_write()
	{
		return "/board/f_board/f_write";
	}
	
	// 자유게시판 글쓰기 등록
	@RequestMapping("/board/f_board/f_write_ok")
	public String f_write_ok(FboardDto fdto)
	{
		BoardDao dao=sqlSession.getMapper(BoardDao.class);
		dao.f_write_ok(fdto); 
		return "redirect:/board/f_board/f_board";
	}
	
	// 자유게시판 조회수
	@RequestMapping("/board/f_board/f_readnum")
	public String f_readnum(HttpServletRequest request)
	{
		String id=request.getParameter("id");
		String page=request.getParameter("page");
		BoardDao dao=sqlSession.getMapper(BoardDao.class);
		dao.f_readnum(id);
		return "redirect:/board/f_board/f_content?id="+id+"&page="+page;
	}
	
	// 자유게시판 콘텐츠  
	@RequestMapping("/board/f_board/f_content")
	public String f_contetnt(HttpServletRequest request, Model model)
	{
		String id=request.getParameter("id");
		String page=request.getParameter("page");
		String chk=request.getParameter("chk");
		BoardDao dao=sqlSession.getMapper(BoardDao.class);
		FboardDto fdto=dao.f_content(id);
		
		model.addAttribute("chk",chk);
		model.addAttribute("fdto",fdto);
		model.addAttribute("page",page);
		return "/board/f_board/f_content";
	}
	// 자유게시판 글 삭제 뷰
	@RequestMapping("/board/f_board/f_delete_pwd")
	public String f_delete_pwd(HttpServletRequest request, Model model) 
	{
		String id=request.getParameter("id");
		String page=request.getParameter("page");
		
		model.addAttribute("id",id);
		model.addAttribute("page",page);
		return "/board/f_board/f_delete_pwd";
	}
	// 자유게시판 글 삭제 실행
	@RequestMapping("/board/f_board/f_delete")
	public String f_delete(HttpServletRequest request)
	{
		String page=request.getParameter("page");
		String id=request.getParameter("id");
		String pass=request.getParameter("pwd");
		
		System.out.println(pass);
		BoardDao dao=sqlSession.getMapper(BoardDao.class);
		String pwd=dao.f_getPwd(id);
		if(pass.equals(pwd)){
			dao.f_delete(id);
		}else {
			return "redirect:/board/f_board/f_content?id="+id+"&page="+page+"&chk=1";
		}
		return "redirect:/board/f_board/f_board?page="+page;
	}
	
	// 자유게시판 글수정
	@RequestMapping("/board/f_board/f_update")
	public String f_update(HttpServletRequest request, Model model)
	{
		String chk=request.getParameter("chk");
		String page=request.getParameter("page");
		String id=request.getParameter("id");
		BoardDao dao=sqlSession.getMapper(BoardDao.class);
		FboardDto fdto=dao.f_update(id);
		
		model.addAttribute("chk",chk);
		model.addAttribute("fdto",fdto);
		model.addAttribute("page",page);
		return "/board/f_board/f_update";
	}
	
	// 자유게시판 글수정 등록
	@RequestMapping("board/f_board/f_update_ok")
	public String f_update_ok(FboardDto fdto, HttpServletRequest request, Model model)
	{
		String id=request.getParameter("id");
		String page=request.getParameter("page");
		BoardDao dao=sqlSession.getMapper(BoardDao.class);
		String pwd=dao.f_getPwd(id);
		if(pwd.equals(fdto.getPwd())){
			dao.f_update_ok(fdto);
		}else {
			return "redirect:/board/f_board/f_update?id="+id+"&page="+page+"&chk="+1;
		}
		return "redirect:/board/f_board/f_content?id="+id+"&page="+page;
	}
	
	
	
	
	// 공지게시판
	@RequestMapping("/board/g_board/g_board")
	public String g_board(HttpServletRequest request,Model model)
	{
		BoardDao dao=sqlSession.getMapper(BoardDao.class);
		GBoardCommand gbc=new GBoardCommand();
		gbc.g_board(request, dao, model);
		return "/board/g_board/g_board";
	}
	
	// 공지게시판 글쓰기
	@RequestMapping("/board/g_board/g_write")
	public String g_write()
	{
		return "/board/g_board/g_write";
	}
	
	// 공지게시판 글 등록
	@RequestMapping("/board/g_board/g_write_ok")
	public String g_write_ok(GboardDto gdto)
	{
		BoardDao dao=sqlSession.getMapper(BoardDao.class);
		dao.g_write_ok(gdto);
		return "redirect:/board/g_board/g_board";
	}
	
	// 공지게시판 조회수 증가
	@RequestMapping("/board/g_board/g_readnum")
	public String g_readnum(HttpServletRequest request)
	{
		String id=request.getParameter("id");
		String page=request.getParameter("page");
		BoardDao dao=sqlSession.getMapper(BoardDao.class);
		dao.g_readnum(id);
		return "redirect:/board/g_board/g_content?id="+id+"&page="+page;
	}
	
	// 공지게시판 콘텐츠
	@RequestMapping("/board/g_board/g_content")
	public String g_content(HttpServletRequest request, Model model)
	{
		String id=request.getParameter("id");
		String page=request.getParameter("page");
		BoardDao dao=sqlSession.getMapper(BoardDao.class);
		GboardDto gdto=dao.g_content(id);
		
		model.addAttribute("page", page);
		model.addAttribute("gdto",gdto);
		return "/board/g_board/g_content";
	}
	
	// 공지게시판 삭제
	@RequestMapping("/board/g_board/g_delete")
	public String g_delete(HttpServletRequest request)
	{
		String page=request.getParameter("page");
		String id=request.getParameter("id");
		BoardDao dao=sqlSession.getMapper(BoardDao.class);
		dao.g_delete(id);
		return "redirect:/board/g_board/g_board?page="+page;
	}
	
	// 공지게시판 글수정
	@RequestMapping("/board/g_board/g_update")
	public String g_update(HttpServletRequest request, Model model)
	{
		String id=request.getParameter("id");
		String page=request.getParameter("page");
		BoardDao dao=sqlSession.getMapper(BoardDao.class);
		GboardDto gdto=dao.g_update(id);
		
		model.addAttribute("page",page);
		model.addAttribute("gdto",gdto);
		return "/board/g_board/g_update";
	}
	
	// 공지게시판 글수정 등록
	@RequestMapping("board/g_board/g_update_ok")
	public String g_update_ok(HttpServletRequest request, Model model, GboardDto gdto)
	{
		String page=request.getParameter("page");
		String id=request.getParameter("id");
		BoardDao dao=sqlSession.getMapper(BoardDao.class);
		dao.g_update_ok(gdto);
		
		return "redirect:/board/g_board/g_content?id="+id+"&page="+page;
	}
	
	
	
	
	// QnA게시판
	@RequestMapping("/board/q_board/q_board")
	public String q_board(HttpServletRequest request, Model model)
	{
		BoardDao dao=sqlSession.getMapper(BoardDao.class);
		QBoardCommand qbc= new QBoardCommand();
		qbc.q_board(request, dao, model);
		return "/board/q_board/q_board";
	}
	
	// QnA 글쓰기
	@RequestMapping("/board/q_board/q_write")
	public String q_write(HttpSession session)
	{
		return "board/q_board/q_write";
	}
	
	// QnA 글쓰기 등록
	@RequestMapping("/board/q_board/q_write_ok")
	public String q_write_ok(QboardDto qdto)
	{
		BoardDao dao=sqlSession.getMapper(BoardDao.class);
		int grp=dao.q_grp();
		grp++;
		qdto.setGrp(grp);
		dao.q_write_ok(qdto);
		return "redirect:/board/q_board/q_board";
	}
	
	// QnA 조회수 증가
	@RequestMapping("/board/q_board/q_readnum")
	public String q_readnum(HttpServletRequest request, Model model)
	{
		String id=request.getParameter("id");
		String page=request.getParameter("page");
		BoardDao dao=sqlSession.getMapper(BoardDao.class);
		dao.q_readnum(id);
		return "redirect:/board/q_board/q_content?id="+id+"&page="+page;
	}
	
	// QnA 콘텐츠
	@RequestMapping("/board/q_board/q_content")
	public String q_content(HttpServletRequest request, Model model)
	{
		String id=request.getParameter("id");
		String page=request.getParameter("page");
		BoardDao dao=sqlSession.getMapper(BoardDao.class);
		QboardDto qdto=dao.q_content(id);
		
		model.addAttribute("qdto", qdto);
		model.addAttribute("page",page);
		return "/board/q_board/q_content";
	}
	
	// QnA 삭제
	@RequestMapping("/board/q_board/q_delete")
	public String q_delete(HttpServletRequest request)
	{
		String id=request.getParameter("id");
		String page=request.getParameter("page");
		BoardDao dao=sqlSession.getMapper(BoardDao.class);
		dao.q_delete(id);
		return "redirect:/board/q_board/q_board?page="+page;
	}
	
	// QnA 글수정
	@RequestMapping("/board/q_board/q_update")
	public String q_update(HttpServletRequest request, Model model)
	{
		String id=request.getParameter("id");
		String page=request.getParameter("page");
		BoardDao dao=sqlSession.getMapper(BoardDao.class);
		QboardDto qdto=dao.q_update(id);
		
		model.addAttribute("qdto",qdto);
		model.addAttribute("page",page);
		return "/board/q_board/q_update";
	}
	
	// QnA 글수정 등록
	@RequestMapping("/board/q_board/q_update_ok")
	public String q_update_ok(HttpServletRequest request, Model model, QboardDto qdto)
	{
		String id=request.getParameter("id");
		String page=request.getParameter("page");
		BoardDao dao=sqlSession.getMapper(BoardDao.class);
		dao.q_update_ok(qdto);
		
		return "redirect:/board/q_board/q_content?id="+id+"&page="+page;
	}
	
	// QnA 답글 쓰기
	@RequestMapping("/board/q_board/q_qwrite")
	public String q_qwrite(HttpServletRequest request, Model model)
	{
		String id=request.getParameter("id");
		BoardDao dao=sqlSession.getMapper(BoardDao.class);
		QboardDto qdto=dao.q_qwrite(id);
		
		model.addAttribute("qdto",qdto);
		return "/board/q_board/q_qwrite";
	}
	
	// QnA 답글 등록
	@RequestMapping("/board/q_board/q_qwrite_ok")
	public String q_qwrite_ok(HttpServletRequest request, QboardDto qdto)
	{
		BoardDao dao=sqlSession.getMapper(BoardDao.class);
		int grp=qdto.getGrp();
		int seq=qdto.getSeq();
		int depth=qdto.getDepth();
		
		seq++;
		depth++;
		
		qdto.setSeq(seq);
		qdto.setDepth(depth);
		dao.q_write_update(seq,grp);
		dao.q_qwrite_ok(qdto);
		return "redirect:/board/q_board/q_board";
	}

}

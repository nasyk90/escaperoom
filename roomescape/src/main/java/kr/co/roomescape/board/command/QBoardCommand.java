package kr.co.roomescape.board.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import kr.co.roomescape.board.dto.QboardDto;
import kr.co.roomescape.dao.BoardDao;

public class QBoardCommand {

	public void q_board(HttpServletRequest request, BoardDao dao, Model model) {
		int page;
		if (request.getParameter("page") == null) {
			page = 1;
		} else {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int index = (page - 1) * 20;
	
		ArrayList<QboardDto> list = dao.q_board(index); 
		// view전달할 값 => page,pstart,pend,page_cnt
		// page_cnt(총페이지)
		int chong = dao.qchong_record();// 총레코드
		int page_cnt = chong / 20;	//	페이지 수
		if (chong % 20 != 0)
			page_cnt++;
	
		// pstart, pend 구하기 (사용자에게 이동할 페이지를 보여주기)
		int pstart, pend;
		pstart = page / 10;
		if (page % 10 == 0)
			pstart = pstart - 1;
		pstart = pstart * 10 + 1;
	
		pend = pstart + 9;
		if (pend > page_cnt)
			pend = page_cnt;
		
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("page_cnt", page_cnt);
		model.addAttribute("page", page);
		model.addAttribute("list", list);
	}
}

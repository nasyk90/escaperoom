package kr.co.roomescape.product.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import kr.co.roomescape.dao.ProductDao;
import kr.co.roomescape.product.dto.ProductDto;

public class Pro_listCommand {

	public void pro_list(HttpServletRequest request,Model model,ProductDao pdao)
	{
		String pcode=request.getParameter("pcode");
		
		int page;
		if(request.getParameter("page")==null)
		{
			page=1;
		}
		else
		{
			page=Integer.parseInt(request.getParameter("page"));
		}
		int index=(page-1)*10;
		
		ArrayList<ProductDto> list=pdao.pro_list(pcode,index);
		
		int chong=pdao.chong_record(pcode);
		int page_cnt=chong/10;
		if(chong%10 != 0)
			page_cnt++;
		
		int pstart, pend;
		pstart=page/5;
		if(page%5==0)
			pstart=pstart-1;
		pstart=pstart*5+1;
		
		pend=pstart+4;
		if(pend > page_cnt)
			pend=page_cnt;
		
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("page_cnt",page_cnt);
		model.addAttribute("page",page);
		model.addAttribute("pcode",pcode);
		model.addAttribute("list",list);
	}
}

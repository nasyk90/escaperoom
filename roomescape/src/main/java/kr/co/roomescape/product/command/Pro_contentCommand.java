package kr.co.roomescape.product.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import kr.co.roomescape.dao.ProductDao;
import kr.co.roomescape.product.dto.ProductDto;

public class Pro_contentCommand {

		public void pro_content(HttpServletRequest request,Model model,ProductDao pdao)
		{
			String pcode=request.getParameter("pcode");
			
			// 상품의 정보
			ProductDto pdto=pdao.pro_content(pcode);
			
			model.addAttribute("pdto",pdto);
		}
}

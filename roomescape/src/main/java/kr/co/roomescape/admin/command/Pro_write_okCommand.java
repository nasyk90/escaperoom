package kr.co.roomescape.admin.command;

import com.oreilly.servlet.MultipartRequest;

import kr.co.roomescape.dao.AdminDao;
import kr.co.roomescape.product.dto.ProductDto;

public class Pro_write_okCommand {

	public void pro_write_ok(MultipartRequest multi,AdminDao adao)
	{
		ProductDto pdto=new ProductDto();
		
		String pcode=multi.getParameter("pcode");
		Integer number=adao.get_number(pcode);
		number++;
		int n=number.toString().length();
		if(n==1)
		  pcode=pcode+"00"+number;
		else if(n==2)
		  pcode=pcode+"0"+number;
		else if(n==3)
		  pcode=pcode+number;
		
		pdto.setPcode(pcode);
		pdto.setMimg(multi.getFilesystemName("mimg"));
		pdto.setPname(multi.getParameter("pname"));
		pdto.setPrice(Integer.parseInt(multi.getParameter("price")));
		pdto.setSu(Integer.parseInt(multi.getParameter("su")));
		pdto.setContimg(multi.getFilesystemName("contimg"));
		
		adao.pro_write_ok(pdto);
	}
}

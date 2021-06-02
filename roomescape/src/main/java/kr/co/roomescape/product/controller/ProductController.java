package kr.co.roomescape.product.controller;

import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.roomescape.dao.ProductDao;
import kr.co.roomescape.product.command.Pro_contentCommand;
import kr.co.roomescape.product.command.Pro_listCommand;
import kr.co.roomescape.product.dto.BaesongDto;

@Controller
public class ProductController {

	@Autowired
	public SqlSession sqlSession;
	
	@RequestMapping("/product/pro_list")
	public String pro_list(HttpServletRequest request,Model model)
	{
		ProductDao pdao=sqlSession.getMapper(ProductDao.class);
		Pro_listCommand plc=new Pro_listCommand();
		plc.pro_list(request,model,pdao);
		return "/product/pro_list";
	}
	
	@RequestMapping("/product/pro_content")
    public String pro_content(HttpServletRequest request,Model model)
    {
    	ProductDao pdao=sqlSession.getMapper(ProductDao.class);
    	Pro_contentCommand pcc=new Pro_contentCommand();
    	pcc.pro_content(request,model,pdao);
    	return "/product/pro_content";
    }
    
	
	@RequestMapping("/product/bae_write")
	public String bae_write()
	{
		return "/product/bae_write";
	}
	
	@RequestMapping("/product/bae_write_ok")
	public String bae_write_ok(BaesongDto bdto)
	{
		ProductDao pdao=sqlSession.getMapper(ProductDao.class);
		pdao.bae_write_ok(bdto);
		return "redirect:/product/pay_step";
	}
	
	@RequestMapping("product/pay_step")
	public String pay_step()
	{
		return "/product/pay_step";
	}
	
	@RequestMapping("product/jumun_ok_view")
	public String jumun_ok_view(Model model,HttpServletRequest request)
	{
		return "/product/jumun_ok_view";
	}







}

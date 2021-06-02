package kr.co.roomescape.dao;

import java.util.ArrayList;

import kr.co.roomescape.product.dto.BaesongDto;
import kr.co.roomescape.product.dto.ProductDto;

public interface ProductDao {

	public ArrayList<ProductDto> pro_list(String pcode,int index);
	public int chong_record(String pcode);
	public String img_view(String pcode);
	public ProductDto pro_content(String pcode);
	public void bae_write_ok(BaesongDto bdto);
}

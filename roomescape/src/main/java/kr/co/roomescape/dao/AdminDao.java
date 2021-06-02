package kr.co.roomescape.dao;

import java.util.ArrayList;

import kr.co.roomescape.board.dto.FboardDto;
import kr.co.roomescape.board.dto.QboardDto;
import kr.co.roomescape.product.dto.ProductDto;
import kr.co.roomescape.reserve.dto.ReserveDto;

public interface AdminDao {
   public int get_number(String pcode); // pcode는 년월일
   public void pro_write_ok(ProductDto pdto);
   // 관리자 자유게시판 글 삭제
   public ArrayList<FboardDto> admin_fboard();
   public void fboard_delete(String id);
   // 관리자 QnA게시판 글 삭제
   public ArrayList<QboardDto> admin_qboard();
   public void qboard_delete(String id);
   // 관리자 예약확인
   public ArrayList<ReserveDto> reserve_select();
   // 관리자 예약취소신청 승인
   public void reserve_select_ok(String id);
}

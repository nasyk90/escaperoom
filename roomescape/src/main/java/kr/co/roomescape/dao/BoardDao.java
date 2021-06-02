package kr.co.roomescape.dao;

import java.util.ArrayList;

import kr.co.roomescape.board.dto.FboardDto;
import kr.co.roomescape.board.dto.GboardDto;
import kr.co.roomescape.board.dto.QboardDto;

public interface BoardDao {
	// 자유게시판 글 저장
	public void f_write_ok(FboardDto fdto);
	// 자유게시판 리스트 출력
	public ArrayList<FboardDto> f_board(int index);
	// 자유게시판 총레코드 계산
	public int chong_record();
	// 자유게시판 조회수 증가
	public void f_readnum(String id);
	// 자유게시판 콘텐츠 출력
	public FboardDto f_content(String id);
	// 자유게시판 글 삭제
	public void f_delete(String id);
	// 자유게시판 글 수정
	public FboardDto f_update(String id);
	// 자유게시판 비밀번호 가져오기
	public String f_getPwd(String id);
	// 자유게시판 글 수정 등록
	public void f_update_ok(FboardDto fdto);
	
	// 공지게시판 글 등록
	public void g_write_ok(GboardDto gdto);
	// 공지게시판 리스트 출력
	public ArrayList<GboardDto> g_board(int index);
	// 공지게시판 총 레코드 수 조회
	public int gchong_record();
	// 공지게시판 조회수 증가
	public void g_readnum(String id);
	// 공지게시판 콘텐츠
	public GboardDto g_content(String id);
	// 공지게시판 삭제
	public void g_delete(String id);
	// 공지게시판 글수정
	public GboardDto g_update(String id);
	// 공지게시판 글수정 등록
	public void g_update_ok(GboardDto gdto);
	
	// QnA 게시판 그룹값
	public int q_grp();
	// QnA 게시판 글 저장
	public void q_write_ok(QboardDto qdto);
	// QnA 게시판 리스트 출력
	public ArrayList<QboardDto> q_board(int index);
	// QnA 게시판 총 레코드수 조회
	public int qchong_record();
	// QnA 게시판 조회수 증가
	public void q_readnum(String id);
	// QnA 게시판 콘텐츠
	public QboardDto q_content(String id);
	// QnA 게시판 삭제
	public void q_delete(String id);
	// QnA 게시판 글수정
	public QboardDto q_update(String id);
	// QnA 게시판 글수정 등록
	public void q_update_ok(QboardDto qdto);
	// QnA 게시판 seq,grp,depth 가져오기
	public QboardDto q_qwrite(String id);
	// QnA 게시판 seq,grp 업데이트
	public void q_write_update(int seq,int grp);
	// QnA 게시판 답글 등록
	public void q_qwrite_ok(QboardDto qdto);
}

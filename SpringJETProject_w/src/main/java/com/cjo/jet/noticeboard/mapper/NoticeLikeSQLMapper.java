package com.cjo.jet.noticeboard.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.cjo.jet.vo.NoticeLikeVo;

public interface NoticeLikeSQLMapper {

	public void insertLike(NoticeLikeVo vo);

	public void deleteLike(@Param("jet_board_notice_no") int jet_board_notice_no,@Param("jet_member_no") int jet_member_no);
	
	public NoticeLikeVo selectByNo(@Param("jet_board_notice_no") int jet_board_notice_no,@Param("jet_member_no") int jet_member_no);
	//public ArrayList<NoticeLikeVo> selectByNo(int no);
	//아무리생각해도 어레이리스트임 
	//이제 한줄임 NoticeLikeVo 한줄 나옴,int jet_member_no
	//여기서 드는 의문.. 이름을 설정해줫다고 해서 쿼리 잘 찾아가나...
	
	public int likeCount(int no);
	//좋아요 갯수
	
	
}

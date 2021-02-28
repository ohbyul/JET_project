package com.cjo.jet.member.mapper;

import java.util.ArrayList;

import com.cjo.jet.vo.MemberImageVo;

public interface MemberImageSQLMapper {

	public void insert(MemberImageVo vo);
	
	public ArrayList<MemberImageVo> selectByMemberNo(int member_no);
	
}

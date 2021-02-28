package com.cjo.jet.noticeboard.mapper;

import java.util.ArrayList;

import com.cjo.jet.vo.NoticeImageVo;

public interface NoticeImageSQLMapper {

	public void insert(NoticeImageVo vo);
	
	public ArrayList<NoticeImageVo> selectByContentNo(int notice_no);
		
}

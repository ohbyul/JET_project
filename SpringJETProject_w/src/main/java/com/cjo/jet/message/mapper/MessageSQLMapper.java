package com.cjo.jet.message.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.cjo.jet.vo.MessageVo;

public interface MessageSQLMapper {
	
	public int createKey();
	//쪽지 글쓰기
	public void insertMessage(MessageVo vo);
	//보낸 쪽지함 리스트 - 나중에 각 쿼리가 나눠질 수 있어서 나눠 놓음
	public ArrayList<MessageVo> selectSentMessage(@Param("page_num") int page_num ,@Param("sender_no") int sender_no);
	
	//받은 쪽지함 리스트
	public ArrayList<MessageVo> selectMessage(@Param("page_num") int page_num ,@Param("receiver_no") int receiver_no);
	//페이징 - 페이지 갯수 처리
	public int getPageCount();
	//서치
	public ArrayList<MessageVo> selectByTitleAndSender(@Param("search_word") String search_word, @Param("sender_no") int sender_no);
	
	public ArrayList<MessageVo> selectByContentAndSender(@Param("search_word")String search_word, @Param("sender_no") int sender_no);
	
	public ArrayList<MessageVo> selectByTitleAndReceiver(@Param("search_word")String search_word, @Param("receiver_no") int receiver_no);
	
	public ArrayList<MessageVo> selectByContentAndReceiver(@Param("search_word")String search_word, @Param("receiver_no") int receiver_no);
	//보낸 사람 검색 - 아직 미구현
	public ArrayList<MessageVo> selectBySender(@Param("search_word")String search_word/*int search_nick*/);
	//받는 사람 검색 - 아직 미구현
	public ArrayList<MessageVo> selectByReceiver(String search_word);
	
	//쪽지 읽기
	public MessageVo selectByMessageNo(int no);
	//답장 페이지 불러오기 용
	public MessageVo selectByMessageNoForReply(@Param("jet_message_no")int jet_message_no);
	//답장 <- 새로 글쓰는 것과 다를 바 없음
	public void replyMessage(MessageVo vo);
	//받은 쪽지 삭제
	public void deleteMessageByNo(int no);
	
	//관리자용 보낸 쪽지리스트
	public ArrayList<MessageVo> selectSentMessageForAdmin( int sender_no);
}

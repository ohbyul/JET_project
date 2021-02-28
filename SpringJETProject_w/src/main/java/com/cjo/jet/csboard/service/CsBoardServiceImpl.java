package com.cjo.jet.csboard.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.w3c.dom.CDATASection;

import com.cjo.jet.csboard.mapper.CsBoardAnswerSQLMapper;
import com.cjo.jet.csboard.mapper.CsBoardAssignSQLMapper;
import com.cjo.jet.csboard.mapper.CsBoardImageSQLMapper;
import com.cjo.jet.csboard.mapper.CsBoardSQLMapper;
import com.cjo.jet.member.mapper.MemberSQLMapper;
import com.cjo.jet.vo.AdminAssignVo;
import com.cjo.jet.vo.CsBoardAnswerVo;
import com.cjo.jet.vo.CsBoardCategoryVo;
import com.cjo.jet.vo.CsBoardImageVo;
import com.cjo.jet.vo.CsBoardVo;
import com.cjo.jet.vo.MemberVo;


@Service
public class CsBoardServiceImpl {

	@Autowired
	private CsBoardSQLMapper csBoardSQLMapper;

	@Autowired
	private MemberSQLMapper memberSQLMapper;

	@Autowired
	private CsBoardImageSQLMapper csBoardImageSQLMapper;
	
	@Autowired
	private CsBoardAnswerSQLMapper csBoardAnswerSQLMapper;
	
	@Autowired
	private CsBoardAssignSQLMapper csBoardAssignSQLMapper;
	
	//글쓰기
	public void writeCsBoard(CsBoardVo vo, ArrayList<CsBoardImageVo> imageVoList) {
		
		int csBoardPK = csBoardSQLMapper.creatKey();
		//프라이머리 키 생성하고
		System.out.println("csBoardPK : " + csBoardPK);
		
		vo.setJet_board_m_cs_no(csBoardPK);
		
		csBoardSQLMapper.insert(vo);
		//글쓰기 
		
		for(CsBoardImageVo imageVo : imageVoList) {
			imageVo.setJet_board_m_cs_no(csBoardPK);
			//이미지 출력시 여기서 실수 난 image_no 에 넣어버림 시발
			csBoardImageSQLMapper.insert(imageVo);
		}
		
		//배정 
		int assignAdminNo = csBoardAssignSQLMapper.selectByAssignAdminNo();
	
		AdminAssignVo adminAssignVo = new AdminAssignVo();
		
		adminAssignVo.setJet_board_m_cs_no(csBoardPK);
		adminAssignVo.setJet_member_no(assignAdminNo);
		
		csBoardAssignSQLMapper.insertAssign(adminAssignVo);
	
	}
		
	//글 리스트 출력 CS게시판 메인에서
	public ArrayList<HashMap<String, Object>> getCsBoardList(String search_word ,String search_type,int page_num){

		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String, Object>>();
		
	
		ArrayList<CsBoardVo> csBoardList =null;
		
		if(search_word == null || search_type == null) {
			csBoardList = csBoardSQLMapper.selectAll(page_num);
		
		}else {
			if(search_type.equals("title")) {	
				csBoardList = csBoardSQLMapper.selectByTitle(search_word);
			}
			else if(search_type.equals("content")) {
				csBoardList = csBoardSQLMapper.selectByContent(search_word);
			}else if (search_type.equals("writer")) {
				csBoardList = csBoardSQLMapper.selectByWriter(search_word);
			}else {
				csBoardList = csBoardSQLMapper.selectAll(page_num);
			}
		}


		for(CsBoardVo csBoardVo : csBoardList) {
			
			int memberFK = csBoardVo.getJet_member_no();
			MemberVo memberVo = memberSQLMapper.selectByNo(memberFK);
			
			//여기가 킥임..이해하기 어려우나 사실 쉬음 고객이 쓴글과 관리자답변글 연결해주기
			int csBoardFK = csBoardVo.getJet_board_m_cs_no();
			CsBoardAnswerVo csBoardAnswerVo = csBoardAnswerSQLMapper.foreignKey(csBoardFK);

			//관리자 이름 따로..
			MemberVo memberAdminVo = null;
			if(csBoardAnswerVo != null) {
				memberFK=csBoardAnswerVo.getJet_member_no();
				memberAdminVo = memberSQLMapper.selectByNo(memberFK);
			}
			
			HashMap<String, Object> map = new HashMap<String, Object>();
		
			//키는 항상 스트링 값은 오브젝트.. 왜 오브젝트냐 ? 둘이 다른 리턴 타입임으로
			map.put("memberVo", memberVo);
			map.put("csBoardVo", csBoardVo);
			map.put("csBoardAnswerVo", csBoardAnswerVo);
			map.put("memberAdminVo", memberAdminVo);
			
			resultList.add(map);
		}

		return resultList;
	}
			
	//글 읽기
	public HashMap<String, Object> getCsBoard(int contentNo) {
		//하나의 Vo 만 뽑아내므로 ArrayList 로 안엮음
		
		
		csBoardSQLMapper.increaseReadcount(contentNo);
		//조회수..증가연동
		
		CsBoardVo csBoardVo = csBoardSQLMapper.selectByNo(contentNo);
		
		//read 할때 엔터가 안되는거 고치기.
		String str = csBoardVo.getJet_board_m_cs_content();
		str = StringEscapeUtils.escapeHtml4(str);
		str = str.replaceAll("\n", "<br>");
		csBoardVo.setJet_board_m_cs_content(str);
		
		int jet_member_no = csBoardVo.getJet_member_no();
		MemberVo memberVo = memberSQLMapper.selectByNo(jet_member_no);
		
		//csBoardVo + memberVo  뽑아오기 이제 hashMap으로 엮자
		
		ArrayList<CsBoardImageVo> imageVoList = csBoardImageSQLMapper.selectByContentNo(contentNo);
		//이미지 리스트 출력
				
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("csBoardVo", csBoardVo);
		map.put("memberVo", memberVo);
		map.put("imageVoList", imageVoList);
		
		
		return map;
	}
		
	//글삭제
	public void deleteCsBoard(int contentNo) {
		csBoardSQLMapper.deleteByNo(contentNo);
	}

	//글 수정
	public void updateCsBoard(CsBoardVo vo) {
		csBoardSQLMapper.update(vo);
	}
	
	//페이지 갯수
	public int getPageCount() {	
		return csBoardSQLMapper.getPageCount();
	}
//----------------------------------------------------------------
	//답변입력
	public void writeAnswerCsBoard(CsBoardAnswerVo vo) {
	
		csBoardAnswerSQLMapper.insert(vo);
		
	}
	//글 답변 읽기
	public HashMap<String, Object> getAnswerCsBoard(int contentNo) {
		
		
		csBoardAnswerSQLMapper.increaseReadcount(contentNo);
		//조회수증가!!!!한줄!!
		
		CsBoardAnswerVo csBoardAnswerVo = csBoardAnswerSQLMapper.selectByNo(contentNo);
		
		//read 할때 엔터가 안되는거 고치기.
		String str = csBoardAnswerVo.getJet_board_a_cs_content();
		str = StringEscapeUtils.escapeHtml4(str);
		str = str.replaceAll("\n", "<br>");
		csBoardAnswerVo.setJet_board_a_cs_content(str);
		
		int member_no = csBoardAnswerVo.getJet_member_no();
		MemberVo memberVo = memberSQLMapper.selectByNo(member_no);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberVo", memberVo);
		map.put("csBoardAnswerVo", csBoardAnswerVo);
		
		return map;
	}

	//답변 글 삭제
	public void deleteCsBoardAnswer(int contentNo) {
		csBoardAnswerSQLMapper.deleteByNo(contentNo);
	}

	
//------------------------------------------------------
	
	//글 리스트 출력 온리 관리자 페이지에서 .. 페이징 오류 해결 을 위해 페이지 처리 안하고 전체 출력..
	public ArrayList<HashMap<String, Object>> getCsBoardListNoPage(String search_word ,String search_type){

		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String, Object>>();
	
		ArrayList<CsBoardVo> csBoardList =null;

		if(search_word == null || search_type == null) {
			csBoardList = csBoardSQLMapper.selectAllNoPage();
		}else {
			if(search_type.equals("title")) {	
				csBoardList = csBoardSQLMapper.selectByTitle(search_word);
			}
			else if(search_type.equals("content")) {
				csBoardList = csBoardSQLMapper.selectByContent(search_word);
			}else if (search_type.equals("writer")) {
				csBoardList = csBoardSQLMapper.selectByWriter(search_word);
			}else {
				csBoardList = csBoardSQLMapper.selectAllNoPage();
			}
		}

		for(CsBoardVo csBoardVo : csBoardList) {
			
			int memberFK = csBoardVo.getJet_member_no();
			MemberVo memberVo = memberSQLMapper.selectByNo(memberFK);
			
			//여기가 킥임..이해하기 어려우나 사실 쉬음 고객이 쓴글과 관리자답변글 연결해주기
			int csBoardFK = csBoardVo.getJet_board_m_cs_no();
			System.out.println("[test] csboardFK" + csBoardFK);
			CsBoardAnswerVo csBoardAnswerVo = csBoardAnswerSQLMapper.foreignKey(csBoardFK);
			
			System.out.println("csBoardAnswerVo 위치: " + csBoardAnswerVo );

			//관리자 이름 따로..
			MemberVo memberAdminVo = null;
			if(csBoardAnswerVo != null) {
				memberFK=csBoardAnswerVo.getJet_member_no();
				memberAdminVo = memberSQLMapper.selectByNo(memberFK);
			}
			
			HashMap<String, Object> map = new HashMap<String, Object>();
		
			//키는 항상 스트링 값은 오브젝트.. 왜 오브젝트냐 ? 둘이 다른 리턴 타입임으로
			map.put("memberVo", memberVo);
			map.put("csBoardVo", csBoardVo);
			map.put("csBoardAnswerVo", csBoardAnswerVo);
			map.put("memberAdminVo", memberAdminVo);
			//키는 내가 짓고싶은 이름, 이름 중요, get할때 쓰임, 값은 넣어야하는 오브젝트들..
			
			resultList.add(map);
		}
		return resultList;
	}	
	
//---------------------관리자 배정 페이지--------------------

/*	//글리스트 출력 배정된 글만
	public ArrayList<HashMap<String, Object>> getCsBoardAssignListNoPage(){

		ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String, Object>>();
		ArrayList<CsBoardVo> csBoardList =null;
		csBoardList = csBoardSQLMapper.selectAllNoPage();
		
		if?
		for(CsBoardVo csBoardVo : csBoardList) {
			
			ArrayList<AdminAssignVo> assignList = csBoardAssignSQLMapper.selectByAdminNo();
			
			for(AdminAssignVo adminAssignVo : assignList) {
				
				int assignCsBoardNo = adminAssignVo.getJet_board_m_cs_no();	
				csBoardVo.setJet_board_m_cs_no(assignCsBoardNo);
			}
			
			
			int memberFK = csBoardVo.getJet_member_no();
			MemberVo memberVo = memberSQLMapper.selectByNo(memberFK);
			
			//여기가 킥임..이해하기 어려우나 사실 쉬음 고객이 쓴글과 관리자답변글 연결해주기
			int csBoardFK = csBoardVo.getJet_board_m_cs_no();
			System.out.println("[test] csboardFK" + csBoardFK);
			CsBoardAnswerVo csBoardAnswerVo = csBoardAnswerSQLMapper.foreignKey(csBoardFK);
			
			System.out.println("csBoardAnswerVo 위치: " + csBoardAnswerVo );

			//관리자 이름 따로..
			MemberVo memberAdminVo = null;
			if(csBoardAnswerVo != null) {
				memberFK=csBoardAnswerVo.getJet_member_no();
				memberAdminVo = memberSQLMapper.selectByNo(memberFK);
			}
			
			HashMap<String, Object> map = new HashMap<String, Object>();
		
			//키는 항상 스트링 값은 오브젝트.. 왜 오브젝트냐 ? 둘이 다른 리턴 타입임으로
			map.put("memberVo", memberVo);
			map.put("csBoardVo", csBoardVo);
			map.put("csBoardAnswerVo", csBoardAnswerVo);
			map.put("memberAdminVo", memberAdminVo);
					
			resultList.add(map);
		}
		return resultList;
	}	
*/
	public ArrayList<HashMap<String, Object>> getAssignList(int admin_no){
		
		ArrayList<HashMap<String, Object>> resultAssignList = new ArrayList<HashMap<String, Object>>();
		ArrayList<AdminAssignVo> assignList =null;
		assignList = csBoardAssignSQLMapper.selectByAdminNo(admin_no);
		
		for(AdminAssignVo adminAssignVo : assignList) {
			
			int memberFK = adminAssignVo.getJet_member_no();
			MemberVo memberVo = memberSQLMapper.selectByNo(memberFK);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
		
			//키는 항상 스트링 값은 오브젝트.. 왜 오브젝트냐 ? 둘이 다른 리턴 타입임으로
			map.put("memberVo", memberVo);
			map.put("adminAssignVo", adminAssignVo);
		
			resultAssignList.add(map);
		}
		return resultAssignList;
	}


	
	
	
	
	
	
	
		
}

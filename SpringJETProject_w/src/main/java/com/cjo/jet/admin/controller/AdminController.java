package com.cjo.jet.admin.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cjo.jet.classboard.service.ClassboardServiceImpl;
import com.cjo.jet.csboard.service.CsBoardServiceImpl;
import com.cjo.jet.knowhow.service.KnowhowBoardServiceImpl;
import com.cjo.jet.member.service.MemberServiceImpl;
import com.cjo.jet.message.service.MessageServiceImpl;
import com.cjo.jet.noticeboard.service.NoticeBoardServiceImpl;
import com.cjo.jet.partyboard.service.PartyBoardServiceImpl;
import com.cjo.jet.vo.CsBoardAnswerVo;
import com.cjo.jet.vo.MemberVo;
import com.cjo.jet.vo.MessageVo;
import com.cjo.jet.vo.NoticeBoardVo;
import com.cjo.jet.vo.NoticeImageVo;
import com.cjo.jet.vo.PartySingoVo;
import com.sun.org.apache.regexp.internal.recompile;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	//map.xml -> mapper -> service -> controller
	
	@Autowired
	private CsBoardServiceImpl csBoardService;
	
	@Autowired
	private NoticeBoardServiceImpl noticeBoardService;
	
	@Autowired
	private PartyBoardServiceImpl partyBoardService;
	
	@Autowired
	private KnowhowBoardServiceImpl knowhowBoardService;
	@Autowired
	private ClassboardServiceImpl classBoardService;
	@Autowired
	private MemberServiceImpl memberService;
	
	@Autowired
	private MessageServiceImpl messageService;
	
	@RequestMapping("admin_main_page.do")
	public String adminMainPage(Model model) {
		ArrayList<HashMap<String, Object>> resultList = partyBoardService.getPartySingoList();
		ArrayList<Object> newSingo = partyBoardService.newPartySingoList();
		
		System.out.println("[adminMainPage] 실행됨");
		model.addAttribute("resultList",resultList);
		model.addAttribute("newSingo",newSingo);
		
		return "admin/admin_main_page";
	}
	
	@RequestMapping("admin_csboard_page.do")
	public String adminCsBoardPage(Model model,String search_word,String search_type,@RequestParam(value="page_num",defaultValue = "1") int page_num) {
		
		//cs 보드 전체 글 출력
		ArrayList<HashMap<String, Object>> resultList = csBoardService.getCsBoardList(search_word, search_type, page_num);
		
		//페이지 출력
		int pageCount = csBoardService.getPageCount();
	 	//페이지 갯수 받자
	 	int currentPage = page_num ;
	 	int beginPage = ((currentPage-1)/5) * 5 + 1;
	 	int endPage = ((currentPage-1)/5 + 1) * (5);
	 	//페이지 계산하기 정수나누기임 1/5 = 0 이됨.. 나머지값 버림 인트니까
	 	
	 	if(endPage > pageCount) {
	 		endPage = pageCount;
	 	}
	 	//몬소리야..페이지 출력 끝
		
		model.addAttribute("resultList", resultList);
		//출력만 아직...
		model.addAttribute("currentPage", currentPage);
	 	model.addAttribute("beginPage", beginPage);
	 	model.addAttribute("endPage", endPage);
	 	model.addAttribute("pageCount", pageCount);
		
		return "admin/admin_csboard_page";
	}
	
	
	@RequestMapping("admin_csboard_before_page.do")
	public String adminCsboardBeforePage(Model model,String search_word,String search_type) {
		System.out.println("[adminCsboardBeforePage] 실행됨");

		//cs 보드 전체 글 출력 no페이징 페이지 오류떄문에
		ArrayList<HashMap<String, Object>> resultList = csBoardService.getCsBoardListNoPage(search_word, search_type);
		
		model.addAttribute("resultList", resultList);
	
		return "admin/admin_csboard_before_page";
	}
	
	@RequestMapping("admin_csboard_complete_page.do")
	public String adminCsboardCompletePage(Model model,String search_word,String search_type) {
		System.out.println("[adminCsboardCompletePage] 실행됨");

		//cs 보드 전체 글 출력 no 페이징 페이지 오류때문에
		ArrayList<HashMap<String, Object>> resultList = csBoardService.getCsBoardListNoPage(search_word, search_type);
		
		model.addAttribute("resultList", resultList);
	
		return "admin/admin_csboard_complete_page";
	}
	
	@RequestMapping("admin_assign_before_page.do")
	public String adminCsboardAssignBeforePage(Model model,HttpSession session,String search_word,String search_type) {
		System.out.println("[admin Csboard Assign Before Page] 실행됨");
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int adminNo = sessionUser.getJet_member_no();

		
		ArrayList<HashMap<String,Object>> resultList = csBoardService.getCsBoardListNoPage(search_word,search_type);
		ArrayList<HashMap<String, Object>> assignList = csBoardService.getAssignList(adminNo);
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("assignList", assignList);
		//assignList -> adminAssignVo ->두줄 이상.. 
		
		return "admin/admin_assign_before_page";
	}
	
	@RequestMapping("admin_assign_complete_page.do")
	public String adminCsboardAssignCompletePage(Model model,HttpSession session,String search_word,String search_type) {
		System.out.println("[adminCsboard Assign Complete Page] 실행됨");
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int adminNo = sessionUser.getJet_member_no();

		
		ArrayList<HashMap<String,Object>> resultList = csBoardService.getCsBoardListNoPage(search_word,search_type);
		ArrayList<HashMap<String, Object>> assignList = csBoardService.getAssignList(adminNo);
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("assignList", assignList);
		//assignList -> adminAssignVo ->두줄 이상.. 
		
		return "admin/admin_assign_complete_page";
	}
	
//--------위:cs보드 메인페이지5개---아래:문의글읽기 답변글 읽기 삭제 등--------------------------------------------------
	@RequestMapping("admin_csboard_read_page.do")
	public String adminCsboardReadPage(int jet_board_m_cs_no,Model model) {
		
		HashMap<String, Object> map = csBoardService.getCsBoard(jet_board_m_cs_no);
		
		model.addAttribute("result", map);
		
		return "admin/admin_csboard_read_page";
	}
	
	@RequestMapping("admin_csboard_answer_read_page.do")
	public String adminCsboardAnswerReadPage(int jet_board_a_cs_no, Model model) {
		
		HashMap<String, Object> map =  csBoardService.getAnswerCsBoard(jet_board_a_cs_no);
		
		model.addAttribute("result", map);
		
		return "admin/admin_csboard_answer_read_page";
	}
	
	@RequestMapping("admin_csboard_answer_write_page.do")
	public String admincsboardAnswerWritePage(int jet_board_m_cs_no,Model model) {
		
		//업데이트 코드 그대로
		HashMap<String, Object> map = csBoardService.getCsBoard(jet_board_m_cs_no);
		//겟보드 그대로 출력 함 수정 전임으로..
		model.addAttribute("result", map);
		
		return "admin/admin_csboard_answer_write_page";
	}
	
	@RequestMapping("admin_csboard_answer_write_process.do")
	public String adminCsboardAnswerWriteProcess(int jet_board_m_cs_no,CsBoardAnswerVo param,HttpSession session) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int member_no = sessionUser.getJet_member_no();
		
		int originalNo = jet_board_m_cs_no;
		System.out.println("originalNo :" +originalNo);
		
		param.setJet_board_m_cs_no(originalNo);
		
		param.setJet_member_no(member_no);
		
		csBoardService.writeAnswerCsBoard(param);
		
		return "redirect:./admin_csboard_page.do";
	}

	@RequestMapping("admin_csboard_answer_delete_process.do")
	public String adminCsboardAnswerDeleteProcess(int jet_board_a_cs_no) {
		csBoardService.deleteCsBoardAnswer(jet_board_a_cs_no);
		return "redirect:./admin_csboard_page.do";
	}

//---공지사항 도전-------------------------------------------------------------------------------------

	@RequestMapping("admin_notice_board_page.do")
	public String adminNoticeBoardPage(Model model,@RequestParam(value="page_num",defaultValue = "1") int page_num) {
		System.out.println("[adminNoticeBoardPage] 실행됨");
		
		//공지사항 글 리스트 출력
		ArrayList<HashMap<String, Object>> resultList = noticeBoardService.getNoticeBoardList(page_num);
		//페이지 출력
		int pageCount = noticeBoardService.getPageCount();
	 	//페이지 갯수 받자
	 	int currentPage = page_num ;
	 	int beginPage = ((currentPage-1)/5) * 5 + 1;
	 	int endPage = ((currentPage-1)/5 + 1) * (5);
	 	//페이지 계산하기 정수나누기임 1/5 = 0 이됨.. 나머지값 버림 인트니까
	 	
	 	if(endPage > pageCount) {
	 		endPage = pageCount;
	 	}
	 	//몬소리야..페이지 출력 끝
		
		model.addAttribute("resultList", resultList);
		//출력만 아직...
		model.addAttribute("currentPage", currentPage);
	 	model.addAttribute("beginPage", beginPage);
	 	model.addAttribute("endPage", endPage);
	 	model.addAttribute("pageCount", pageCount);
	 	
		
		return "admin/admin_notice_board_page";
	}
	
	@RequestMapping("admin_notice_board_write_page.do")
	public String adminNoticeBoardWritePage() {
	
		return "admin/admin_notice_board_write_page";
	}
	
	@RequestMapping("admin_notice_board_write_process.do")
	public String admin_notice_board_write_process(NoticeBoardVo param,HttpSession session,MultipartFile [] files) {
		//변수 생성 해야함.. 이미지때문에
		ArrayList<NoticeImageVo> imageVoList = new ArrayList<NoticeImageVo>();
		
		//이미지..
		for(MultipartFile file : files) {
			
			if(file.getSize() <=0) {
				continue;
				//예외처리.. 파일이 0보다 작다 = 파일업로드를 안했다. 그럼 밑에꺼를 수행하지않겠다.
			}
			
			//날짜 별 폴더 만들기 (자동으로)
			//.../년도/월/일/랜덤네임_시간.확장자명..
			String uploadRootFolderName = "/upload_files/";
			//역슬래시 두개도 가능 ..우리는 슬레시 하나로
			
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			String todayFolder = sdf.format(today);
			
			String uploadFolderName = uploadRootFolderName + todayFolder;
			//최종 폴더의 문자열 ...여기에 파일 이름은 더한다.
			
			System.out.println("[test uploadFolderName : ]" +uploadFolderName);
			
			File uploadFolder = new File(uploadFolderName);
			//파일이라는 이름의 클래스
			//역할 : 파일 혹은 폴더 에 속성을 컨트롤.. 
			
			//이러한 폴더가 존재하지 않으면.. 
			if(!uploadFolder.exists()) {
				uploadFolder.mkdirs();
				//dir...dirs는 복수 폴더를 싹다 만든다.
			}
			
			String originalFileName = file.getOriginalFilename();
			//저장시.. 파일명 변경 
			//목적 : 충돌 방지(덮어 씌우기 방지)
			//방법 : 랜덤 (문제.. 아주 극소수 충돌 문제) +시간 (충돌문제 없애기위해)
			
			String randomName = UUID.randomUUID().toString();

			long currentTime = System.currentTimeMillis();
			
			randomName = randomName + "_" + currentTime;
			
			//확장자 추가 ..(오리지널 파일 네임에서 뽑아옴)
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
			
			randomName += ext;
			
			try {
				file.transferTo(new File(uploadFolderName + "/" + randomName));
				//내서버에 저장 하겠다. //c:upload_files/2020/12/23 "/" randomname.jpg
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			//imageVo 객체 생성..
			NoticeImageVo imageVo = new NoticeImageVo();
			
			String link = "/upload/" + todayFolder + "/" + randomName; 
			
			imageVo.setJet_board_notice_image_link(link);
			
			imageVoList.add(imageVo);
		}	//포문 닫기 이미지 끝		
		
		//데이터 처리
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
	
		int jet_member_no = sessionUser.getJet_member_no();
		
		param.setJet_member_no(jet_member_no);
		
		noticeBoardService.writeNoticeBoard(param,imageVoList);
		
		return "redirect:./admin_notice_board_page.do";
	}
	
	@RequestMapping("admin_notice_board_read_page.do")
	public String readNoticeBoardPage(int jet_board_notice_no,Model model) {
		
		HashMap<String, Object> map = noticeBoardService.getNoticeBoard(jet_board_notice_no);
		
		//리플 출력해야함 공지사항 에 리플? 이미지랑 추천 갯수만 받을까 생각중 
		
		model.addAttribute("result", map);
		
		return "admin/admin_notice_board_read_page";
	}
	
	@RequestMapping("admin_notice_board_delete_process.do")
	public String deleteCsBoardProcess(int jet_board_notice_no) {
		
		noticeBoardService.deleteNoticeBoard(jet_board_notice_no);
		
		return "redirect:./admin_notice_board_page.do";
	}
	
	@RequestMapping("admin_notice_board_update_page.do")
	public String updateCsBoardPage(int jet_board_notice_no, Model model) {
		
		HashMap<String, Object> map = noticeBoardService.getNoticeBoard(jet_board_notice_no);
		//겟보드 그대로 출력 함 수정 전임으로..
		model.addAttribute("result", map);
		
		return "admin/admin_notice_board_update_page";
	}

	@RequestMapping("admin_notice_board_update_process.do")
	public String updateCsBoardProcess(NoticeBoardVo param) {
		
		noticeBoardService.updateNoticeBoard(param);
		
		return "redirect:./admin_notice_board_page.do";
	}
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ신고 리스트ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	@RequestMapping("admin_declaration_notice_list_page.do")
	public String adminDeclarationNoticeListPage(Model model) {
		
		ArrayList<HashMap<String, Object>> resultList = noticeBoardService.getNoticeSingoList();
		
		model.addAttribute("resultList",resultList);
		
		return "admin/admin_declaration_notice_list_page";
	}
	
	@RequestMapping("admin_declaration_party_list_page.do")
	public String adminDeclarationPartyListPage(Model model) {
		
		ArrayList<HashMap<String, Object>> resultList = partyBoardService.getPartySingoList();
		
		model.addAttribute("resultList",resultList);
		
		return "admin/admin_declaration_party_list_page";
	}
	@RequestMapping("admin_declaration_knowhow_list_page.do")
	public String adminDeclarationKnowhowListPage(Model model) {
		
		ArrayList<HashMap<String, Object>> resultList = knowhowBoardService.getKnowhowSingoList();
		
		model.addAttribute("resultList",resultList);
		
		return "admin/admin_declaration_knowhow_list_page";
	}
	@RequestMapping("admin_declaration_class_list_page.do")
	public String adminDeclarationClassListPage(Model model) {
		
		ArrayList<HashMap<String, Object>> resultList = classBoardService.getClassSingoList();
		
		model.addAttribute("resultList",resultList);
		
		return "admin/admin_declaration_class_list_page";
	}
	
//--------------회원관리------------------------------------------------------------------------	
	@RequestMapping("admin_member_management_page.do")
	public String adminMemberManagementPage(Model model,String search_word,String search_type, 
			@RequestParam(value = "page_num", defaultValue = "1") int page_num) {
		System.out.println("adminMemberManagementPage 실행");
		
		ArrayList<HashMap<String, Object>> map =  memberService.getadminMemberManagement(search_word, search_type,page_num);
		
		int pageCount = memberService.getPageCountForAdmin();
		int currentPage = page_num;
	 	int beginPage = ((currentPage-1)/5) * 5 + 1;
	 	int endPage = ((currentPage-1)/5 + 1) * (5);
	 	// 페이지 계산: int. 정수 나누기 정수. 나머지 버리니까 1/5 = 0 이 된다.
	 	
	 	if(endPage > pageCount) {
	 		endPage = pageCount;
	 	}
	 	model.addAttribute("currentPage", currentPage);
	 	model.addAttribute("beginPage", beginPage);
	 	model.addAttribute("endPage", endPage);
	 	model.addAttribute("pageCount", pageCount);
		model.addAttribute("resultMemberList", map);
		
		return "admin/admin_member_management_page";
	}
	@RequestMapping("admin_member_stopedmember_page.do")
	public String adminStopedMemberPage(Model model,@RequestParam(value = "page_num", defaultValue = "1") int page_num ) {
		
		ArrayList<HashMap<String, Object>> map = memberService.getStopedMemberList(page_num);
		model.addAttribute("resultMemberList", map);
		
		return "admin/admin_member_stopedmember_page";
	}
	//회원의 상세한 정보
	@RequestMapping("admin_member_detailstate_page.do")
	public String adminMemberDetailstatePage(Model model, int jet_member_no) {
		
		HashMap<String, Object> vo = memberService.getMemberInfo(jet_member_no);
		System.out.println("[test memberStatus vo]"+vo);
		model.addAttribute("data", vo);
		
		return "admin/admin_member_detailstate_page";
	}
	
	@RequestMapping("admin_update_memberstat_process.do")
	public String adminUpdateMemberstatProcess() {
		
		return "redirect:./admin_member_detailstate_page.do";
	}
	
//-------test----------------------------------------------
	@RequestMapping("test_tap.do")
	public String testTapPage() {

		return "admin/test_tap";
	}
	
	
	@RequestMapping("test_read.do")
	public String testReadPage(Model model,String search_word,String search_type) {
		
		ArrayList<HashMap<String, Object>> resultList = csBoardService.getCsBoardListNoPage(search_word, search_type);
		
		model.addAttribute("resultList", resultList);
		
		return "admin/test_read";
	}

	
	@RequestMapping("test_accodian.do")
	public String test_accodian(Model model,String search_word,String search_type) {
		System.out.println("[test_accodian] 실행됨");
		
		ArrayList<HashMap<String, Object>> resultList = csBoardService.getCsBoardListNoPage(search_word, search_type);
		
		model.addAttribute("resultList", resultList);
		
		return "admin/test_accodian";
	}
// 관리자 쪽지 부분-----------------------------------------------------------------------------
	//관리자 쪽지함 페이지
	@RequestMapping("admin_message_page.do")
	public String adminMessagePage(Model model, HttpSession session) {
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		
		ArrayList<HashMap<String, Object>> messageList = messageService.getSentMessageListForAdmin(memberVo.getJet_member_no());
		
		model.addAttribute("messageList",messageList);
		
		return "admin/admin_message_page";
	}
	
	//관리자 쪽지 작성 페이지
	@RequestMapping("admin_message_write_page.do")
	public String adminMessageWritePage() {
		
		return "admin/admin_message_write_page";
	}
	
	//관리자 to 사용자 쪽지 보내기
	@RequestMapping("admin_message_write_process.do")
	public String adminMessageWriteProcess(MessageVo param, String jet_member_nick, HttpSession session) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int jet_memeber_no = sessionUser.getJet_member_no();
		
		int jet_member_receiver = messageService.getNoByNick(jet_member_nick);
		
		param.setJet_member_sender(jet_memeber_no);
		param.setJet_member_receiver(jet_member_receiver);
		
		messageService.writeMessage(param);
		
		return "redirect:./admin_message_page.do";
	}
	//관리자 보낸 쪽지 읽기
	@RequestMapping("admin_message_read_page.do")
	public String adminMessageReadPage(Model model, int jet_message_no) {
		
		HashMap<String, Object> resultMap = messageService.getMessage(jet_message_no);
		
		model.addAttribute("result",resultMap);
		
		return "admin/admin_message_read_page";
	}
	@RequestMapping("admin_dashboard_page.do")
	public String adminDashBoardPage() {
		
		return "admin/admin_dashboard_page";
	}
	//등업
	@RequestMapping("admin_member_upgrade_page.do")
	public String adminMemberUpgradePage(Model model,String search_word,String search_type
			,@RequestParam(value = "page_num", defaultValue = "1") int page_num) {
		ArrayList<HashMap<String, Object>> map =  memberService.getMemberUpgrade(search_word, search_type, page_num);
		
		model.addAttribute("resultMemberList", map);
		return "admin/admin_member_upgrade_page";
	}
}

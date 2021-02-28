package com.cjo.jet.noticeboard.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cjo.jet.noticeboard.service.NoticeBoardServiceImpl;
import com.cjo.jet.vo.CsBoardAnswerVo;
import com.cjo.jet.vo.CsBoardImageVo;
import com.cjo.jet.vo.MemberVo;
import com.cjo.jet.vo.NoticeBoardVo;
import com.cjo.jet.vo.NoticeImageVo;
import com.cjo.jet.vo.NoticeLikeVo;

@Controller
@RequestMapping("/notice_board/*")
public class NoticeBoardController {
	
	//map.xml -> mapper -> service -> controller
		
	@Autowired
	private NoticeBoardServiceImpl noticeBoardService;
	
	@RequestMapping("notice_board_page.do")
	public String noticeBoardPage(Model model,@RequestParam(value="page_num",defaultValue = "1") int page_num) {
		
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
	 	
	 	Date today = new Date();
	 	int day =today.getDate();
		day-=1;
		today.setDate(day);
	 	System.out.println("@@공지사항 컨트롤러 today :" +today);
		model.addAttribute("today",today);

	 
		model.addAttribute("resultList", resultList);
		//출력만 아직...
		model.addAttribute("currentPage", currentPage);
	 	model.addAttribute("beginPage", beginPage);
	 	model.addAttribute("endPage", endPage);
	 	model.addAttribute("pageCount", pageCount);
	 	

		return "notice_board/notice_board_page";
	}
	
	@RequestMapping("write_notice_board_page.do")
	public String writeNoticeBoardPage() {
		
		return "notice_board/write_notice_board_page";
	}
	
	@RequestMapping("write_notice_board_process.do")
	public String writeNoticeBoardProcess(NoticeBoardVo param,HttpSession session,MultipartFile [] files) {
		//변수 생성 해야함.. 이미지때문에MultipartFile [] files
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
		
		System.out.println("공지사항 글쓰기 jet_member_no :" +jet_member_no);
		
		param.setJet_member_no(jet_member_no);
		
		noticeBoardService.writeNoticeBoard(param,imageVoList);
		
		return "redirect:./notice_board_page.do";
	}
	
	@RequestMapping("read_notice_board_page.do")
	public String readNoticeBoardPage(int jet_board_notice_no,Model model/*,HttpSession session*/) {
	
		HashMap<String, Object> map = noticeBoardService.getNoticeBoard(jet_board_notice_no);
		//글 출력
		
		int repleCount = noticeBoardService.getNoticeRepleCount(jet_board_notice_no);
		//리플 갯수 출력 하기 
		
		//int likeCount = noticeBoardService.getNoticeLikeCount(jet_board_notice_no);
		//좋아요 갯수 출력
/*		
  		에이작스 처리 RESTful 로 이동
		MemberVo memberLikeVo = (MemberVo) session.getAttribute("sessionUser");
		//서비스 티어로 데리고갈 세션 받기...
		
		NoticeLikeVo noticeLikeVo = null;
		//예외처리
		if(memberLikeVo != null) {
			noticeLikeVo = noticeBoardService.getNoticeLikeVo(jet_board_notice_no, memberLikeVo);
		}
*/	
		
		model.addAttribute("result", map);
		model.addAttribute("repleCount", repleCount);
		//model.addAttribute("likeCount", likeCount);
		
		//model.addAttribute("noticeLikeVo", noticeLikeVo);
		
		return "notice_board/read_notice_board_page";
	}

	
	@RequestMapping("delete_notice_board_process.do")
	public String deleteCsBoardProcess(int jet_board_notice_no) {
		
		noticeBoardService.deleteNoticeBoard(jet_board_notice_no);
		
		return "redirect:./notice_board_page.do";
	}
	
	@RequestMapping("update_notice_board_page.do")
	public String updateCsBoardPage(int jet_board_notice_no, Model model) {
		
		HashMap<String, Object> map = noticeBoardService.getNoticeBoard(jet_board_notice_no);
		//겟보드 그대로 출력 함 수정 전임으로..
		model.addAttribute("result", map);
		
		return "notice_board/update_notice_board_page";
	}

	@RequestMapping("update_notice_board_process.do")
	public String updateCsBoardProcess(NoticeBoardVo param) {
		
		noticeBoardService.updateNoticeBoard(param);
		
		return "redirect:./notice_board_page.do";
	}	
//---------------------------------------------------------------
/*	
	@RequestMapping("like_notice_process.do")
	public String likeNoticeProcess(int jet_board_notice_no,NoticeLikeVo param,HttpSession session) {
		System.out.println("[like_notice_process] 실행됨" );
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int member_no = sessionUser.getJet_member_no();
		
		int notice_no = jet_board_notice_no;
		
		System.out.println("notice_no : " +notice_no);
		System.out.println("member_no : " +member_no);
		
		param.setJet_board_notice_no(notice_no);
		param.setJet_member_no(member_no);
		
		noticeBoardService.noticeLikeInsert(param);
		
		return "redirect:./read_notice_board_page.do?jet_board_notice_no="+jet_board_notice_no+"";
	}
*/	
/*
	@RequestMapping("delete_like_notice_process.do")
	public String deleteLikeNoticeProcess(int jet_board_notice_no,HttpSession session) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int jet_member_no = sessionUser.getJet_member_no();
		
		noticeBoardService.deleteLikeNotice(jet_board_notice_no,jet_member_no);
		
		return "redirect:./read_notice_board_page.do?jet_board_notice_no="+jet_board_notice_no+"";
	}
*/	
	
	
}

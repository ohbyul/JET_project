package com.cjo.jet.freeboard.controller;

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

import com.cjo.jet.freeboard.mapper.FreeboardSQLMapper;
import com.cjo.jet.freeboard.service.FreeboardServiceImpl;
import com.cjo.jet.vo.FreeboardImageVo;
import com.cjo.jet.vo.FreeboardLikeVo;
import com.cjo.jet.vo.FreeboardRepleVo;
import com.cjo.jet.vo.FreeboardVo;
import com.cjo.jet.vo.MemberVo;

@Controller
@RequestMapping("/freeboard/*")
public class FreeboardController {
	@Autowired
	private FreeboardServiceImpl freeboardService;
	
	//메인
	@RequestMapping("main_free_board.do")
	public String mainPage(Model model, String search_word , String search_type, @RequestParam(value="page_num", defaultValue = "1") int page_num, Integer jet_board_free_category_no) {
	
		ArrayList<HashMap<String, Object>> resultList = freeboardService.getFreeboardList(search_word, search_type, page_num, jet_board_free_category_no);
		
		//Pagination
		int pageCount = freeboardService.getPageCount();
		
		int currentPage = page_num;
		int beginPage = ((currentPage-1)/5)*5 + 1;
		int endPage = ((currentPage-1)/5 + 1)*(5);
	 	//페이지 계산하기 "정수" 나누기임 1/5 = 0
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		model.addAttribute("currentPage" , currentPage);
		model.addAttribute("beginPage" , beginPage);
		model.addAttribute("endPage" , endPage);
		model.addAttribute("pageCount" , pageCount);

		model.addAttribute("resultList", resultList);
		
		return "/freeboard/main_free_board";
	}
	
	//글 쓰기
	@RequestMapping("write_free_board_page.do")
	public String writeFreeboardPage() {
		
		return "freeboard/write_free_board_page";
	}

	@RequestMapping("write_free_board_process.do")
	public String writeFreeboardProcess(HttpSession session, FreeboardVo param, MultipartFile [] files) {
		
			ArrayList<FreeboardImageVo> freeboardImageVo = new ArrayList<FreeboardImageVo>();	//파일 여러개 하기 위해선 배열로 받아야.
			//파일 업로드
			for(MultipartFile file : files) {
				if(file.getSize() <= 0) {		//이미지 입력이 없을 경우 밑에 코드를 스루하기 위한 예외처리
					continue;
				}
				
				//날짜별 폴더를 만들기 - .../년도/월/일/랜덤_시간.jpg 와 같은 형식으로 만들어야 충돌 방지 가능.
				String uploadRootFolderName = "/upload_files/";
				
				Date today = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
				String todayFolderName = sdf.format(today);
				String uploadFolderName = uploadRootFolderName + todayFolderName;		//C:/upload_files/2020/12/21 이렇게 나옴
				
				File uploadFolder = new File(uploadFolderName);		//File 은 파일+폴더, 의 속성을 컨트롤하는 API
				
				if(!uploadFolder.exists()) {		//만약 ~한 폴더가 존재하지 않으면
					uploadFolder.mkdirs();		// 폴더 = (프로그램에선) 디렉토리	//mkdirs는 하위폴더까지 만드는 API
				}
				
				String originalFileName = file.getOriginalFilename();		//클라이언트가 보낸 파일 이름..
				
				//저장시.. 파일명을 변경  - 목적 : 충돌(같은명의 파일 덮어씌우기)방지 & 방법: 서버에 저장할 때 이름을 "랜덤"하게 + "시간"을 조합해서 Hashing으로 저장 (+폴더구조까지 날짜별로도)
				String randomName = UUID.randomUUID().toString();
				long currentTime = System.currentTimeMillis();

				randomName = randomName + "_" + currentTime;
				
				//확장자 추가..(오리지널 파일 이름에서 뽑아와야됨)
				String ext = originalFileName.substring(originalFileName.lastIndexOf("."));		//19번째 글자부터 잘라내서 뽑아내겠다
				
				randomName += ext;
			
				try {
					file.transferTo(new File(uploadFolderName + "/" + randomName));		//transferTo는 바로 저장하겠다는 API, 서버쪽에 filewrite 하겠다
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				//ImageVo 객체 생성..
				FreeboardImageVo imageVo = new FreeboardImageVo();
				
				String link = "/upload/" + todayFolderName + "/" + randomName;
				imageVo.setJet_board_free_image_link(link);		//여기서 () 왜 link 들어가는지 모르겠음ㅠㅠ
				
				freeboardImageVo.add(imageVo);
				
			}
		
		//데이터 처리...
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int jet_member_no = sessionUser.getJet_member_no();
		
		param.setJet_member_no(jet_member_no);
		freeboardService.writeFreeboard(param, freeboardImageVo);
		
		return "redirect:./main_free_board.do";
	}
	
	//글 보기
	@RequestMapping("read_free_board_page.do")
	public String readFreeboardPage(HttpSession session, Model model, int jet_board_free_no ) {
		//Model 도 결국 Map 구조...
		
		HashMap<String, Object> map = freeboardService.getFreeboardContent(jet_board_free_no);	//Map을 만들고 게시글 가져오기, 여기 m_no는 게시글 쓴 사람이라 Like랑 상관X
		
		ArrayList<HashMap<String, Object>> repleResult = null;//Map 만들고 리플 가져오기
		
		// LikeVo에 있는지 없는지 확인하는 예외처리 코드 필요. m_no 랑 b_no 같은 줄 있으면 쓰루해야함.
		// 여기서 service 의 checkLike 활용
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");	//세션객체에서 접속한 사람 가져오기.
		int jet_member_no = sessionUser.getJet_member_no();	//ㄴ의 멤버 넘버, 
		
		//ArrayList<HashMap<String, Object>> freeboardLikeVo = freeboardService.checkLike(jet_board_free_no, jet_member_no);
		FreeboardLikeVo freeboardLikeVo = null;
		
		//좋아요 갯수
		//int likeCount = freeboardService.getLikeCount(jet_board_free_no);
		
		model.addAttribute("result", map);	//글 내용이랑 글 작성자 freeboardImageVo 담겨져있음.
		//model.addAttribute("repleResult", repleResult);
		model.addAttribute("freeboardLikeVo", freeboardLikeVo);
		//model.addAttribute("likeCount", likeCount);
		
		return "freeboard/read_free_board_page";
	}
	
	//글 삭제
	@RequestMapping("delete_free_board_process.do")
	public String deleteFreeboardProcess(int jet_board_free_no) {
		
		freeboardService.deleteFreeboard(jet_board_free_no);
		
		return "redirect:./main_free_board.do";
	}
	
	//글 수정 
	@RequestMapping("update_free_board_page.do")
	public String updateFreeboardPage(Model model, int jet_board_free_no) {
		
		HashMap<String, Object> map = freeboardService.getFreeboardContent(jet_board_free_no);
		
		model.addAttribute("result", map);
		
		return "freeboard/update_free_board_page";
	}
	
	//글 수정 프로세스
	@RequestMapping("update_free_board_process.do")
	public String updateFreeboardProcess(FreeboardVo param, int jet_board_free_no) {
		
		freeboardService.updateFreeboard(param);
		
		return "redirect:./read_free_board_page.do?jet_board_free_no="+jet_board_free_no;
	}
	
	/*
	// 좋아요 기능들
	@RequestMapping("freeboard_like_process.do")
	public String freeboardLikeProcess(HttpSession session, int jet_board_free_no, FreeboardLikeVo param) {
		//좋아요가 없는 태이므로 여기서 insert를 실행. // board_no 랑 session_member_no 넣기.
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int jet_member_no = sessionUser.getJet_member_no();
		
		param.setJet_member_no(jet_member_no);	//LikeVo에 현재 m_no 넣어주고.
		param.setJet_board_free_no(jet_board_free_no);	//LikeVo에 현재 b_no 넣기
		
		freeboardService.likeFreeboard(param);
		
		return "redirect:./read_free_board_page.do?jet_board_free_no=" +jet_board_free_no;
	}
	
	@RequestMapping("freeboard_dislike_process.do")
	public String freeboardDislikeProcess(HttpSession session, int jet_board_free_no, FreeboardLikeVo param) {
		//좋아요가 있는 상태이므로 여기서 delete를 실행.

		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int jet_member_no = sessionUser.getJet_member_no();
		
		param.setJet_member_no(jet_member_no);	//LikeVo에 현재 m_no 넣어주고.
		param.setJet_board_free_no(jet_board_free_no);	//LikeVo에 현재 b_no 넣기
		
		freeboardService.dislikeFreeboard(param);
		
		return "redirect:./read_free_board_page.do?jet_board_free_no=" +jet_board_free_no;
	}
	*/
	
}

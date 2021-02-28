package com.cjo.jet.knowhow.controller;

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

import com.cjo.jet.knowhow.mapper.KnowhowBoardRepleSQLMapper;
import com.cjo.jet.knowhow.service.KnowhowBoardServiceImpl;
import com.cjo.jet.vo.KnowhowBoardImageVo;
import com.cjo.jet.vo.KnowhowBoardLikeVo;
import com.cjo.jet.vo.KnowhowBoardRepleVo;
import com.cjo.jet.vo.KnowhowBoardVo;
import com.cjo.jet.vo.MemberVo;

@Controller
@RequestMapping("/knowhowboard/*")
public class KnowhowController {
	
	@Autowired
	private KnowhowBoardServiceImpl knowhowBoardService;
	
	// 팁과 노하우 게시판으로
	@RequestMapping("knowhowboard_page.do")
	public String knowhowBoardList(Model model, String search_word, String search_type, @RequestParam(value="page_num",defaultValue = "1") int page_num, Integer category_no) {
		
		// 글 목록 출력
		ArrayList<HashMap<String, Object>> resultList = knowhowBoardService.getKnowhowBoardList(search_word, search_type, page_num, category_no);
		
		// 페이지 출력
		int pageCount = knowhowBoardService.countPageKnowhowBoard();
	 	
		// 페이지 수 받기
	 	int currentPage = page_num;
	 	int beginPage = ((currentPage-1)/5) * 5 + 1;
	 	int endPage = ((currentPage-1)/5 + 1) * (5);
	 	// 페이지 계산: int. 정수 나누기 정수. 나머지 버리니까 1/5 = 0 이 된다.
	 	
	 	if(endPage > pageCount) {
	 		endPage = pageCount;
	 	}
		
		// 글 목록
		model.addAttribute("resultList", resultList);
		
		// 페이지
		model.addAttribute("currentPage", currentPage);
	 	model.addAttribute("beginPage", beginPage);
	 	model.addAttribute("endPage", endPage);
	 	model.addAttribute("pageCount", pageCount);
		
		return "knowhowboard/knowhowboard_page";
	}
	
	// 글 작성 페이지로
	@RequestMapping("write_knowhowboard_page.do")
	public String knowhowBoardWrite() {
		
		return "knowhowboard/write_knowhowboard_page";
	}
	
	// 글 작성 프로세스로
	@RequestMapping("write_knowhowboard_process.do")
	public String knowhowBoardWriteProcess(HttpSession session, KnowhowBoardVo param, MultipartFile [] files) {    // 이미지 업로드 1.
	// 파일 업로드 - pom.xml, servlet-context.xml에 있는 외부 라이브러리 설정이 있는지 먼저 확인, 멤버변수에 miltipartfile 인터페이스를 받는 변수 추가, 여러 값이 날아올 수 있기 때문에 배열로 받음
		
		// 이미지 8. 이미지 추가 위해서 변수 생성
		ArrayList<KnowhowBoardImageVo> imageVoList = new ArrayList<KnowhowBoardImageVo>();

		// 이미지 업로드 1.	
		for (MultipartFile file : files) {
			// 이미지 3. 
			// 예외 처리. 파일 없을 때 글쓰기가 nullpointerexception을 발생시키지 않도록 함
			// if (파일 업로드 안 함) -> continue; (아래 코드 실행 안 함)
			// 3번까지가 파일 업로드에 해당하는 핵심 api
			if (file.getSize() <= 0) {
				continue;    //예외처리.. 파일이 0보다 작다 = 파일업로드를 안했다. 그럼 밑에꺼를 수행하지않겠다.
			}

			// 이미지 7. 날짜별 폴더를 만들기 (자동으로)
 			// /년도/월/일/랜덤_시간.확장자명
			String uploadRootFolderName = "/upload_files/";/*/Users/hwlim*/   
			// String uploadRootFolderName = "C:/upload_files/";//"\\"고전적으로는 역슬래시 2개, windows는 "/"도 가능

 			Date today = new Date();
 			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");    // 시간 포맷 변경
 			String todayFolder = sdf.format(today);

 			String uploadFolderName = uploadRootFolderName + todayFolder;    // 최종 폴더의 문자열. 여기에 파일 이름을 더한다.

 			File uploadFolder = new File(uploadFolderName);    // 폴더 포함 파일을 컨트롤하는 API
 			// 파일이라는 이름의 클래스 - 역할: 파일 혹은 폴더 속성을 컨트롤

 			if (!uploadFolder.exists()) {    // 이러한 폴더가 존재하지 않으면
 				uploadFolder.mkdirs();    // 폴더를 만들겠다 / mkdirs '/'가 있으면 하위 폴더를 싹 만들어줌/ dir...dirs는 복수 폴더를 싹다 만든다.
 			}
			
			// 이미지 2. 원래 파일 이름 가져오기
			String originalFileName = file.getOriginalFilename();    // 클라이언트가 보낸 파일 이름

			// 이미지 4. 저장시 파일명 변경
			// 목적: 같은 이름 충돌 방지(덮어 씌우기 방지)
			// 방법: 랜덤 + 시간 <- 진짜 보안이 중요한 경우 확장자 명을 넣지 않음
			String randomName = UUID.randomUUID().toString();
			long currentTime = System.currentTimeMillis();
			
			randomName  = randomName+"_"+currentTime;
			
			// 이미지 5. 확장자 추가 (오리지널 파일 네임에서 뽑아오기)
			// 확장자만을 찾기 위해 뒤에서 .이 나오는 부분을 찾아서 잘라내고 리턴해줌
			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
			
			randomName += ext;
			
			
			try {
				// 이미지 1. destination 경로 설정. 이것만 하면 모든 파일이 aaa.jpg로 덮어씌워지면서 저장됨
				// file.transferTo(new File("/Users/hwlim/upload_files/" + originalFileName)); 
				
				// 이미지 6. 내 서버에 저장 하겠다. //c:upload_files/2020/12/23 "/" randomname.jpg
				file.transferTo(new File(uploadFolderName + "/" + randomName)); 
			}  catch(Exception e) {
				e.printStackTrace();
			}

		
			// 이미지 9. imageVo객체 생성. 링크 생성해서 imageVo에 set하고 imageVoList에 추가하기
			KnowhowBoardImageVo imageVo = new KnowhowBoardImageVo();
			//링크 이름 변수 작성
			String link = "/upload/" + todayFolder + "/" + randomName;
			imageVo.setJet_board_knowhow_image_link(link);
			
			imageVoList.add(imageVo);
			//writeContent할 때 imageVoList 넘겨줌
		}
		
		// 데이터 처리
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
		int jet_member_no = sessionUser.getJet_member_no();
		
		param.setJet_member_no(jet_member_no);
		
		// 이미지 10. 변수 imageVoList 추가
		knowhowBoardService.writeKnowhowBoard(param, imageVoList);
		
		return "redirect:./knowhowboard_page.do";
	}
	
	// 글 읽기 페이지로
	@RequestMapping("read_knowhowboard_page.do")
	public String readKnowhowBoardPage(Model model, int jet_board_knowhow_no, KnowhowBoardLikeVo likeVo, HttpSession session) {
		
		HashMap<String, Object> map = knowhowBoardService.getKnowhowBoard(jet_board_knowhow_no);
		
		// 댓글 보기
		ArrayList<HashMap<String, Object>> repleVoList = knowhowBoardService.getRepleByNo(jet_board_knowhow_no);
		
		// 댓글 개수 출력
		int repleCount = knowhowBoardService.countRepleKnowhowBoard(jet_board_knowhow_no);
		
		// 좋아요 개수
		int countLike = knowhowBoardService.countLikeKnowhowBoard(jet_board_knowhow_no);
		
		// 로그인 시 좋아요 클릭 여부 확인		
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
	
		if (sessionUser != null) {
			int jet_member_no = sessionUser.getJet_member_no();
			likeVo.setJet_member_no(jet_member_no);
		}
		
		int isLiked = knowhowBoardService.isLikedKnowhowBoard(likeVo);
		
		model.addAttribute("result", map);
		model.addAttribute("reple", repleVoList);
		model.addAttribute("repleCount", repleCount);
		
		model.addAttribute("countLike", countLike);
		model.addAttribute("isLiked", isLiked);
		
		return "knowhowboard/read_knowhowboard_page";
	}
	
	// 글 삭제 프로세스로
	@RequestMapping("delete_knowhowboard_process.do")
	public String deleteKnowhowBoardProcess(int jet_board_knowhow_no) {
		
		knowhowBoardService.deleteKnowhowBoard(jet_board_knowhow_no);
		
		return "redirect:./knowhowboard_page.do";
	}
	
	// 글 수정 페이지로
	@RequestMapping("update_knowhowboard_page.do")
	public String updateKnowhowBoardPage(int jet_board_knowhow_no, Model model) {
		
		HashMap<String, Object> map = knowhowBoardService.getKnowhowBoard(jet_board_knowhow_no);
		
		model.addAttribute("result", map);
		
		return "knowhowboard/update_knowhowboard_page";
	}
	
	// 글 수정 프로세스로
	@RequestMapping("update_knowhowboard_process.do")
	public String updateKnowhowBoardProcess(KnowhowBoardVo param) {
		
		knowhowBoardService.updateKnowhowBoard(param);
		
		return "redirect:./knowhowboard_page.do";
	}

	// 댓글 작성 프로세스로
	@RequestMapping("write_reple_knowhowboard_process.do")
	public String writeRepleKnowhowBoardProcess(HttpSession session, KnowhowBoardRepleVo param, int jet_board_knowhow_no) {
				
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser"); 
		int jet_member_no = sessionUser.getJet_member_no();
		param.setJet_member_no(jet_member_no);
		
		knowhowBoardService.writeRepleKnowhowBoard(param);
			
		return "redirect:./read_knowhowboard_page.do?jet_board_knowhow_no="+jet_board_knowhow_no+"";
	}
	
	// 좋아요 삽입 프로세스로
	@RequestMapping("insert_like_knowhowboard_process.do")
	public String insertLikeKnowhowBoardProcess(HttpSession session, KnowhowBoardLikeVo likeVo, int jet_board_knowhow_no) {
		
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		int jet_member_no = sessionUser.getJet_member_no();
		likeVo.setJet_member_no(jet_member_no);
		
		knowhowBoardService.insertLikeKnowhowBoard(likeVo);
		
		return "redirect:./read_knowhowboard_page.do?jet_board_knowhow_no="+jet_board_knowhow_no+"";
	}
	
	// 좋아요 삭제 프로세스로
	@RequestMapping("delete_like_knowhowboard_process.do")
	public String deleteLikeKnowhowBoardProcess(HttpSession session, KnowhowBoardLikeVo likeVo, int jet_board_knowhow_no) {
		
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		int jet_member_no = sessionUser.getJet_member_no();
		likeVo.setJet_member_no(jet_member_no);
		
		knowhowBoardService.deleteLikeKnowhowBoard(likeVo);
		return "redirect:./read_knowhowboard_page.do?jet_board_knowhow_no="+jet_board_knowhow_no+"";
	}
	
	// 댓글 삭제 프로세스로
	@RequestMapping("delete_reple_knowhowboard_process.do")
	public String deleteRepleknowhowBoardProcess(int jet_board_knowhow_reple_no, int jet_board_knowhow_no) {

		knowhowBoardService.deleteRepleKnowhowBoard(jet_board_knowhow_reple_no);		
	
		return "redirect:./read_knowhowboard_page.do?jet_board_knowhow_no="+jet_board_knowhow_no+"";
	}
}
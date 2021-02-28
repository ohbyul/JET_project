package com.cjo.jet.csboard.controller;

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
import org.w3c.dom.CDATASection;

import com.cjo.jet.csboard.service.CsBoardServiceImpl;
import com.cjo.jet.vo.AdminAssignVo;
import com.cjo.jet.vo.CsBoardAnswerVo;
import com.cjo.jet.vo.CsBoardImageVo;
import com.cjo.jet.vo.CsBoardVo;
import com.cjo.jet.vo.MemberVo;


@Controller
@RequestMapping("/csboard/*")
public class CsBoardController {
	
	@Autowired
	private CsBoardServiceImpl csBoardService;
	
	@RequestMapping("csboard_page.do")
	public String csBoardPage(Model model,String search_word,String search_type,@RequestParam(value="page_num",defaultValue = "1") int page_num) {
		
		//cs 보드 글 리스트 출력 
		ArrayList<HashMap<String, Object>> resultList = csBoardService.getCsBoardList(search_word,search_type,page_num);
		
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
	 	
	 	
		return "csboard/csboard_page";
	}

	@RequestMapping("write_csboard_page.do")
	public String writeCsBoardPage() {
		
		return "csboard/write_csboard_page";
	}
	
	@RequestMapping("write_csboard_process.do")
	public String writeCsBoardProcess(CsBoardVo param, HttpSession session,MultipartFile [] files) {
	
		//변수 생성 해야함.. 이미지때문에
		ArrayList<CsBoardImageVo> imageVoList = new ArrayList<CsBoardImageVo>();
		
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
			CsBoardImageVo imageVo = new CsBoardImageVo();
			
			String link = "/upload/" + todayFolder + "/" + randomName; 
			
			imageVo.setJet_board_cs_image_link(link);
			
			imageVoList.add(imageVo);
			//writeContent할때  imageVoList 넘겨줌
			
		}	//포문 닫기 이미지 끝
		
		
		//데이터 처리
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
	
		int jet_member_no = sessionUser.getJet_member_no();
		
		param.setJet_member_no(jet_member_no);
		
		csBoardService.writeCsBoard(param,imageVoList);
		
		return "redirect:./csboard_page.do";
	}

	@RequestMapping("read_csboard_page.do")
	public String readCsBoardPage(int jet_board_m_cs_no,Model model) {
		
		HashMap<String, Object> map = csBoardService.getCsBoard(jet_board_m_cs_no);
		
		//여긴 리플 없다.
		
		model.addAttribute("result", map);
		
		return "csboard/read_csboard_page";
	}

	@RequestMapping("delete_csboard_process.do")
	public String deleteCsBoardProcess(int jet_board_m_cs_no) {
		
		csBoardService.deleteCsBoard(jet_board_m_cs_no);
		return "redirect:./csboard_page.do";
	}
	
	@RequestMapping("update_csboard_page.do")
	public String updateCsBoardPage(int jet_board_m_cs_no, Model model) {
		
		HashMap<String, Object> map = csBoardService.getCsBoard(jet_board_m_cs_no);
		//겟보드 그대로 출력 함 수정 전임으로..
		model.addAttribute("result", map);
		
		return "csboard/update_csboard_page";
	}

	@RequestMapping("update_csboard_process.do")
	public String updateCsBoardProcess(CsBoardVo param) {
		
		csBoardService.updateCsBoard(param);
		return "redirect:./csboard_page.do";
	}
	
	
	//-----------------------------관리자-----------------------------------------------------------------
	
	@RequestMapping("answer_write_csboard_page.do")
	public String answerCsBoardWritePage(int jet_board_m_cs_no,Model model) {
		System.out.println("jet_board_m_cs_no : " +jet_board_m_cs_no);
		
		//업데이트 코드 그대로
		HashMap<String, Object> map = csBoardService.getCsBoard(jet_board_m_cs_no);
		//겟보드 그대로 출력 함 수정 전임으로..
		model.addAttribute("result", map);
		
		
		return "csboard/answer_write_csboard_page";
	}
	
	@RequestMapping("answer_write_csboard_process.do")
	public String answerCsBoardWriteProcess(int jet_board_m_cs_no,CsBoardAnswerVo param,HttpSession session) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int member_no = sessionUser.getJet_member_no();
		
		int originalNo = jet_board_m_cs_no;
		System.out.println("originalNo :" +originalNo);
		
		param.setJet_board_m_cs_no(originalNo);
	
		param.setJet_member_no(member_no);
		
		csBoardService.writeAnswerCsBoard(param);
		
		return "redirect:./csboard_page.do";

	}

	@RequestMapping("answer_read_csboard_page.do")
	public String answerCsBoardReadPage(int jet_board_a_cs_no, Model model) {
		
		HashMap<String, Object> map = csBoardService.getAnswerCsBoard(jet_board_a_cs_no);
		
		model.addAttribute("result", map);
		
		return"csboard/answer_read_csboard_page";
	}
	
	@RequestMapping("answer_csboard_delete_process.do")
	public String deleteCsBoardAnswerProcess(int jet_board_a_cs_no) {
		csBoardService.deleteCsBoardAnswer(jet_board_a_cs_no);
		return "redirect:./csboard_page.do";
	}

	
	
	
	
	
	
}

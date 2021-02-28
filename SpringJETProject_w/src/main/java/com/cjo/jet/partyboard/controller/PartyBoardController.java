package com.cjo.jet.partyboard.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.cjo.jet.partyboard.service.PartyBoardServiceImpl;
import com.cjo.jet.travelplan.service.TravelPlanServiceImpl;
import com.cjo.jet.vo.MemberVo;
import com.cjo.jet.vo.PartyBoardImageVo;
import com.cjo.jet.vo.PartyBoardVo;

@Controller
@RequestMapping("/party_board/*")
public class PartyBoardController {

	@Autowired
	private PartyBoardServiceImpl partyBoardService;
	
	@Autowired
	private TravelPlanServiceImpl travelPlanService;
	
	@RequestMapping("party_board_page.do")
	public String partyBoardPage(Model model) {
		
		//여행친구찾기 글리스트 출력
		ArrayList<HashMap<String, Object>> resultList = partyBoardService.getPartyBoardList();
		
		model.addAttribute("resultList", resultList);
		//아직 페이지 처리 전임으로 게시물 리스트만 모델로 보냄..
		
		Date today = new Date();
		int day =today.getDate();
		day-=1;
		today.setDate(day);
		System.out.println("파티 컨트롤러 의문점 어제날짜인데..?? 나는 내일로 비교하고싶은뎅 today :" +today);
		
		model.addAttribute("todayData", today);
		
		return "party_board/party_board_page";
		
	}
	
	@RequestMapping("write_party_board_page.do")
	public String writePartyContentPage(HttpSession session,Model model) {
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		//여행플랜 리스트 뽑아오기 에이작스 처리전 test
		ArrayList<HashMap<String, Object>> planList = travelPlanService.getContentListByB();

		 
		model.addAttribute("planList", planList);
		model.addAttribute("sessionUserVo", sessionUser);
		
		return "party_board/write_party_board_page";
	}
	
	/////// 공유 비스무리하게 해서 쓸 때
	@RequestMapping("write_party_planshared_page.do")
	public String writePartyContentPageBySharedPlan(HttpSession session,Model model, int jet_board_travelplan_no) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		//여행플랜 리스트 뽑아오기 에이작스 처리전 test
		System.out.println("[write party travelNo]"+jet_board_travelplan_no);
		
		HashMap<String, Object> map = travelPlanService.getPlanContent(jet_board_travelplan_no);
		System.out.println("[write planMap]"+map);
		
		ArrayList<HashMap<String, Object>> detailList = travelPlanService.getDetailList(jet_board_travelplan_no);
		System.out.println("[write planList]"+detailList);
		
		model.addAttribute("map",map);
		model.addAttribute("detailList", detailList);
		model.addAttribute("sessionUserVo", sessionUser);
		
		return "party_board/write_party_planshared_page";
	}
	
	@RequestMapping("write_party_board_process.do")
	public String writePartyContentProcess(PartyBoardVo param,HttpSession session, MultipartFile [] files/*,Integer jet_board_travelplan_no*/) {
		
		//System.out.println("[test party write plan no]"+jet_board_travelplan_no);
		
		ArrayList<PartyBoardImageVo> imageVoList = new ArrayList<PartyBoardImageVo>();
		
		for(MultipartFile file : files) {
			
			if(file.getSize() <=0) {
				continue;
			}
			String uploadRootFolderName = "/upload_files/";
			
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			String todayFolder = sdf.format(today);
			
			String uploadFolderName = uploadRootFolderName + todayFolder;
			
			File uploadFolder = new File(uploadFolderName);

			if(!uploadFolder.exists()) {
				uploadFolder.mkdirs();
			}
			
			String originalFileName = file.getOriginalFilename();
	
			String randomName = UUID.randomUUID().toString();

			long currentTime = System.currentTimeMillis();
			
			randomName = randomName + "_" + currentTime;

			String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
			
			randomName += ext;
			
			try {
				file.transferTo(new File(uploadFolderName + "/" + randomName));

			} catch (Exception e) {
				e.printStackTrace();
			}
			
			//imageVo 객체 생성..
			PartyBoardImageVo imageVo = new PartyBoardImageVo();
			
			String link = "/upload/" + todayFolder + "/" + randomName; 
			
			imageVo.setJet_board_party_image_link(link);

			imageVoList.add(imageVo);
		}
		
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
		int jet_member_no = sessionUser.getJet_member_no();
		
		param.setJet_member_no(jet_member_no);
		
		//travelplanNo값이 없을 경우 처리 오별 수정 자리바꿈
		//if(jet_board_travelplan_no != null) {
			//partyBoardService.writePartyBoardByW(param, jet_board_travelplan_no);

		//}else {
			partyBoardService.writePartyBoard(param,imageVoList);

		//}
		
		
		return "redirect:./party_board_page.do";
	}
	
	@RequestMapping("read_party_board_page.do")
	public String readPartyBoard(int jet_board_party_no,Model model,HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		
		HashMap<String, Object> map = partyBoardService.getPartyBoard(jet_board_party_no);
		
		int attendCount =partyBoardService.getPartyAttendCount(jet_board_party_no);
		//참여 댓글 갯수 출력
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		//리플 세션 받기
		
		//참여 댓글 한번만 작성하게..
		//ArrayList<HashMap<String, Object>> checkAttend = partyBoardService.getPartyBoardAttendList(jet_board_party_no);
		//sharePlanService.increaseReadCount(jet_board_shareplan_no, request, response);
		partyBoardService.increaseReadCount(jet_board_party_no, request, response);
		
		model.addAttribute("result",map);
		model.addAttribute("SessionMemberVo", sessionUser);
		model.addAttribute("attendCount", attendCount);
		
		return "party_board/read_party_board_page";
	}
	
	@RequestMapping("delete_party_board_process.do")
	public String deletePartyBoardProcess(int jet_board_party_no) {
		partyBoardService.deletePartyBoard(jet_board_party_no);
		
		return "redirect:./party_board_page.do";
	}
	
	@RequestMapping("update_party_board_page.do")
	public String updatePartyBoardPage(int jet_board_party_no,Model model,HttpSession session) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
		ArrayList<HashMap<String, Object>> planList = travelPlanService.getContentListByB();
		
		model.addAttribute("planList", planList);
		model.addAttribute("sessionUserVo", sessionUser);
		//여행리스트 모달창
		
		HashMap<String, Object> map = partyBoardService.getPartyBoard(jet_board_party_no);
		model.addAttribute("result",map);
		//업데이트될 데이터
		
		return "party_board/update_party_board_page";
	}

	@RequestMapping("update_party_board_process.do")
	public String updatePartyBoardProcess(PartyBoardVo param , Date start_day) {
		
		partyBoardService.updatePartyBoard(param);
		
		return "redirect:./party_board_page.do";
	}

//ㅡㅡ명제씨 test코드ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	   @RequestMapping("chat.do")
	   public String chat(int jet_board_party_no, Model model,HttpSession session) {
	      
	      HashMap<String, Object> map = partyBoardService.getPartyBoard(jet_board_party_no);
	      
	      //참여 댓글 갯수 출력
	      
	      MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");

	      
	      
	      model.addAttribute("result",map);
	      model.addAttribute("SessionMemberVo", sessionUser);
	      

	      return "party_board/chat";
	   }
	
}

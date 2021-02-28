package com.cjo.jet.mypage.controller;

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
import org.springframework.web.multipart.MultipartFile;

import com.cjo.jet.member.service.MemberServiceImpl;
import com.cjo.jet.mypage.service.MyPageServiceImpl;
import com.cjo.jet.partyboard.service.PartyBoardServiceImpl;
import com.cjo.jet.vo.MemberImageVo;
import com.cjo.jet.vo.MemberVo;
@Controller
@RequestMapping("/mypage/*")
public class MyPageController {

	@Autowired
	private MyPageServiceImpl myPageService;
	@Autowired
	private MemberServiceImpl memberService;
	@Autowired
	private PartyBoardServiceImpl partyBoardService;
	
	@RequestMapping("update_mypage.do")
	public String updateMypage(Model model, HttpSession session) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int jet_member_no = sessionUser.getJet_member_no();
		
		HashMap<String, Object> resultMap = memberService.getMemberInfo(jet_member_no);
		//닉네임 출력  코드
		HashMap<String, Object> memberProfileResult = myPageService.getMyProfile(jet_member_no);
		//프로필 사진 출력 
		
		model.addAttribute("resultImage", memberProfileResult);
		model.addAttribute("result", resultMap);
		
		return "mypage/update_mypage";
	}
	
	@RequestMapping("update_member_nick_process.do")
	public String updateMemberNickProcess(MemberVo param, HttpSession session,MultipartFile [] files) {
		ArrayList<MemberImageVo> imageVoList = new ArrayList<MemberImageVo>();
		
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
			MemberImageVo imageVo = new MemberImageVo();
			
			String link = "/upload/" + todayFolder + "/" + randomName; 
			
			imageVo.setJet_member_image_link(link);
			
			imageVoList.add(imageVo);
		}	//포문 닫기 이미지 끝	
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
		int jet_member_no = sessionUser.getJet_member_no();
		param.setJet_member_no(jet_member_no);
		
		memberService.updateOnlyNick(param);
		memberService.insertProfileImage(jet_member_no, imageVoList);
		
		return "redirect:./mypage.do";
	}
	
	@RequestMapping("mypage.do")
	public String mypage(Model model,HttpSession session) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int jet_member_no = sessionUser.getJet_member_no();
		
		HashMap<String, Object> memberProfileResult = myPageService.getMyProfile(jet_member_no);
		
		
		
		
		
		int writeCT = myPageService.myWriteBoardCT(jet_member_no);
		int repleCT = myPageService.myWriteRepleCT(jet_member_no);
		
		model.addAttribute("result", memberProfileResult);
		model.addAttribute("writeCT", writeCT);
		model.addAttribute("repleCT", repleCT);
		
		return "mypage/mypage";
	}
	
	@RequestMapping("write_mypage.do")
	public String writeMypage(HttpSession session, Model model) {

		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
		int member_no = sessionUser.getJet_member_no();
		
		
		
		System.out.println("멤버넘버:"+member_no);
		
		ArrayList<HashMap<String, Object>> resultList = myPageService.get_Review_Board(member_no);
		ArrayList<HashMap<String, Object>> freeList = myPageService.get_Free_Board(member_no);
		
		model.addAttribute("resultList",resultList);
		model.addAttribute("freeList",freeList);
		
		return "mypage/write_mypage";
	}
	
	@RequestMapping("security_mypage.do")
	public String securityMypage(Model model, HttpSession session) {
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int jet_member_no = sessionUser.getJet_member_no();
		
		HashMap<String, Object> resultMap = memberService.getMemberInfo(jet_member_no);
		
		model.addAttribute("result", resultMap);
		return "mypage/security_mypage";
	}
	
	
//----------내가 쓴 댓글--------------------------------------------------------------------
	
	@RequestMapping("wrote_reple_mypage.do")
	public String wroteReplePage(HttpSession session) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		//로그인한 유저의 멤버 Vo
		int member_no = sessionUser.getJet_member_no();
		
		System.out.println("내가 쓴 댓글 보기 sessionUserVo 존재 여부 : " +sessionUser);

		return"mypage/wrote_reple_mypage";
	}
	
	@RequestMapping("like_mypage.do")
	public String likeMypage() {
		
		return "mypage/like_mypage";
	}
	
	@RequestMapping("pick_mypage.do")
	public String pickMypage() {
		
		return "mypage/pick_mypage";
	}
	
	@RequestMapping("recruitment_mypage.do")
	public String recruitmentMypage() {
		
		return "mypage/recruitment_mypage";
	}
	@RequestMapping("attend_mypage.do")
	public String attendMypage() {
		
		return "mypage/attend_mypage";
	}
	
	@RequestMapping("classlist_mypage.do")
	public String classlistMypage(Model model, HttpSession session) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int jet_member_no = sessionUser.getJet_member_no();		
		
		ArrayList<HashMap<String, Object>> resultList = myPageService.myDetailClassList(jet_member_no);
		
		model.addAttribute("resultList", resultList);
		
		return "mypage/classlist_mypage";
	}
	
	@RequestMapping("participating_class_mypage.do")
	public String reservelistMypage(Model model, HttpSession session) {
		
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int jet_member_no = sessionUser.getJet_member_no();		
		
		ArrayList<HashMap<String, Object>> resultList = myPageService.myReservationList(jet_member_no);
		
		model.addAttribute("resultList", resultList);
		
		return "mypage/participating_class_mypage";
	}	
	@RequestMapping("after_rating_page.do")
	public String afterRatingPage(Model model,HttpSession session) {
		//0219 오별 변경
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		int jet_member_no =sessionUser.getJet_member_no();
		
		ArrayList<HashMap<String, Object>> result = partyBoardService.getMyOpenedChatList(jet_member_no);
		//내가 개설한
		
		ArrayList<HashMap<String, Object>> attendResult = partyBoardService.getPartyChatList(jet_member_no);
		//내가 참여한
		
		model.addAttribute("result", result);
		model.addAttribute("attendResult", attendResult);
		
		return "mypage/after_rating_page";
	}
}

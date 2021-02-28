package com.cjo.jet.classboard.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
import com.cjo.jet.vo.ClassDetailVo;
import com.cjo.jet.vo.ClassImageVo;
import com.cjo.jet.vo.ClassReservationVo;
import com.cjo.jet.vo.ClassboardVo;
import com.cjo.jet.vo.MemberVo;

@Controller
@RequestMapping("/classboard/*")
public class ClassboardController {
	
	@Autowired
	private ClassboardServiceImpl classboardService;
	
	// 원데이클래스 게시판 메인으로
	@RequestMapping("main_classboard_page.do")
	public String mainClassboardPage(Model model, HttpSession session, @RequestParam(value="page_num", defaultValue = "1")int page_num) {
		
		MemberVo memberVo = (MemberVo)session.getAttribute("sessionUser");
		// 글 목록 출력
		ArrayList<HashMap<String, Object>> resultList = classboardService.getClassList(page_num);
		
		//Pagination
		int pageCount = classboardService.getPageCount();
		
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
		model.addAttribute("memberVo", memberVo);
		
	
//		네비바 나의예약 ㅠㅠ  ^^^^^^^^^^^cnrk추가   durl 여기 이상함.
//		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
//		if (sessionUser != null) {
//			int jet_member_no = sessionUser.getJet_member_no();
//			
//			model.addAttribute("jet_member_no", jet_member_no);
//		}
	
		return "classboard/main_classboard_page";
	}
	
	// 클래스 개설 페이지로
	@RequestMapping("open_class_page.do")
	public String openClassPage() {
		
		return "classboard/open_class_page";
	}
	
	@RequestMapping("open_class_process.do")
	public String openClassProcess(HttpSession session, ClassboardVo vo, ClassDetailVo detail, MultipartFile [] files, Date start_date, Date end_date) {
		
		ArrayList<ClassImageVo> classImageVo = new ArrayList<ClassImageVo>();
		
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
			ClassImageVo imageVo  = new ClassImageVo();
			
			String link = "/upload/" + todayFolderName + "/" + randomName;
			imageVo.setJet_class_image_link(link);
			
			classImageVo.add(imageVo);
			
		}		
		
		//누가 개설을 했는지 m_no 뽑아오려는 session 필요, service에서 클래스 정보 담아온 vo 필요, 이미지 삽입 시 사용할 files 필요.
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		
		int jet_member_no = sessionUser.getJet_member_no();
		vo.setJet_member_no(jet_member_no);
		
		classboardService.openClass(vo, classImageVo);	

		/**
		 * 시작 일과 종료일이 넘어 왔을때 하루 기준으로 반복을 하면서 날짜를 가져오는 소스
		 * 1일씩 더하는 것은 java.util.Calendar API에서 제공하는 걸로 활용함
		 * 대부분 그대로 사용하고 TODO 부분 기준으로 소스 코드 사용하면 될듯  
		 **/
		
		System.out.println("========== [test] ==========");
		System.out.println("시작 선택일 : " + start_date);
		System.out.println("종료 선택일 : " + end_date);
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(start_date);
		
		detail.setJet_class_no(vo.getJet_class_no()); //DetailVo에 클래스(보드)넘버 세팅
		
		while(!cal.getTime().after(end_date)) {
				
			Date currentDate = cal.getTime();
			
			System.out.println("반복 일 : " + currentDate);
			
			//TODO : 나머지는 거의 대부분 그대로 놔두고 여기서 currentDate 변수 활용 할 것...!!
			//Detail테이블에 class_no랑 날짜 insert하기..
			detail.setJet_class_detail_date(currentDate);
			
			classboardService.detailClass(detail);
			
			cal.add(Calendar.DATE, 1);
			
		}
		
		return "redirect:./main_classboard_page.do";
	}
	
	// 상세 페이지로
	@RequestMapping("detail_class_page.do")
	public String detailClassPage(Model model, int jet_class_detail_no, ClassReservationVo reserveVo, HttpSession session) {
		
		HashMap<String, Object> map = classboardService.getClassDetail(jet_class_detail_no);
		ArrayList<HashMap<String, Object>> map2 = classboardService.getReviewDetail(jet_class_detail_no);
		
		// 로그인 시 예약 여부 확인
		MemberVo sessionUser = (MemberVo)session.getAttribute("sessionUser");
		
//		if (sessionUser != null) {
//			int jet_member_no = sessionUser.getJet_member_no();
//			reserveVo.setJet_member_no(jet_member_no);
//		}
		int countReserve = classboardService.countReserve(jet_class_detail_no);

		model.addAttribute("result", map);
		model.addAttribute("reviewVo",map2);
		model.addAttribute("countReserve", countReserve);
		
		return "classboard/detail_class_page";
	}
	

	// 메인 내 나의 예약 페이지로
	@RequestMapping("my_reservation_page.do")
	public String myReservation(ClassReservationVo reserveVo, HttpSession session, Model model) {
		System.out.println("my_reservation.do");
		
		MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		int jet_member_no = sessionUser.getJet_member_no();
		
			ArrayList<HashMap<String, Object>> resultList = classboardService.getMyReservation(jet_member_no);

			
			model.addAttribute("resultList", resultList);
			
			return "classboard/my_reservation_page";
	
		// 로그인 시 나의 예약 페이지 볼 수 있음
		//MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
		//reserveVo.setJet_member_no(sessionUser.getJet_member_no());
		
//	 회원정보 를 주소에 붙이는 건 좋지 않음. 
	}
	
	
		//마이 페이지 - 내가 개설한 클래스
		@RequestMapping("my_class_page.do")
		public String myClassPage(Model model, HttpSession session) {
			MemberVo sessionUser = (MemberVo) session.getAttribute("sessionUser");
			int jet_member_no = sessionUser.getJet_member_no();
			
			ArrayList<HashMap<String, Object>> myresultList = classboardService.getMyClassList(jet_member_no);
			
			model.addAttribute("myresultList", myresultList);
			
			return "classboard/my_class_page";
		}
		
		//마이 페이지 - 개설 클래스 날짜별 보기
		@RequestMapping("my_class_dates_page.do")
		public String myClassDatesPage(Model model, int jet_class_no) {
			
			ArrayList<HashMap<String, Object>> myresultDates = classboardService.getMyClassDatesList(jet_class_no);
			
			model.addAttribute("myresultDates", myresultDates);
			
			return "classboard/my_class_dates_page";
		}
		
		//여기부터 날짜별 디테일 페이지
		@RequestMapping("my_class_dates_detail_page.do")
		public String myClassDatesDetailPage(Model model, int jet_class_detail_no) {
			
			HashMap<String, Object> map = classboardService.getMyClassDetailPage(jet_class_detail_no);
			ArrayList<HashMap<String, Object>> map2 = classboardService.getReserveList(jet_class_detail_no);
			
			model.addAttribute("data", map);
			model.addAttribute("reserve", map2);
			
			return "classboard/my_class_dates_detail_page";
		}
		
		// 별점 및 후기 작성 버튼 누르면 연결
		@RequestMapping("class_review.do")
		public String getClassDatail(int jet_class_detail_no) {
			
			
			
			return "classboard/class_review.do?class_detail_no="+jet_class_detail_no+"";
		}
}

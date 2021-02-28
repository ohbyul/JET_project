package com.cjo.jet.popularBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/popular_board/*")
public class PopularBoardController {

	@RequestMapping("popular_board_page.do")
	public String popularBoardPage() {
		return "popular_board/popular_board_page";
	}

	
	@RequestMapping("popular_food_page.do")
	public String popularFoodPage() {
		return "popular_board/popular_food_page";
	}

	@RequestMapping("popular_cafe_page.do")
	public String popularCafePage() {
		return "popular_board/popular_cafe_page";
	}

}

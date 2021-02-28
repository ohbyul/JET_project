<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
		.tablinks {
			border-radius: 5px 5px 0 0;
			border: 0;
			color: #000;
			background-color: #FFEF85;
			outline: none;
		}
		
		.tablinks.active {
			font-weight: bold;
			color: #fff;
			background-color: orange;
		}
		/* Scroll Animation (sa, 스크롤 애니메이션) */
		.sa {
		  opacity: 0;
		  transition: all .5s ease;
		}
		
		/* 아래에서 위로 페이드 인 */
		.sa-up {
		  transform: translate(0, 100px);
		}
		.sa.show {
			opacity: 1;
			transform: none;
		}
</style>
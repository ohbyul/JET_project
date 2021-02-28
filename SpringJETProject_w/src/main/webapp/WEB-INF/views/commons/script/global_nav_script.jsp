<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
		// Hide Header on on scroll down
		var didScroll;
		var lastScrollTop = 0;
		var delta = 5;
		var navbarHeight = $('header').outerHeight();
		
		$(window).scroll(function(event){
		    didScroll = true;
		});
		
		setInterval(function() {
		    if (didScroll) {
		        hasScrolled();
		        didScroll = false;
		    }
		}, 400);
		
		function hasScrolled() {
		    var st = $(this).scrollTop();
		    
		    // Make sure they scroll more than delta
		    if(Math.abs(lastScrollTop - st) <= delta)
		        return;
		    
		    // If they scrolled down and are past the navbar, add class .nav-up.
		    // This is necessary so you never see what is "behind" the navbar.
		    if (st > lastScrollTop && st > navbarHeight){
		        // Scroll Down
		        $('header').removeClass('fixed-top').addClass('nav_up');
		    } else {
		        // Scroll Up
		        if(st + $(window).height() < $(document).height()) {
		            $('header').removeClass('nav_up').addClass('fixed-top');
		        }
		    }
		    
		    lastScrollTop = st;
		}
		$(function(){
		    var $firstMenu = $('div > ul > li'),
		            $header = $('header');
		    
		    $firstMenu.mouseleave(function(){
		        $header.stop().animate({height:'18vh'},500);
		    })
		    .mouseenter(function(){
		        $header.stop().animate({height:'47.5vh'},500);
		    });
		    
		    
		    
		});
		 // 프로필 사진 네비바 출력 
	    function naviProfile() {
	       
	       var jet_member_no = "${sessionUser.jet_member_no}";	       
	       if(jet_member_no == ""){
	    	   
	       }else{
	    	   var xmlhttp = new XMLHttpRequest();
		       
		       xmlhttp.onreadystatechange = function(){
		          if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
		             var obj = JSON.parse(xmlhttp.responseText);
		             
		             var profileBox = document.getElementById("profileBox");

		             if(obj.imageVoList ==""){
		                var aBox = document.createElement("a");
		                aBox.setAttribute("href","${pageContext.request.contextPath }/mypage/update_mypage.do");
		            	var profileImage = document.createElement("img");
		                profileImage.setAttribute("style","border-radius: 50px;");
		                profileImage.setAttribute("src","${pageContext.request.contextPath}/resources/image/profile_basic.PNG");
		             }else{
		           		var aBox = document.createElement("a");
		                aBox.setAttribute("href","${pageContext.request.contextPath }/mypage/mypage.do");
		                var profileImage = document.createElement("img");
		                profileImage.setAttribute("style","width: 100px;height: 100px;border-radius: 50px;");
		                profileImage.setAttribute("src",obj.imageVoList[0].jet_member_image_link);
		             }
		             
		             aBox.append(profileImage);
		             profileBox.append(aBox);
		             
		          }
		       } 
		       xmlhttp.open("post","${pageContext.request.contextPath }/commons/get_profile_navi.do");
		       xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		       xmlhttp.send("jet_member_no=" + jet_member_no);
	       }   
	    }   
	   
	    
	    //document.body.onload =1 naviProfile;
	    window.addEventListener('load' , naviProfile);		

		

    	
</script>
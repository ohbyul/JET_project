<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#myChatBtn{
	    width: 100px;
	    height: 100px;
	    background-color: black;
	    border-radius :50px;
	    position :fixed;
	    left: 50px;
	    top: 800px;
	    color: white;
	    text-align: center;
	    font-weight: bold;
       }

	#popup_chat{
		
		width: 300px;
		height: 470px;
		
		border: 2px solid black;
		border-radius:20px;
		position :fixed;
		left: 100px;
	    top: 320px;
	    
	
	}
/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	
	#popup_chat_header_main{
		margin:0;
		font-size: 20px;
		height: 65px;
		background-color: #90A84A;
		border-bottom: 1px solid white;
		border-top-left-radius: 20px;
		border-top-right-radius: 20px;
		
	}
	#popup_chat_header_sub{
		margin:0;
		font-size: 15px;
		height: 65px;
		background-color: #90A84A;
		border-bottom: 1px solid white;
		border-top-left-radius: 20px;
		border-top-right-radius: 20px;
	}
/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	
	#popup_chat_body_main{
		margin:0;
		height: 330px;
		background-color: #90A84A;
		overflow-y: scroll;
	}
	#popup_chat_body_sub{
		margin:0;
		height: 330px;
		background-color: #90A84A;
		overflow-y: scroll;
		
	}
		
	
/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	#popup_chat_footer_main{
		margin:0;
		height: 71px;
		background-color: #88AA50;
		border-bottom-left-radius: 20px;
		border-bottom-right-radius: 20px;
		
	}
	#popup_chat_footer_sub{
		margin:0;
		height: 71px;
		background-color: white;
		border-bottom-left-radius: 20px;
		border-bottom-right-radius: 20px;
		
	}
	#ad_box{
		width: 100%;
		height: 71px;
  		/*display: inline;*/
  		border-bottom-left-radius: 20px;
		border-bottom-right-radius: 20px;
	}
	
</style>
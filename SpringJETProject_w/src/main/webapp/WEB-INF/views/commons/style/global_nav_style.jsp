 <%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
 <style>
	header{
		position: absolute;
		overflow: hidden;
		top : 0;
		transition: top 0.2s ease-in-out;
	}
	#global_nav_ul{
		padding: 0;
	}
	#global_nav_ul li{
		display: inline;
		font-family: "NotoSansKR";
		font-weight: 400;
		text-decoration: none;
		margin: 0rem 0.5rem 0rem 0.5rem;
	}
	#global_nav_ul li a{
		text-decoration: none;
		color: #333333;
	}
	.navbar-top{
		color: #ffffff;
		font-family: "NotoSansKR";
		text-decoration:none;
		font-weight: 500;
		font-size: 1.2rem;
	}
	
	.navbar-top:hover {
		color: #00802b;
	}
	
	#nav_main div{
		display: block;
		padding: 0rem 0.7rem 0rem 0.7rem;
	}
	#nav_main{
		list-style: none;
	}
	#nav_main ul{
		margin: 0;
		padding: 0;
	}
	#nav_main li{
		list-style: none;
	}
	#detail_menu{
		position: absolute;
		width: 100%;
		padding: 0;
		margin: 0;
	}
	#nav_main ul:hover #detail_menu{
		
	}
	#detail_menu div ul{
		text-align: center;
	}
	#detail_menu div ul li{
		list-style: none;
		margin-top: 0.5rem;
	}
	#detail_menu div ul li a{
		text-decoration: none;
		color: #ffffff;
		font-family: "NotoSansKR";
		font-weight: 400;
		
	}	
	    input[id="menuicon"]{ 
           display: none;
              
        }
        /*좌측 햄버거*/   
        
        
        input[id="menuicon"] + label{
                display: block;
                width: 20px;
                height: 15px;
                position: fixed;
                cursor: pointer;
                top: 20px ;
                right: 1%;
                transition: all .35s;
                
            }
        input[id="menuicon"]:checked + label{
                z-index: 2;
                
            }

       input[id="menuicon"] + label span{
               display:block;
               position:absolute;
               width:100%;
               height:2px;
               border-radius:30px;
               background:#FF9436;
               transition:all .35s;
           } 
       input[id="menuicon"] + label span:nth-child(1){
               top:0;
           }
       input[id="menuicon"] + label span:nth-child(2){
               top:50%;
               transform: translateY(-50%);
           }
       input[id="menuicon"] + label span:nth-child(3){
               bottom: 0;
           }
       input[id="menuicon"]:checked + label {
               z-index:2;
               }
       input[id="menuicon"]:hover + label span:nth-child(1) {
           background-color: #ABF200;
       }
       input[id="menuicon"]:hover + label span:nth-child(2) {
           background-color: #ABF200;
       }
       input[id="menuicon"]:hover + label span:nth-child(3) {
           background-color: #ABF200;
       }
       input[id="menuicon"]:checked + label span {
               background:#FF9436;
               }
       input[id="menuicon"]:checked + label span:nth-child(1) {
               top:50%;
               transform:translateY(-50%) rotate(225deg);
               }
       input[id="menuicon"]:checked + label span:nth-child(2) {
               opacity:0;
               }
       input[id="menuicon"]:checked + label span:nth-child(3) {
               bottom:50%;
               transform:translateY(50%) rotate(315deg);
       }	
        div[class = "sidebar"]{
        width: 260px;
        height: 700px;      
        background-color: #FF9436;
        right: 0;
        position: fixed;
        top: -1000px;
        z-index: 1;
        transition: all .2s;
		}
		input[id="menuicon"]:checked + label + div{
            top: 57px;
            box-shadow : rgba(0,0,0,0.5) 0 0 0 9999px, rgba(0,0,0,0.5) 2px 2px 3px 3px;
            }
        
        #sidebar_Top{
            width: 100%;
            height: 240px;
            font-weight: bold;
            border-bottom: 1px solid#D5D5D5;
            text-align: center;

        }
        /*비로그인 사이드 상단*/
        .side_login{
            text-align: center;
        }
        .side_login li{
            display: inline block;
            list-style: none;
            float: left;
            margin-left: 15px;
        }
        .side_login a{
            color: #000;
            text-decoration: none;
            letter-spacing: 3px;
            font-weight: bold;
            font-size: 14px;
            position: relative;
            padding: 6px 12px;
            font-family: 'Nanum Gothic Coding', monospace;
        }
        .side_login a::after{
            content: "";
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 0;
            height: 2px;
            background:  #ABF200;
            transition: all .1s ease-out;
        }
        .side_login a:hover::after{
            width: 100%;
        }
        .sidebar_Mid_Menu{
            text-align: center;
            margin-left: -15px;
            margin-top: 20px;
        }
        .sidebar_Mid_Menu li{
            list-style: none;
            display: inline block;
            margin-bottom: 20px;
            float:left;
        }
        .sidebar_Mid_Menu a{
            color: #000;
            text-decoration: none;
            font-size: 16px;
            font-weight: bold;
            letter-spacing: 3px; 
            position: relative;
            padding: 6px 12px;
            font-family: 'Nanum Gothic Coding', monospace;
        }
        .sidebar_Mid_Menu a::after{
            content: "";
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 0;
            height: 2px;
            background:  #ABF200;
            transition: all .1s ease-out;
        }
        .sidebar_Mid_Menu a:hover::after{
            width: 100%;
            color: #fff;
        }
        .hamburger_left li a{
        	text-decoration:none;
        	color:#000;
        }
        .nav_up {
            top: -47.5vh;
        }
		/*--날씨 */
		.weather{
			background-color:white;
			display : inline;
			color: #04B45F;
			width: 85px;
		}
		.CurrIcon, .CurrTemp{
			display: inline-block;
			font-size: 1.375rem;
			text-align: center;
		}
		.CurrIcon{
			margin-right: 2px;
		}
		.City{
			font-size: 0.938rem;
			text-align: right;
			font-family: "NotoSansKR"";
			font-weight: 500;
		}

 -----------------------------footer-------------------------    
         #footer{ 
           text-align:center; 
        } 
        #footer li{ 
           display : inline;  세로나열을 가로나열로 변경   
          
           font:bold 12px Dotum;  폰트 설정 - 12px의 돋움체 굵은 글씨로 표시   
           padding:0 10px; 
        } 
 </style>
    
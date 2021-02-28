<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">

<style type="text/css">
	#main_font_jet{
		font-family: 'Nanum Gothic Coding', monospace;
	}
	      }
      @font-face {
		  font-family: "NanumSquareRound";
		  font-style: normal;
		  font-weight: 300;
		  src: local("NanumSquareRoundL"), /* computer */
		    url("NanumSquareRoundL.eot"), /* IE9 Compat Modes */
		    url("NanumSquareRoundL.eot?#iefix") format("embedded-opentype"), /* IE6-IE8 */
		    url("NanumSquareRoundL.woff2") format("woff2"), /* Modern Browsers */
		    url("NanumSquareRoundL.woff") format("woff"), /* Modern Browsers */
		    url("NanumSquareRoundL.ttf") format("truetype"); /* Safari, Android, iOS */
		}
		@font-face {
		  font-family: "NanumSquareRound";
		  font-style: normal;
		  font-weight: 400;
		  src: local("NanumSquareRoundR"), /* computer */
		    url("NanumSquareRoundR.eot"), /* IE9 Compat Modes */
		    url("NanumSquareRoundR.eot?#iefix") format("embedded-opentype"), /* IE6-IE8 */
		    url("NanumSquareRoundR.woff2") format("woff2"), /* Modern Browsers */    
		    url("NanumSquareRoundR.woff") format("woff"), /* Modern Browsers */
		    url("NanumSquareRoundR.ttf") format("truetype"); /* Safari, Android, iOS */
		}
		@font-face {
		  font-family: "NanumSquareRound";
		  font-style: normal;
		  font-weight: 700;
		  src: local("NanumSquareRoundB"), /* computer */
		    url("NanumSquareRoundB.eot"), /* IE9 Compat Modes */
		    url("NanumSquareRoundB.eot?#iefix") format("embedded-opentype"), /* IE6-IE8 */
		    url("NanumSquareRoundB.woff2") format("woff2"), /* Modern Browsers */
		    url("NanumSquareRoundB.woff") format("woff"), /* Modern Browsers */
		    url("NanumSquareRoundB.ttf") format("truetype"); /* Safari, Android, iOS */
		}
		@font-face {
		  font-family: "NanumSquareRound";
		  font-style: normal;
		  font-weight: 800;
		  src: local("NanumSquareRoundEB"), /* computer */
		    url("NanumSquareRoundEB.eot"), /* IE9 Compat Modes */
		    url("NanumSquareRoundEB.eot?#iefix") format("embedded-opentype"), /* IE6-IE8 */
		    url("NanumSquareRoundEB.woff2") format("woff2"), /* Modern Browsers */
		    url("NanumSquareRoundEB.woff") format("woff"), /* Modern Browsers */
		    url("NanumSquareRoundEB.ttf") format("truetype"); /* Safari, Android, iOS */
		}
		@font-face {
			 font-family: 'NanumBarunGothic';
			 font-weight: 400;
			 src: url(NanumBarunGothicSubset.eot);
			 src: url(NanumBarunGothicSubset.eot?#iefix) format('embedded-opentype'),
			      url(NanumBarunGothicSubset.woff2) format('woff2'),
			      url(NanumBarunGothicSubset.woff) format('woff'),
			      url(NanumBarunGothicSubset.ttf) format('truetype');
		}
		@font-face {
		 font-family: 'NanumBarunGothic';
		 font-weight: 700;
		 src: url(NanumBarunGothicBoldSubset.eot);
		 src: url(NanumBarunGothicBoldSubset.eot?#iefix) format('embedded-opentype'),
		      url(NanumBarunGothicBoldSubset.woff2) format('woff2'),
		      url(NanumBarunGothicBoldSubset.woff) format('woff'),
		      url(NanumBarunGothicBoldSubset.ttf) format('truetype');
		}
		@font-face {
		 font-family: 'NanumBarunGothic';
		 font-weight: 300;
		 src: url(NanumBarunGothicLightSubset.eot);
		 src: url(NanumBarunGothicLightSubset.eot?#iefix) format('embedded-opentype'),
		      url(NanumBarunGothicLightSubset.woff2) format('woff2'),
		      url(NanumBarunGothicLightSubset.woff) format('woff'),
		      url(NanumBarunGothicLightSubset.ttf) format('truetype');
		}
		@font-face {
		 font-family: 'NanumBarunGothic';
		 font-weight: 200;
		 src: url(NanumBarunGothicUltraLightSubset.eot);
		 src: url(NanumBarunGothicUltraLightSubset.eot?#iefix) format('embedded-opentype'),
		      url(NanumBarunGothicUltraLightSubset.woff2) format('woff2'),
		      url(NanumBarunGothicUltraLightSubset.woff) format('woff'),
		      url(NanumBarunGothicUltraLightSubset.ttf) format('truetype');
		}
		@font-face {
		  font-family: 'NotoSansKR';
		  font-style: normal;
		  font-weight: 250;
		  src: local('NotoSansKR-Thin'), 
		       url('//cdn.jsdelivr.net/korean-webfonts/latest/corps/google/NotoSansKR/NotoSansKR-Thin-Hangul.woff2') format('woff2'), 
		       url('//cdn.jsdelivr.net/korean-webfonts/latest/corps/google/NotoSansKR/NotoSansKR-Thin-Hangul.woff') format('woff');
		  font-stretch: normal;
		  unicode-range: U+0021-33FF,U+A000-F8FF,U+FB00-F251;
		}
		
		@font-face {
		  font-family: 'NotoSansKR';
		  font-style: normal;
		  font-weight: 250;
		  src: local('NotoSansKR-Thin'), 
		       url('//cdn.jsdelivr.net/korean-webfonts/latest/corps/google/NotoSansKR/NotoSansKR-Thin-Hanja.woff2') format('woff2'), 
		       url('//cdn.jsdelivr.net/korean-webfonts/latest/corps/google/NotoSansKR/NotoSansKR-Thin-Hanja.woff') format('woff');
		  font-stretch: normal;
		  unicode-range: U+4E00-9F95,U+F900-FA0B;
		}
		
		/* Light */
		@font-face {
		  font-family: 'NotoSansKR';
		  font-style: normal;
		  font-weight: 300;
		  src: local('NotoSansKR-Light'), 
		       url('//cdn.jsdelivr.net/korean-webfonts/latest/corps/google/NotoSansKR/NotoSansKR-Light-Hangul.woff2') format('woff2'), 
		       url('//cdn.jsdelivr.net/korean-webfonts/latest/corps/google/NotoSansKR/NotoSansKR-Light-Hangul.woff') format('woff');
		  font-stretch: normal;
		  unicode-range: U+0021-33FF,U+A000-F8FF,U+FB00-F251;
		}
		
		@font-face {
		  font-family: 'NotoSansKR';
		  font-style: normal;
		  font-weight: 300;
		  src: local('NotoSansKR-Light'),
		       url('//cdn.jsdelivr.net/korean-webfonts/latest/corps/google/NotoSansKR/NotoSansKR-Light-Hanja.woff2') format('woff2'), 
		       url('//cdn.jsdelivr.net/korean-webfonts/latest/corps/google/NotoSansKR/NotoSansKR-Light-Hanja.woff') format('woff');
		  font-stretch: normal;
		  unicode-range: U+4E00-9F95,U+F900-FA0B;
		}
		
		/* DemiLight */
		@font-face {
		  font-family: 'NotoSansKR';
		  font-style: normal;
		  font-weight: 350;
		  src: local('NotoSansKR-DemiLight'),
		       url('//cdn.jsdelivr.net/korean-webfonts/latest/corps/google/NotoSansKR/NotoSansKR-DemiLight-Hangul.woff2') format('woff2'), 
		       url('//cdn.jsdelivr.net/korean-webfonts/latest/corps/google/NotoSansKR/NotoSansKR-DemiLight-Hangul.woff') format('woff');
		  font-stretch: normal;
		  unicode-range: U+0021-33FF,U+A000-F8FF,U+FB00-F251;
		}
		
		
		@font-face {
		  font-family: 'NotoSansKR';
		  font-style: normal;
		  font-weight: 350;
		  src: local('NotoSansKR-DemiLight'),
		       url('//cdn.jsdelivr.net/korean-webfonts/latest/corps/google/NotoSansKR/NotoSansKR-DemiLight-Hanja.woff2') format('woff2'), 
		       url('//cdn.jsdelivr.net/korean-webfonts/latest/corps/google/NotoSansKR/NotoSansKR-DemiLight-Hanja.woff') format('woff');
		  font-stretch: normal;
		  unicode-range: U+4E00-9F95,U+F900-FA0B;
		}
		
		/* Regular */
		@font-face {
		  font-family: 'NotoSansKR';
		  font-style: normal;
		  font-weight: 400;
		  src: local('NotoSansKR-Regular'), 
		       url('//cdn.jsdelivr.net/korean-webfonts/latest/corps/google/NotoSansKR/NotoSansKR-Regular-Hangul.woff2') format('woff2'), 
			   url('//cdn.jsdelivr.net/korean-webfonts/latest/corps/google/NotoSansKR/NotoSansKR-Regular-Hangul.woff') format('woff');
		  font-stretch: normal;
		  unicode-range: U+0021-33FF,U+A000-F8FF,U+FB00-F251;
		}
		
		@font-face {
		  font-family: 'NotoSansKR';
		  font-style: normal;
		  font-weight: 400;
		  src: local('NotoSansKR-Regular'),
		       url('//cdn.jsdelivr.net/korean-webfonts/latest/corps/google/NotoSansKR/NotoSansKR-Regular-Hanja.woff2') format('woff2'), 
		       url('//cdn.jsdelivr.net/korean-webfonts/latest/corps/google/NotoSansKR/NotoSansKR-Regular-Hanja.woff') format('woff');
		  font-stretch: normal;
		  unicode-range: U+4E00-9F95,U+F900-FA0B;
		}
		
		/* Medium */
		@font-face {
		  font-family: 'NotoSansKR';
		  font-style: normal;
		  font-weight: 500;
		  src: local('NotoSansKR-Medium'), 
		       url('//cdn.jsdelivr.net/korean-webfonts/latest/corps/google/NotoSansKR/NotoSansKR-Medium-Hangul.woff2') format('woff2'), 
		       url('//cdn.jsdelivr.net/korean-webfonts/latest/corps/google/NotoSansKR/NotoSansKR-Medium-Hangul.woff') format('woff');
		  font-stretch: normal;
		  unicode-range: U+0021-33FF,U+A000-F8FF,U+FB00-F251;
		}
		
		@font-face {
		  font-family: 'NotoSansKR';
		  font-style: normal;
		  font-weight: 500;
		  src: local('NotoSansKR-Medium'),
		       url('//cdn.jsdelivr.net/korean-webfonts/latest/corps/google/NotoSansKR/NotoSansKR-Medium-Hanja.woff2') format('woff2'), 
		       url('//cdn.jsdelivr.net/korean-webfonts/latest/corps/google/NotoSansKR/NotoSansKR-Medium-Hanja.woff') format('woff');
		  font-stretch: normal;
		  unicode-range: U+4E00-9F95,U+F900-FA0B;
		}
		
		/* Bold */
		@font-face {
		  font-family: 'NotoSansKR';
		  font-style: normal;
		  font-weight: 700;
		  src: local('NotoSansKR-Bold'),
		       url('//cdn.jsdelivr.net/korean-webfonts/latest/corps/google/NotoSansKR/NotoSansKR-Bold-Hangul.woff2') format('woff2'), 
		       url('//cdn.jsdelivr.net/korean-webfonts/latest/corps/google/NotoSansKR/NotoSansKR-Bold-Hangul.woff') format('woff');
		  font-stretch: normal;
		  unicode-range: U+0021-33FF,U+A000-F8FF,U+FB00-F251;
		}
		
		@font-face {
		  font-family: 'NotoSansKR';
		  font-style: normal;
		  font-weight: 700;
		  src: local('NotoSansKR-Bold'),
		       url('//cdn.jsdelivr.net/korean-webfonts/latest/corps/google/NotoSansKR/NotoSansKR-Bold-Hanja.woff2') format('woff2'), 
		       url('//cdn.jsdelivr.net/korean-webfonts/latest/corps/google/NotoSansKR/NotoSansKR-Bold-Hanja.woff') format('woff');
		  font-stretch: normal;
		  unicode-range: U+4E00-9F95,U+F900-FA0B;
		}
		
		/* Black */
		@font-face {
		  font-family: 'NotoSansKR';
		  font-style: normal;
		  font-weight: 900;
		  src: local('NotoSansKR-Black'),
		       url('//cdn.jsdelivr.net/korean-webfonts/latest/corps/google/NotoSansKR/NotoSansKR-Black-Hangul.woff2') format('woff2'), 
		       url('//cdn.jsdelivr.net/korean-webfonts/latest/corps/google/NotoSansKR/NotoSansKR-Black-Hangul.woff') format('woff');
		  font-stretch: normal;
		  unicode-range: U+0021-33FF,U+A000-F8FF,U+FB00-F251;
		}
		
		
		@font-face {
		  font-family: 'NotoSansKR';
		  font-style: normal;
		  font-weight: 900;
		  src: local('NotoSansKR-Black'), 
		       url('//cdn.jsdelivr.net/korean-webfonts/latest/corps/google/NotoSansKR/NotoSansKR-Black-Hanja.woff2') format('woff2'), 
		       url('//cdn.jsdelivr.net/korean-webfonts/latest/corps/google/NotoSansKR/NotoSansKR-Black-Hanja.woff') format('woff');
		  font-stretch: normal;
		  unicode-range: U+4E00-9F95,U+F900-FA0B;
		}
</style>
</head>
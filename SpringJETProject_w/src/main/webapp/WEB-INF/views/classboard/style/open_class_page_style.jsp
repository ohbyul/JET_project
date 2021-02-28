<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
    .map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
      
   @font-face{
    font-family:'Daum';
    font-style:normal;
    font-weight:400;
    src:url('//cdn.jsdelivr.net/korean-webfonts/1/corps/daum/Daum/Daum-Regular.woff2') format('woff2'),
        url('//cdn.jsdelivr.net/korean-webfonts/1/corps/daum/Daum/Daum-Regular.woff') format('woff');
   }
   @font-face{
    font-family:'Daum';
    font-style:normal;
    font-weight:700;
    src:url('//cdn.jsdelivr.net/korean-webfonts/1/corps/daum/Daum/Daum-SemiBold.woff2') format('woff2'),
        url('//cdn.jsdelivr.net/korean-webfonts/1/corps/daum/Daum/Daum-SemiBold.woff') format('woff');
   }

</style>
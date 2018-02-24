<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html lang="zh-CN">
<head>
<link rel="stylesheet" href="/ins/resources/css/common.css">
<link rel="stylesheet" href="/ins/resources/css/style.css">
<script type="text/javascript" src="/ins/resources/js/jquery.min.js"></script>
<script type="text/javascript"
	src="/ins/resources/js/jquery.SuperSlide.js"></script>

<title>3D虚拟辅导员后台管理</title>
</head>
<body>
	<div class="top">
		<div id="top_t">
			<div id="logo" class="fl"></div>
			<div id="photo_info" class="fr">
				<div id="photo" class="fl">
					<a href="#"><img src="/ins/resources/images/a.png" alt=""
						width="60" height="60"></a>
				</div>
				<div id="base_info" class="fr">
					<div class="help_info">
						<a href="1" id="hp">&nbsp;</a> <a href="2" id="gy">&nbsp;</a> <a
							href="3" id="out">&nbsp;</a>
					</div>
					<div class="info_center">${sessionScope.user.userName}</div>
				</div>
			</div>
		</div>
		<div id="side_here">
			<div id="side_here_l" class="fl"></div>
			<div id="here_area" class="fl">
				当前位置：<a href="index.jsp" style="margin-left: 1000px;">返回主页</a>
			</div>
		</div>
	</div>
	<div class="side">
		<div class="sideMenu" style="margin: 0 auto">

			<h3>用户管理</h3>
			<ul>
				<li><a href="insertUser.jsp" target="right">新增用户</a></li>
				<li><a href="queryUser.jsp" target="right">用户查询与修改</a></li>
			</ul>

			<h3>通知管理</h3>
			<ul>
				<li><a href="" target="right">发布通知</a></li>
				<li><a href="" target="right">通知查询与修改</a></li>

			</ul>
			<h3>语料库管理</h3>
			<ul>
				<li><a href="" target="right">语句增加</a></li>
				<li><a href="" target="right">语句查询与修改</a></li>

			</ul>
			<h3>人脸识别数据库管理</h3>
			<ul>
				<li><a href="insertFace.jsp" target="right">新增面部照片</a></li>
				<li><a href="queryFace.jsp" target="right">面部信息查询与修改</a></li>
			</ul>

		</div>
	</div>
	<div class="main">
		<iframe name="right" id="rightMain" src="" frameborder="no"
			scrolling="auto" width="100%" height="auto" allowtransparency="true"></iframe>
	</div>
	<div class="bottom">
		<div id="bottom_bg">版权</div>
	</div>
	<div class="scroll">
		<a href="javascript:;" class="per" title="使用鼠标滚轴滚动侧栏"
			onclick="menuScroll(1);"></a> <a href="javascript:;" class="next"
			title="使用鼠标滚轴滚动侧栏" onclick="menuScroll(2);"></a>
	</div>
</body>
<script type="text/javascript">
  $(function(){
      $(".sideMenu").slide({
         titCell:"h3", 
         targetCell:"ul",
         defaultIndex:0, 
         effect:'slideDown', 
         delayTime:'500' , 
         trigger:'click', 
         triggerTime:'150', 
         defaultPlay:true, 
         returnDefault:false,
         easing:'easeInQuint',
         endFun:function(){
              scrollWW();
         }
       });
      $(window).resize(function() {
          scrollWW();
      });
  });
  function scrollWW(){
    if($(".side").height()<$(".sideMenu").height()){
       $(".scroll").show();
       var pos = $(".sideMenu ul:visible").position().top-38;
       $('.sideMenu').animate({top:-pos});
    }else{
       $(".scroll").hide();
       $('.sideMenu').animate({top:0});
       n=1;
    }
  } 

var n=1;
function menuScroll(num){
  var Scroll = $('.sideMenu');
  var ScrollP = $('.sideMenu').position();
  /*alert(n);
  alert(ScrollP.top);*/
  if(num==1){
     Scroll.animate({top:ScrollP.top-38});
     n = n+1;
  }else{
    if (ScrollP.top > -38 && ScrollP.top != 0) { ScrollP.top = -38; }
    if (ScrollP.top<0) {
      Scroll.animate({top:38+ScrollP.top});
    }else{
      n=1;
    }
    if(n>1){
      n = n-1;
    }
  }
}
  </script>
</html>





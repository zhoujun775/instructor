<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>虚拟辅导员</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="/ins/resources/css/styles.css" type="text/css" rel="stylesheet"> 
<script src="/ins/resources/js/jquery-1.4.2.js" type="text/javascript"></script>
<script src="/ins/resources/js/js-func.js" type="text/javascript"></script>
<script src="/ins/resources/js/jquery.jcarousel.js" type="text/javascript"></script>

</head>
<body>

<div id="bg">
<div id="logo"><a href="#">3D虚拟辅导员</a>
		<h2><a href="#">3D Virtual instructor</a></h2>
		<label class='user'>欢迎您，管理员&nbsp;<strong>${sessionScope.user.userName}</strong>！&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
</div>
<div id="main">
<!-- header begins -->
<div id="header">	
	
	 <!-- Navigation -->
			<div id="navigation">
				<ul>
				    <li class="first"><a href="index2.jsp">主&nbsp;&nbsp;页</a></li>
					<li><a href="notice2.jsp">通知公告</a></li>
				    <li><a href="http://localhost:8080/xuni/MyAjaxTest.jsp">事务咨询</a></li>
				    <li><a href="">人脸识别</a></li>
				    <li><a href="#" onclick = "help()">使用帮助</a></li>
				    	  
					<li><a href="#">后台管理</a></li>
				</ul>
			</div>
			<!-- End Navigation -->
	
	<!-- Slider -->
		<div id="slider">
			<a id="slider-prev">&nbsp;</a>
			<div class="slider-content">
				<ul>
				    <li><a href="http://localhost:8080/xuni/introduce.jsp"><img src="/ins/resources/images/01.png" alt="" /></a></li>
				    <li><a href="http://localhost:8080/xuni/MyAjaxTest.jsp"><img src="/ins/resources/images/02.png" alt="" /></a></li>
				    <li><img src="/ins/resources/images/03.png" alt="" /></li>
				    <li><img src="/ins/resources/images/04.png" alt="" /></li> 
				</ul>
			</div>		
			<a id="slider-next">&nbsp;</a>
			<div class="slider-pagination">
				<ul>
				    <li><a href="#">1</a></li>
				    <li><a href="#">2</a></li>
				    <li><a href="#">3</a></li>
				    <li><a href="#">4</a></li>
				</ul>
			</div>			
		</div>
	<!-- End Slider -->
</div>       

<!-- header ends -->
<!-- content begins -->
<div id="content_bg">
<div id="column_box">
      <div id="bg_left"></div>
      <div id="column1">
        <h2>Tips 1</h2>
							<img src="/ins/resources/images/img1.png" alt="" title="" style="float: left; padding-right: 20px;"/>
							<p>点击通知公告可查看最近通知哟~ <br />

</p>
      </div>
      <div id="column2">
        <h2>Tips 2</h2>
							<img src="/ins/resources/images/img2.png" alt="" title="" style="float: left; padding-right: 20px;"/>
							<p>点击自我介绍可3D虚拟辅导员就会作介绍哦~<br />
</p>
      </div>
      <div id="column3">
       <h2>Tips 3</h2>
							<img src="/ins/resources/images/img3.png" alt="" title="" style="float: left; padding-right: 20px;"/>
							<p>点击事务咨询就可以和她聊天啦！<br />
</div>
</div>
</div>
</div>
<!-- footer begins -->
<div id="footer">
    <div id="footer_top">
    <div id="footer_column1">
							<h3>最近通知</h3>
							<div class="footer_text">
								<div class="foot_pad">
			                   		<p><a href="">通知1</a></p><br/>
			                   		<p><a href="">通知1</a></p><br/>
			                   		<p><a href="">通知1</a></p><br/>
			                       
			                        
			                    </div>
							</div>
						</div>
						<div id="footer_column2">
							<h3>分享</h3>
							<div class="footer_text">
								<div class="foot_pad">
			                   		<div class="link1"><a href="#">QQ</a></div>
			                        <div class="link2"><a href="#">微博</a></div>
			                        <div class="link3"><a href="#">微信</a></div>
			                        
			                    </div>
							</div>
						</div>
						<div id="footer_column3">
							<h3>相关链接</h3>
							<div class="footer_text">
								<div class="foot_pad">
			                    	<ul class="ls">
			                        	<li><a href="http://portal.ccnu.edu.cn/">华中师范大学信息门户</a></li>
			                            <li><a href="http://122.204.187.9/jwglxt/xtgl/index_initMenu.html">素质课程管理平台</a></li>
			                            <li><a href="http://jwc.ccnu.edu.cn">华中师范大学教务处</a></li>
			                            <li><a href="http://ccnu.benke.chaoxing.com/">尔雅课登录</a></li>
			                           
			                        </ul>
			                    </div>
							</div>
						</div>
						<div class="clear"></div>
					</div>
			<div id="footer_bot">
				<p>designed by V-team</p>
			</div></div>
<!-- footer ends -->


</div>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div></body>
</html>

<script>function lianxi()
{
	alert("contact us : 123456789");
}

function help()
{
	alert("请看页面~");
}
</script>